*&---------------------------------------------------------------------*
*& Report ZSELECT01_LOGALI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zselect01_logali.

PARAMETERS p_land1 TYPE land1_gp.

TYPES: BEGIN OF gty_customer_data,
         kunnr   TYPE kna1-kunnr,
         name1   TYPE kna1-name1,
         street  TYPE adrc-street,
         address TYPE kna1-adrnr,
       END OF gty_customer_data.

DATA: lt_customer_data TYPE TABLE OF gty_customer_data,
      ls_customer_data TYPE gty_customer_data.

"SELECT
SELECT kna1~kunnr,
       kna1~name1,
       adrc~street,
       kna1~adrnr
  INTO TABLE @lt_customer_data
  FROM kna1
  INNER JOIN adrc ON kna1~adrnr = adrc~addrnumber
  WHERE kna1~land1 EQ @p_land1.


IF sy-subrc EQ 0.
  cl_demo_output=>display( lt_customer_data ).
ENDIF.
