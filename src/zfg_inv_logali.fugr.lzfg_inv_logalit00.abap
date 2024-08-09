*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZINV_LOGALI.....................................*
DATA:  BEGIN OF STATUS_ZINV_LOGALI                   .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZINV_LOGALI                   .
CONTROLS: TCTRL_ZINV_LOGALI
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZINV_LOGALI                   .
TABLES: ZINV_LOGALI                    .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
