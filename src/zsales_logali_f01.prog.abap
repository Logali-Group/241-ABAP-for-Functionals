*&---------------------------------------------------------------------*
*& Include          ZSALES_LOGALI_F01
*&---------------------------------------------------------------------*

FORM init_var.

  p_time = sy-uzeit.

ENDFORM.

FORM show_detail.

  LOOP AT lt_sales INTO DATA(ls_sales).
    WRITE: / 'Order number:' , ls_sales-vbeln,
             'Customer:'     , ls_sales-kunnr,
             'Creation date:', ls_sales-erdat.
  ENDLOOP.

ENDFORM.

FORM show_summary.


  lv_num_ord = lines( lt_sales ).

  WRITE: /  lv_num_ord, 'orders found.'.

ENDFORM.
