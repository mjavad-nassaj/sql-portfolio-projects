USE rossmann_sales_mysql;
DELIMITER $$
DROP TRIGGER IF EXISTS trg_store_monthly_summary_update_audit $$
CREATE TRIGGER trg_store_monthly_summary_update_audit
AFTER UPDATE
ON store_monthly_summary
FOR EACH ROW
BEGIN
	INSERT INTO audit_table
    (
        table_name,
        operation_type,
        store_id,
        old_total_sales,
        new_total_sales
    )
    VALUES
	(
		'store_monthly_summary',
		'UPDATE',
		OLD.store,
		OLD.total_sales,
		NEW.total_sales
	);
END $$
DELIMITER ;

DELIMITER $$
DROP TRIGGER IF EXISTS trg_store_monthly_summary_delete_audit $$
CREATE TRIGGER trg_store_monthly_summary_delete_audit
AFTER DELETE
ON store_monthly_summary
FOR EACH ROW
BEGIN
	INSERT INTO audit_table
    (
        table_name,
        operation_type,
        store_id,
        old_total_sales,
        new_total_sales
    )
    VALUES
    (
        'store_monthly_summary',
        'DELETE',
        OLD.store,
        OLD.total_sales,
        NULL
    );
END $$
DELIMITER ;