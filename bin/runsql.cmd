
@call %1

echo Processing %2 on %ORA_TNS% 
echo ===================================================== >> common.log
echo Processing %2 on %ORA_TNS% >> common.log
echo ----------------------------------------------------- >> common.log

set SPOOL_FILE=log\%ORA_TNS%.log

%SQLPLUS_BIN% -s -l %EXCELLENT_OWNER%/%EXCELLENT_PASS%@%ORA_TNS% @%2


type %SPOOL_FILE% >> common.log
