*&---------------------------------------------------------------------*
*& Report zbapi_logali
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbapi_logali.

PARAMETERS: p_air  TYPE bapisflkey-airlineid. "Código de la aerolínea (Lufthansa)

DATA: lt_flight_list TYPE TABLE OF bapisfldat,
      ls_flight_list TYPE bapisfldat.

* Llamada a la BAPI para obtener la lista de vuelos

CALL FUNCTION 'BAPI_FLIGHT_GETLIST'
 EXPORTING
     airline          = p_air
*    destination_from =
*    destination_to   =
     max_rows         = 20
   TABLES
*    date_range       =
*    extension_in     =
     flight_list      = lt_flight_list
*    extension_out    =
*    return           =
  .

IF sy-subrc NE 0.
  WRITE: / 'Error when calling the BAPI BAPI_FLIGHT_GETLIST:', sy-msgid, sy-msgno, sy-msgty, sy-msgv1, sy-msgv2, sy-msgv3, sy-msgv4.
ELSE.
  WRITE: / 'Flight list for the airline:', p_air.

  LOOP AT lt_flight_list INTO ls_flight_list.
    WRITE: / ls_flight_list-connectid,
             ls_flight_list-flightdate,
             ls_flight_list-flightdate,
             ls_flight_list-cityfrom,
             ls_flight_list-cityto.
  ENDLOOP.

ENDIF.
