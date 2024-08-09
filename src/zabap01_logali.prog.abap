*&---------------------------------------------------------------------*
*& Report ZABAP01_LOGALI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap01_logali.

*WRITE 'This is my first program in SAP'.
"comment

DATA: gt_mat      TYPE STANDARD TABLE OF mara,
      gs_mat      TYPE mara,
      gt_mat_sort TYPE SORTED TABLE OF mara WITH NON-UNIQUE KEY matnr,
      gt_mat_hash TYPE HASHED TABLE OF mara WITH UNIQUE KEY matnr.

DATA: gv_inv_date TYPE d,
      gv_inv_time TYPE t,
      gv_inv_num  TYPE i VALUE 110011,
      gv_inv_tax  TYPE f VALUE '15.2',
      gv_inv_comp TYPE string VALUE 'Logali group'.

DATA: gv_inv_soc  TYPE c LENGTH 12 VALUE 'SAP Academy',
      gv_inv_rate TYPE p LENGTH 8 DECIMALS 2 VALUE '2025.6'.

CONSTANTS: gc_customer TYPE c VALUE 'A',
           gc_store    TYPE n LENGTH 10 VALUE '102255',
           gc_mat      TYPE i VALUE 100.



gv_inv_date = sy-datum.
gv_inv_time = sy-timlo.

* WRITE: / 'Invoice date:' ,  gv_inv_date DD/MM/YY,
*        / 'Billing time:' ,  gv_inv_time ENVIRONMENT TIME FORMAT,
*        / 'Invoice number:', gv_inv_num,
*        / 'Invoice tax:' ,   gv_inv_tax,
*        / 'Company name:',   gv_inv_comp.

SKIP 2.

* WRITE: / 'Society:', gv_inv_soc,
*        / 'Rates'   , gv_inv_rate.

DATA(gv_customer) = 'B'.

*IF gv_customer EQ gc_customer.
*  WRITE: | Customer { gc_customer } warehouse is the number: { gc_store } |.
*
* ELSEIF gv_customer NE gc_customer.
*   WRITE 'There are not warehouses for this customer'.
*ENDIF.

"System Variables

*WRITE : 'User:', sy-uname,
*        'System date', sy-datum,
*        'System time' , sy-uzeit.

"Structures

TYPES: BEGIN OF lty_employee,
         employee_id TYPE i,
         first_name  TYPE string,
         last_name   TYPE string,
         salary      TYPE p LENGTH 10 DECIMALS 2,
       END OF lty_employee.

DATA: ls_employee TYPE lty_employee,
      lt_employee TYPE STANDARD TABLE OF lty_employee.


ls_employee-employee_id = 1011.
ls_employee-first_name  = 'Maria'.
ls_employee-last_name   = 'López'.
ls_employee-salary      = '2525.23'.

DATA: ls_customer  TYPE scustom,
      lt_customers TYPE TABLE OF scustom.


SELECT SINGLE FROM scustom
    FIELDS *
    INTO @ls_customer.

SELECT FROM scustom
  FIELDS *
  INTO TABLE @lt_customers.

"cl_demo_output=>display( lt_customers ).

"DO

DATA lv_counter TYPE i.

lv_counter = 1.

DO 5 TIMES.
*  WRITE: / 'Iteration:' , lv_counter.
  lv_counter += 1.
ENDDO.

"WHILE

DATA: lv_sum TYPE i VALUE 0,
      lv_num TYPE i VALUE 1.

WHILE lv_sum LT 10 OR lv_num LT 5.

  lv_sum = lv_sum + lv_num.
  lv_num = lv_num + 1.

ENDWHILE.

*WRITE: / 'Result:', lv_sum.

"LOOP

SELECT FROM mara
   FIELDS *
  INTO TABLE @gt_mat.

LOOP AT gt_mat INTO gs_mat.

*  WRITE: / gs_mat-matnr, gs_mat-ersda, gs_mat-ernam.

ENDLOOP.

"IF

DATA lv_counter2 TYPE i VALUE 1.

WHILE lv_counter2 LE 10.

*  IF lv_counter2 MOD 2 EQ 0.
*    WRITE: / 'The number is even'.
*  ELSE.
*    WRITE: / 'The number is odd'.
*  ENDIF.

  lv_counter2 += 1.

ENDWHILE.

"CASE

DATA lv_customer TYPE string VALUE 'SAP'.

*CASE lv_customer.
*  WHEN 'Logali'.
*    WRITE 'Academy'.
*  WHEN 'SAP'.
*    WRITE 'Software'.
*  when OTHERS.
*    WRITE 'Unknow'.
* ENDCASE.

"EXIT

DATA lv_value TYPE i.

DO 10 TIMES.

  lv_value += 1.

  IF lv_value GT 5.
    EXIT.
  ENDIF.

"  WRITE lv_value.

ENDDO.

"CONTINUE

DATA lv_value2 TYPE i.

DO 10 TIMES.
  lv_value2 += 1.

  IF lv_value2 MOD 2 EQ 0.
    CONTINUE.
  ENDIF.

*WRITE / lv_value2.

ENDDO.


"Character String Operations

DATA: lv_name  TYPE string VALUE 'Laura-Ximena',
      lv_lastn TYPE string VALUE 'Martínez',
      lv_fullname TYPE string.

"CONCATENATE lv_name lv_lastn INTO lv_fullname.

lv_fullname = lv_name && lv_lastn.

WRITE lv_fullname.

lv_fullname = substring( val = lv_fullname off = 5 len = 3  ).

WRITE / lv_fullname.


lv_name = replace(  val =  lv_name regex = '-' with = '/' occ = 0     ).

WRITE / lv_name.

WRITE: | Name: { lv_name } Last name: { lv_lastn }  |.
