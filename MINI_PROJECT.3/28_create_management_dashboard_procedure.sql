USE sql_store;
DROP PROCEDURE IF EXISTS sp_generate_management_dashboard;
DELIMITER $$
CREATE PROCEDURE sp_generate_management_dashboard()
BEGIN
	SELECT*
	FROM client_360_summary cs
	WHERE total_outstanding_balance>(
		SELECT
			AVG(total_outstanding_balance)
		FROM client_360_summary
		WHERE state=cs.state
	);
	SELECT
		client_id,
		client_name,
		employee_id,
		manager_name,
		overdue_invoices,
		payment_risk,
		collection_priority
	FROM client_360_summary cs
	WHERE (cs.overdue_invoices)>(
	  SELECT
		AVG(overdue_invoices)
	  FROM client_360_summary
	  WHERE employee_id=cs.employee_id
	);
	SELECT
		cs.state,
		cs.payment_risk,
		COUNT(cs.client_id) AS number_of_clients,
		SUM(cs.total_sales) AS total_sales,
		SUM(cs.total_outstanding_balance) AS total_outstanding_balance
	FROM client_360_summary cs
	GROUP BY
		cs.state,
		cs.payment_risk WITH ROLLUP;
	SELECT
		cs.office_id,
		cs.office_city,
		cs.employee_id,
		cs.manager_name,
		COUNT(cs.client_id) AS number_of_clients,
		SUM(cs.total_outstanding_balance) AS total_outstanding_balance,
		SUM(
			CASE 
				WHEN cs.payment_risk='High Risk'THEN 1
				ELSE
					0
			END
		) AS high_risk_clients
	FROM client_360_summary cs
	GROUP BY
		cs.office_id,
		cs.office_city,
		cs.employee_id,
		cs.manager_name WITH ROLLUP;
END $$
DELIMITER ;