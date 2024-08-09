*&---------------------------------------------------------------------*
*& Report ZCALLFM_LOGALI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZCALLFM_LOGALI.

DATA gt_flights TYPE sflight_tab2.

CALL FUNCTION 'ZFM_FLIGHTS_LOGALI'
  EXPORTING
    iv_carrid  =  'AA'          " Airline Code
    iv_list   =  abap_true      " General Flag
  IMPORTING
    et_flights = gt_flights     " Internal Structure for Table sflight
  .

cl_demo_output=>display( gt_flights ).
