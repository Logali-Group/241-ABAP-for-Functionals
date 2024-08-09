*&---------------------------------------------------------------------*
*& Report ZABAPCL_LOGALI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabapcl_logali.

PARAMETERS pa_plnt TYPE werks_d OBLIGATORY.

*DATA go_products TYPE REF TO zcl_01_logali.
*
*CREATE OBJECT go_products.

*DATA go_products TYPE REF TO zcl_01_logali.
*go_products = NEW #( ).

DATA(go_products) = NEW zcl_02h_logali( ).

go_products->get_products(
  EXPORTING
    iv_plant    = pa_plnt         " Plant
  IMPORTING
    et_products = DATA(gt_products)               " Products by Plant
).


IF gt_products IS NOT INITIAL.

  cl_demo_output=>display( gt_products ).

ELSE.
  WRITE 'No data'.

ENDIF.
