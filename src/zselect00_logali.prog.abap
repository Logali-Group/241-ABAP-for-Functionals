*&---------------------------------------------------------------------*
*& Report zselect00_logali
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zselect00_logali.

DATA: lt_customer_data TYPE TABLE OF kna1,
      ls_customer_data TYPE kna1,
      lt_text TYPE TABLE OF kna1.

"LIKE
SELECT FROM kna1
 FIELDS *
   WHERE name1 LIKE '%domest%'
  INTO TABLE @lt_text
  UP TO 3 ROWS.

IF sy-subrc EQ 0.

  cl_demo_output=>display( lt_text ).

ENDIF.


*SELECT FROM kna1
* FIELDS *
*   WHERE kunnr GE '0000000001'
*    AND kunnr  LE '0012000000'
*  INTO TABLE @lt_customer_data.

*SELECT FROM kna1
* FIELDS *
*   WHERE kunnr BETWEEN '0000000001' AND  '0012000000'
*  INTO TABLE @lt_customer_data.
*
*IF sy-subrc EQ 0.
*
*  cl_demo_output=>display( lt_customer_data ).
*
*ENDIF.


*LOOP AT lt_customer_data INTO ls_customer_data.
*  WRITE: / 'Customer number:', ls_customer_data-kunnr,
*         / 'Name:', ls_customer_data-name1,
*         / 'City:', ls_customer_data-ort01,
*         / 'Country:', ls_customer_data-land1.
*  SKIP.

*ENDLOOP.

*SELECT SINGLE
*SELECT SINGLE FROM kna1
* FIELDS *
*   WHERE land1 EQ 'US'
*    AND regio  EQ 'CA'
*  INTO @ls_customer_data.
*
*IF sy-subrc EQ 0.
*
*  cl_demo_output=>display( ls_customer_data ).
*
*ENDIF.
