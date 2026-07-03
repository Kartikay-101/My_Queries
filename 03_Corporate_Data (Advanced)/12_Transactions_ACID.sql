
		-- Transactions & ACID
		-- A transaction is a sequence of SQL statements executed as a single logical unit. It ensures that either all operations succeed (COMMIT) or all are undone (ROLLBACK).
        
    /*  ACID
        ATOMIC		= All operations succeed or none do.
        Consistency	= Database remains valid before and after the transaction.
        Isolation	= Concurrent transactions don't interfere with each other.
        Durability	= Committed changes survive failures. */
        
START TRANSACTION;

ROLLBACK;
COMMIT;
SAVEPOINT DQ;
ROLLBACK TO DQ;

SET AUTOCOMMIT = 0;
SELECT @@autocommit;