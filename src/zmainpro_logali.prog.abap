*&---------------------------------------------------------------------*
*& Report zmainpro_logali
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmainpro_logali.

INCLUDE: zmainpro_logali_top,
         zmainpro_logali_sel,
         zmainpro_logali_f01.


AT SELECTION-SCREEN ON p_custom.

  IF p_custom CA '012345678'.
    MESSAGE 'Please verify the data entered' TYPE 'E'.
  ENDIF.


START-OF-SELECTION.

  PERFORM: get_data,
           display_sales_report.
