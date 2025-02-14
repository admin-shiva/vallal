@echo off

echo Backing up your Database....

set "MYSQL_HOST=localhost"
set "MYSQL_USER=root"
set "MYSQL_PASSWORD=Root@345"
set "DATABASE_NAME=dbtemples"
set datetime=%DATE:/=-%%time:~0,2%%time:~3,2%%time:~6,2%
::set datetime=%DATE:/=-%_%TIME_RAW:~0,2%:%TIME_RAW:~3,2%:%TIME_RAW:~6,2%
set "BACKUP_DIR=C:\Users\Dell\Downloads\db-backs\"
echo %datetime%

:: Run the mysqldump command to back up the database
mysqldump -u %MYSQL_USER% -p%MYSQL_PASSWORD% %DATABASE_NAME% > "%BACKUP_DIR%\padmanabhaswamy_%datetime%.sql"

::mysqldump -u root %DATABASE_NAME% | gzip > "BACKUP_DIR=C:\Users\Dell\Downloads\db-backs\mysql_backup.sql%Datestamp%.gz"

::mysqldump -u %MYSQL_USER% -p%MYSQL_PASSWORD% %DATABASE_NAME% | gzip > "%BACKUP_DIR%\padmanabhaswamy_%datetime%.sql.gz"

echo Padmanabhaswamy Database Backup File Successfully Dumped at %time%!

:: Delete backups older than 30 days
ForFiles /p "C:\Users\Dell\Downloads\db-backs" /s /d -30 /c "cmd /c del /q @file"
if %errorlevel% neq 0 (
    echo No old backup files found to delete.
) else (
    echo 30days Older Padmanabhaswamy Databases have been Deleted....
)

::pause
endlocal