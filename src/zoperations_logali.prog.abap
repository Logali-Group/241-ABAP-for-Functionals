*&---------------------------------------------------------------------*
*& Report ZOPERATIONS_LOGALI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zoperations_logali.

DATA lv_invoice TYPE i VALUE 22001.

"Execute DO for 20 times, we need 20 invoices

DO 20 TIMES.

  "Display
"  WRITE: / 'Invoice number:' , lv_invoice.

  "Adding 1 to invoice number
  lv_invoice += 1.

ENDDO.

"WHILE

DATA: lv_counter TYPE i.

lv_counter = 1.

WHILE lv_counter <= 5.

"  WRITE: / 'Iteration:', lv_counter.

  lv_counter = lv_counter + 1.

ENDWHILE.

"IF / ENDIF

DATA gv_num TYPE i VALUE 2.

*IF gv_num EQ 10.
*  WRITE / 'The number is 10'.
*
*ELSEIF gv_num GT 10.
*  WRITE / 'The number is greater than 10'.
*
*ELSE.
*    WRITE / 'The number is less than 10'.
*
*ENDIF.

"LOOP

*TYPES: BEGIN OF lty_employee,
*         id   TYPE i,
*         name TYPE string,
*         age  TYPE i,
*       END OF lty_employee.
*
*DATA: lt_employees TYPE TABLE OF lty_employee,
*      ls_employee  TYPE lty_employee.
*
*"EXPLICAR EN EL EJERCICIO EL APPEND
*
*  ls_employee = VALUE #( id   = 1
*                         name = 'Juan'
*                         age  = 30     ).
*
*  APPEND ls_employee TO lt_employees.
*
*  CLEAR ls_employee.
*
*  ls_employee = VALUE #( id   = 2
*                        name = 'María'
*                        age  = 28 ).
*
*  APPEND ls_employee TO lt_employees.
*
*  CLEAR ls_employee.
*  ls_employee = VALUE #( id   = 3
*                        name = 'Pedro'
*                        age  = 32 ).
*
*  APPEND ls_employee TO lt_employees.
*
*
*  LOOP AT lt_employees INTO ls_employee.
*    WRITE: / 'ID:', ls_employee-id,
*           / 'Employee Name:', ls_employee-name,
*           / 'Age:', ls_employee-age.
*  ENDLOOP.



"CASE / ENDCASE

*DATA lv_company TYPE string VALUE 'Logali'.
*
**CASE lv_company.
**  WHEN 'Logali'.
**    WRITE: / lv_company, ': Academy'.
**  WHEN 'SAP'.
**    WRITE: / lv_company, ': Business software'.
**  WHEN OTHERS.
**    WRITE: / lv_company, ': Unknow'.
**ENDCASE.
*
*
*"EXIT
*
**DO 10 TIMES.
**  IF sy-index > 5.
**    EXIT.
**  ENDIF.
**  WRITE: / 'Index:', sy-index.
**ENDDO.
*
*"CONTINUE
*
**DO 10 TIMES.
**  IF sy-index = 5.
**    CONTINUE.
**  ENDIF.
**  WRITE: / 'Index:', sy-index.
**ENDDO.
*
*"RETURN
*
* DATA: lv_result TYPE i.
*
*  lv_result = 10 + 20.
*
*  IF lv_result > 30.
*    RETURN.
*  ENDIF.
*
*  WRITE: / 'The result is:', lv_result.

"Operaciones con cadenas de caracteres

DATA: lv_string1             TYPE string VALUE 'Factura ID: ',
      lv_string2             TYPE string VALUE 'F001',
      lv_concatenated_string TYPE string.

lv_concatenated_string = lv_string1 &&  lv_string2.

WRITE: / lv_concatenated_string.
