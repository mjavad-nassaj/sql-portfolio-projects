USE sql_hr;
TRUNCATE TABLE manager_portfolio_summary;
INSERT INTO manager_portfolio_summary(
	employee_id,
	manager_name,
	office_id,
	office_city,
	office_state,
	number_of_clients,
	total_sales,
	total_invoice_amount,
	total_outstanding_balance,
	high_risk_clients,
	critical_clients,
	avg_client_balance
)
SELECT
	cc.employee_id,
	cc.manager_name,
	cc.office_id,
	cc.office_city,
	cc.office_state,
	cc.number_of_clients,
	cc.total_sales,
	cc.total_invoice_amount,
	cc.total_outstanding_balance,
	cc.high_risk_clients,
	cc.critical_clients,
	cc.avg_client_balance
FROM(
	SELECT
		cs.employee_id,
		cs.manager_name,
		cs.office_id,
		cs.office_city,
		cs.office_state,
		COUNT(cs.client_id) AS number_of_clients,
		SUM(cs.total_sales) AS total_sales,
		SUM(cs.total_invoice_amount) AS total_invoice_amount,
		SUM(cs.total_outstanding_balance) AS total_outstanding_balance,
		SUM(
			CASE
            WHEN cs.payment_risk='High Risk' THEN 1
            ELSE 0
            END
        ) AS high_risk_clients,
		SUM(
		  CASE
			WHEN cs.payment_risk = 'Critical' THEN 1
			ELSE 0
		  END
		) AS critical_clients,
		AVG(cs.total_outstanding_balance) AS avg_client_balance
    FROM sql_store.client_360_summary cs
    GROUP BY
	cs.employee_id,
	cs.manager_name,
	cs.office_id,
	cs.office_city,
	cs.office_state
) cc;