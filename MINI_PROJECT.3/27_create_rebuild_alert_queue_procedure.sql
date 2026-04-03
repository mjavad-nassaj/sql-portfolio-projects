USE sql_store;
DROP PROCEDURE IF EXISTS sp_rebuild_collection_alert_queue;
DELIMITER $$
CREATE PROCEDURE sp_rebuild_collection_alert_queue()
BEGIN
	TRUNCATE TABLE collection_alert_queue;
    INSERT INTO collection_alert_queue(
		client_id,
		client_name,
		employee_id,
		manager_name,
		payment_risk,
		collection_priority,
		total_outstanding_balance,
		overdue_invoices,
		alert_status
    )
    SELECT
		cs.client_id,
		cs.client_name,
		cs.employee_id,
		cs.manager_name,
		cs.payment_risk,
		cs.collection_priority,
		cs.total_outstanding_balance,
		cs.overdue_invoices,
		'Open' AS alert_status
    
    FROM client_360_summary cs
	WHERE cs.collection_priority IN ('High','Urgent')
    ;
END $$
DELIMITER ;