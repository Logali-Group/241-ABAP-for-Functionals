*&---------------------------------------------------------------------*
*& Include          ZMAINPRO_LOGALI_TOP
*&---------------------------------------------------------------------*

TABLES: sflight.

TYPES: BEGIN OF gty_sales_data,
         customer    TYPE sflight-carrid,
         flight_date TYPE sflight-fldate,
         amount      TYPE sflight-seatsmax,
       END OF gty_sales_data.

DATA: gt_sales_data        TYPE TABLE OF gty_sales_data,
      gv_total_sales       TYPE i,
      gv_selected_customer TYPE sflight-carrid.
