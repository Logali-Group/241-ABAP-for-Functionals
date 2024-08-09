FUNCTION zfm_test01_logali.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_BUKRS) TYPE  BUKRS
*"     REFERENCE(IV_GJAHR) TYPE  GJAHR
*"     REFERENCE(IV_LIST) TYPE  FLAG OPTIONAL
*"  EXPORTING
*"     REFERENCE(ET_DOCS) TYPE  BSEG_T
*"----------------------------------------------------------------------
  SELECT FROM bseg
    FIELDS *
    WHERE bukrs EQ @iv_bukrs
      AND gjahr EQ @iv_gjahr
    INTO TABLE @et_docs.

CHECK lines( et_docs ) GT 0.

LOOP AT et_docs ASSIGNING FIELD-SYMBOL(<gfs_doc>).

   WRITE:
    / <gfs_doc>-bukrs,
     <gfs_doc>-gjahr,
     <gfs_doc>-belnr.

ENDLOOP.

ENDFUNCTION.
