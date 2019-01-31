connect hr as SYSDBA
connect ssy/ change_on_install AS SYSDBA;
Alter User HR account unlock;
Alter User HR identified by hr;
Connect HR/hr