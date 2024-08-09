*&---------------------------------------------------------------------*
*& Report zsql01_logali
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsql01_logali.

"Insert records with exception processing
DATA: gt_bbdd  TYPE STANDARD TABLE OF zscarr_fc,
      gcx_root TYPE REF TO cx_root.

SELECT FROM scarr
    FIELDS *
    INTO TABLE @gt_bbdd.

IF sy-subrc EQ 0.

  TRY.

      INSERT zscarr_fc FROM TABLE gt_bbdd.

    CATCH cx_sy_open_sql_db INTO gcx_root.
      WRITE: / gcx_root->get_longtext( ).

  ENDTRY.

  IF sy-subrc EQ 0.
    WRITE: / 'Se han insertado los registros que no existían en base de datos' , sy-dbcnt.
  ENDIF.

ENDIF.
