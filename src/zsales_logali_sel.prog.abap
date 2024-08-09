*&---------------------------------------------------------------------*
*& Include          ZSALES_LOGALI_SEL
*&---------------------------------------------------------------------*
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-b01.

  PARAMETERS: p_s_docu TYPE vbeln_va, "Sales document
              p_cust   TYPE kunnr,    "Customer
              p_time   TYPE erzet.    "Entry time

  SELECT-OPTIONS s_date FOR vbak-erdat. "Date

SELECTION-SCREEN END OF BLOCK b1.


SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE text-b02.

PARAMETERS: p_show_d TYPE c RADIOBUTTON GROUP gr1,  "Show detail
            p_show_s TYPE c RADIOBUTTON GROUP gr1.

SELECTION-SCREEN END OF BLOCK b2.
