*&---------------------------------------------------------------------*
*& Report ZSQL00_LOGALI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsql00_logali.

"Insertar un registro

*DATA gs_airline TYPE zscarr_fc.
*
*gs_airline = VALUE #( carrid   = 'CO'
*                      carrname = 'Colombian airline'
*                      currcode = 'COP'
*                      url      = 'www.colombianairline.com'      ).
*
*INSERT zscarr_fc FROM gs_airline.
*
*IF sy-subrc EQ 0.
*
*  MESSAGE 'Record inserted correctly' TYPE 'I'.
*
*ELSE.
*
*  MESSAGE 'The record was not inserted' TYPE 'I'.
*
*
*ENDIF.

"Insertar múltiples registros

*SELECT FROM scarr
* FIELDS *
*  WHERE currcode EQ 'EUR'
*INTO TABLE @DATA(gt_airlines).
*
*IF sy-subrc EQ 0.
*
*  INSERT zscarr_fc FROM TABLE gt_airlines.
*
*  IF sy-subrc EQ 0.
*    WRITE: / 'Number of records inserted = ', sy-dbcnt.
*  ENDIF.
*
*  ENDIF.

"Actualizar un registro

*DATA: gs_airline TYPE zscarr_fc.
*
*SELECT SINGLE FROM zscarr_fc
*   FIELDS *
*   WHERE carrid EQ 'CO'
*   INTO @gs_airline.
*
*IF sy-subrc EQ 0.
*
*  WRITE: 'Currency: ', gs_airline-currcode.
*
*  gs_airline-currcode = 'EUR'.
*
*  UPDATE zscarr_fc FROM gs_airline.
*
*  IF sy-subrc EQ 0.
*
*    WRITE: / 'Registry successfully updated with the new currency', gs_airline-currcode.
*
*  ENDIF.
*
*ENDIF.

"Actualizar múltiples registros

*CONSTANTS gc_home_url TYPE string VALUE '/logali'.
*
*FIELD-SYMBOLS <gfs_airline> TYPE zscarr_fc.
*
*SELECT FROM zscarr_fc
*   FIELDS *
*   INTO TABLE @DATA(gt_airlines).
*
*IF sy-subrc EQ 0.
*
*  LOOP AT gt_airlines ASSIGNING <gfs_airline>.
*
*    DATA(gv_final_url) = | { <gfs_airline>-url }  { gc_home_url } |.
*
*    <gfs_airline>-url = gv_final_url.
*
*  ENDLOOP.
*
*  UPDATE zscarr_fc FROM TABLE gt_airlines.
*
*  IF sy-subrc EQ 0.
*    WRITE / 'OK'.
*  ELSE.
*    WRITE / 'No OK'.
*  ENDIF.
*
*ENDIF.

"Eliminar un registro

*SELECT SINGLE FROM zscarr_fc
*   FIELDS *
*   WHERE carrid EQ 'CO'
*   INTO @DATA(gs_airline).
*
*IF sy-subrc EQ 0.
*
*  DELETE zscarr_fc FROM gs_airline.
*
*  IF sy-subrc EQ 0.
*    WRITE / 'Record deleted from the database'.
*  ENDIF.
*
*ENDIF.

"Eliminar múltiples registros

SELECT FROM zscarr_fc
    FIELDS *
    WHERE carrid  IN ( 'AF' , 'AZ' )
    INTO TABLE @DATA(gt_airlines).

IF sy-subrc EQ 0.

  DELETE zscarr_fc FROM TABLE gt_airlines.

  IF sy-subrc EQ 0.

    WRITE: / 'Records have been deleted from the database'.

  ENDIF.

ENDIF.
