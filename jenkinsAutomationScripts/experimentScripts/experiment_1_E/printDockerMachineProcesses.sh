# !/bin/bash

CURRENT_DATE_TIME=$(date +"%Y-%m-%d_%H-%M-00")

FILEPATH="<REDACTED>"

ps aux >> "${FILEPATH}${CURRENT_DATE_TIME}_ps_aux.txt"

ps -ef >> "${FILEPATH}${CURRENT_DATE_TIME}_ps_ef.txt"
