USE sql_store;
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