-- ==========================
-- TRANSACTION & SAFETY COMMANDS
-- ==========================

SET SQL_SAFE_UPDATES = 0;
-- Disables safe update mode.
-- Allows UPDATE and DELETE without a key column in WHERE clause.

SET AUTOCOMMIT = 0;
-- Starts manual transaction control.
-- Changes are not permanently saved until COMMIT.

ROLLBACK;
-- Undoes changes made since the last COMMIT.
-- Works only for transactional operations that have not been committed.

-- Permanently save all changes made
-- during the current transaction
COMMIT;