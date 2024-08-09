*&---------------------------------------------------------------------*
*& Report ZALVIDA_LOGALI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zalvida_logali.

"ALV - ABAP List Viewer
"IDA - Integrated Data Access

cl_salv_gui_table_ida=>create( iv_table_name = 'MARA' )->fullscreen( )->display( ).



*TRY.
*cl_salv_gui_table_ida=>create(
*  EXPORTING
*    iv_table_name          =  'MARA'          " Name of table for database access
**    io_gui_container      =                  " Container for ALV display
**    io_calc_field_handler =                  " IDA API: Handler for calculated fields
*  RECEIVING
*    ro_alv_gui_table_ida  =  DATA(go_alv_ida) " ALV with integrated data access (IDA)
*).
*
*go_alv_ida->fullscreen( )->display( ).
*
*CATCH cx_salv_db_connection.          " Error connecting to database
*CATCH cx_salv_db_table_not_supported. " DB table / view is not supported
*CATCH cx_salv_ida_contract_violation. " IDA API contract violated by caller
*
*ENDTRY.
