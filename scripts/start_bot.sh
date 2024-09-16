#!/bin/bash

# Démarrer un environnement graphique virtuel pour MetaTrader
xvfb-run -a wine /root/.wine/drive_c/Program\ Files/MetaTrader\ 4/terminal.exe

# Afficher un message de confirmation
echo "MetaTrader 4 avec le bot de trading est maintenant en cours d'exécution."
