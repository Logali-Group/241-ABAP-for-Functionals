*&---------------------------------------------------------------------*
*& Report ZDATATYPES_LOGALI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdatatypes_logali.

*DATA: lv_date    TYPE d VALUE '20300101',
*      lv_time    TYPE t VALUE '120000',
*      lv_num     TYPE i VALUE 22,
*      lv_numf    TYPE f VALUE '1.5',
*      lv_decfl16 TYPE decfloat16 VALUE '12.2',
*      lv_decfl34 TYPE decfloat16 VALUE '09001',
*      lv_name    TYPE string     VALUE 'ABAP Student',
*      lv_hex     TYPE xstring    VALUE 'ABC213',
*
*      lv_emp     TYPE c LENGTH 20 VALUE 'Laura Martinez',
*      lv_num_dec TYPE p LENGTH 3 DECIMALS 2 VALUE '523.21',
*      lv_code    TYPE n LENGTH 5 VALUE 12345,
*      lv_hex_x   TYPE x LENGTH 8 VALUE 'DF25'.
*
*CONSTANTS: lc_pcode        TYPE i VALUE 2525,
*           lc_company_name TYPE c LENGTH 20 VALUE 'Logali group'.
*
*
*WRITE: / 'Constants',
*       / 'Postal Code :'  , lc_pcode,
*       / 'Company name :' , lc_company_name.
*
*SKIP.
*
*WRITE: / 'Full types in ABAP'  ,
*       / 'Date type :'         , lv_date DD/MM/YY,
*       / 'Time type :'         , lv_time ENVIRONMENT TIME FORMAT,
*       / 'Numeric type i :'    , lv_num    ,
*       / 'Numeric type f :'    , lv_numf   ,
*       / 'Decfloat16 type :'   , lv_decfl16,
*       / 'Decfloat34 type :'   , lv_decfl34,
*       / 'String type :'       , lv_name   ,
*       / 'Hexadecimal type :'  , lv_hex    .
*
*SKIP.
*
*WRITE: / 'Incomplete types in ABAP.',
*       / 'Type c :'  , lv_emp,
*       / 'Type p :'  , lv_num_dec,
*       / 'Type n :'  , lv_code,
*       / 'Type x :'  , lv_hex_x.


"Structures or Work areas

"Structure defined in the data dictionary

DATA: gs_employee TYPE pa0001.

gs_employee = VALUE #( pernr = '0000000122'
                       ename = 'Laura Martínez'
                       bukrs = '1110'   ).

"cl_demo_output=>display( gs_employee ).

"Structure based on the line structure of an internal table

DATA: lt_customers TYPE TABLE OF scustom.

DATA: ls_customer LIKE LINE OF lt_customers.

SELECT FROM scustom
  FIELDS *
  INTO TABLE @lt_customers.

*LOOP AT lt_customers INTO ls_customer.
*  WRITE: / ls_customer-city , ls_customer-id.
*ENDLOOP.
