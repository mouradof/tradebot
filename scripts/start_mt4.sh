#!/bin/bash
# Démarrer MetaTrader avec Wine
xvfb-run -a wine /root/.wine/drive_c/Program\ Files/MetaTrader\ 4/terminal.exe &
echo "MetaTrader 4 démarré avec votre bot de trading."
