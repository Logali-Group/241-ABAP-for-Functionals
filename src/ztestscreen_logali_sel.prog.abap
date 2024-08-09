*&---------------------------------------------------------------------*
*& Include          ZTESTSCREEN_LOGALI_SEL
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE b01.
  "0000000001;00251000080005000001;0025100051

  PARAMETERS:
    p_s_docu TYPE vbeln_va, "Sales document
    p_cust   TYPE kunnr,    "Customer
    p_time   TYPE erzet.    "Entry time

  SELECT-OPTIONS:
   s_date FOR vbak-erdat.    "Date

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE b02.

  PARAMETERS:
    p_show_d TYPE c RADIOBUTTON GROUP grp1,  "Show Detail
    p_show_s TYPE c RADIOBUTTON GROUP grp1. "Show summary

SELECTION-SCREEN END OF BLOCK b2.
