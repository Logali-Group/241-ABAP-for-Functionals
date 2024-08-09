*&---------------------------------------------------------------------*
*& Include          ZMAINPRO_LOGALI_F01
*&---------------------------------------------------------------------*

FORM get_data.

  SELECT FROM sflight
    FIELDS carrid, fldate,seatsmax
     WHERE carrid EQ @p_custom
    INTO TABLE @gt_sales_data.


  LOOP AT gt_sales_data INTO DATA(ls_sales_data).
    gv_total_sales = gv_total_sales + ls_sales_data-amount.
  ENDLOOP.

  gv_selected_customer = p_custom.

ENDFORM.



FORM display_sales_report.
  WRITE: / 'Sales report for the client:', gv_selected_customer,
         / 'Total sales:', gv_total_sales,
         / 'Sales details:'.

  LOOP AT gt_sales_data INTO DATA(ls_sales_data).
    WRITE: / 'Date of flight:', ls_sales_data-flight_date,
           / 'Number of seats sold:', ls_sales_data-amount.
  ENDLOOP.
ENDFORM.
