class ZCL_01_LOGALI definition
  public
  create public .

public section.

  methods GET_PRODUCTS
    importing
      !IV_PLANT type WERKS_D
    exporting
      !ET_PRODUCTS type ZTT_PRODPLANT_LOGALI .
protected section.
private section.
ENDCLASS.



CLASS ZCL_01_LOGALI IMPLEMENTATION.


  METHOD get_products.

    SELECT FROM mara AS product
      INNER JOIN nsdm_e_marc AS plant
        ON product~matnr EQ plant~matnr
      FIELDS product~matnr,
             plant~werks
      WHERE plant~werks EQ @iv_plant
      INTO TABLE @et_products.


  ENDMETHOD.
ENDCLASS.
