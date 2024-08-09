*&---------------------------------------------------------------------*
*& Report zfm_00_logali
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfm_00_logali.

DATA gt_docs TYPE bseg_t.

CALL FUNCTION 'ZFM_TEST01_LOGALI'
  EXPORTING
    iv_bukrs = 'PA12'
    iv_gjahr = '2023'
*    iv_list  =
  IMPORTING
    et_docs  = gt_docs
  .

cl_demo_output=>display( gt_docs ).
