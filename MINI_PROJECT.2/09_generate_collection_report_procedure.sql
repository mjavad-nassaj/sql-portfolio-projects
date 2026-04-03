USE sql_invoicing;
DROP PROCEDURE IF EXISTS generate_collection_report;
DELIMITER $$
CREATE PROCEDURE generate_collection_report()
BEGIN
	TRUNCATE TABLE client_collection_summary;
	INSERT INTO client_collection_summary (
		client_id,
		client_name,
		city,
		state,
		total_invoices,
		total_invoice_amount,
		total_paid_amount,
		total_outstanding_balance,
		paid_invoices,
		partially_paid_invoices,
		overdue_invoices,
		risk_level
	)
	SELECT
		c.client_id,
		iss.client_name,
		c.city,
		c.state,
		COUNT(iss.invoice_id) AS total_invoices,
		SUM(iss.invoice_total) AS total_invoice_amount,
		SUM(iss.total_payments) AS total_paid_amount,
		SUM(iss.debt_balance) AS total_outstanding_balance,
		SUM(
			CASE
				WHEN iss.invoice_status = 'Paid' THEN 1
				ELSE 0
			END
		) AS paid_invoices,
		SUM(
			CASE
				WHEN iss.invoice_status = 'Partially Paid' THEN 1
				ELSE 0
			END
		) AS partially_paid_invoices,
		SUM(
			CASE
				WHEN iss.invoice_status = 'Overdue' THEN 1
				ELSE 0
			END
		) AS overdue_invoices,
		CASE
			WHEN SUM(iss.debt_balance) > 300 THEN 'High Risk'
			WHEN SUM(iss.debt_balance) BETWEEN 100 AND 300 THEN 'Medium Risk'
			ELSE 'Low Risk'
		END AS risk_level
	FROM clients c
	JOIN invoice_status_summary iss
		USING (client_id)
	GROUP BY
		c.client_id,
		iss.client_name,
		c.city,
		c.state;
	SELECT
		ccs.client_id,
		ccs.client_name,
		ccs.total_outstanding_balance,
		ccs.risk_level
	FROM client_collection_summary ccs
	WHERE ccs.total_outstanding_balance > (
		SELECT 
			AVG(total_outstanding_balance)
		FROM client_collection_summary
	)
	ORDER BY
		ccs.client_id;
	SELECT
		iss.client_id,
		iss.client_name,
		COUNT(*) AS overdue_invoices,
		SUM(iss.debt_balance) AS total_outstanding_balance
	FROM invoice_status_summary iss
	WHERE iss.invoice_status = 'Overdue'
	GROUP BY
		iss.client_id,
		iss.client_name
	HAVING
		COUNT(*) >= 2
		AND SUM(iss.debt_balance) > 100
	ORDER BY
		iss.client_id DESC;
	SELECT
		ccs.state,
		ccs.risk_level,
		COUNT(*) AS number_of_clients,
		SUM(ccs.total_outstanding_balance) AS total_outstanding_balance,
		SUM(ccs.total_invoice_amount) AS total_invoice_amount
	FROM 
		client_collection_summary ccs
	GROUP BY
		ccs.state,
		ccs.risk_level WITH ROLLUP;
END $$
DELIMITER ;