*&---------------------------------------------------------------------*
*& Report ZSALES_LOGALI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsales_logali.

INCLUDE:
         zsales_logali_top,
         zsales_logali_sel,
         zsales_logali_f01.


INITIALIZATION.

PERFORM init_var.


AT SELECTION-SCREEN ON p_s_docu.

  IF p_s_docu NA '012345789'.
    MESSAGE 'This field can only contain numbers' TYPE 'E'.
  ENDIF.

START-OF-SELECTION.

"  WRITE 'This is the program execution'.


  SELECT FROM vbak
    FIELDS *
    WHERE  vbeln = @p_s_docu OR
           kunnr = @p_cust
   INTO TABLE @lt_sales.


  CASE p_show_d.
    WHEN 'X'.

      PERFORM show_detail.

    WHEN ' '.

      PERFORM show_summary.


  ENDCASE.
