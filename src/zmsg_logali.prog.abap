*&---------------------------------------------------------------------*
*& Report zmsg_logali
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmsg_logali.
* Tipos de mensajes en ABAP

* I - Information - mensaje de información
* S - Success - mensaje de éxito
* E - Error - mensaje de error lógico
* W - Warning - mensaje de advertencia
* A - Abend - mensaje de cancelación
* X - Error - mensaje de error de programación

PARAMETERS pa_msg TYPE c LENGTH 1.

CASE pa_msg.
  WHEN 'I'.
    MESSAGE i014(sabapdocu).

  WHEN 'S'.
    MESSAGE s015(sabapdocu).

  WHEN 'A'.
    MESSAGE a016(sabapdocu).

  WHEN OTHERS.
    WRITE / 'El tipo de mensaje no existe'.

ENDCASE.

WRITE / 'Sigue con la lógica'.
