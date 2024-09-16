# Étape 1 : Utiliser une image Ubuntu de base
FROM ubuntu:20.04

# Étape 2 : Installer les dépendances
RUN apt-get update && \
    apt-get install -y software-properties-common wget wine xvfb x11vnc fluxbox && \
    dpkg --add-architecture i386 && apt-get update && apt-get install -y wine32

# Étape 3 : Télécharger et installer MetaTrader 4
RUN wget https://download.mql5.com/cdn/web/metaquotes.software.corp/mt4/mt4setup.exe -O /tmp/mt4setup.exe && \
    wine /tmp/mt4setup.exe /S

# Étape 4 : Copier le bot dans le conteneur
COPY ./bot/trading_bot.mq4 /root/.wine/drive_c/Program\ Files/MetaTrader\ 4/MQL4/Experts/

# Étape 5 : Script pour lancer MetaTrader 4
COPY ./scripts/start_mt4.sh /root/start_mt4.sh

# Étape 6 : Exposer les ports nécessaires (pour VNC/X11, par ex.)
EXPOSE 5900 6000

# Commande pour démarrer MetaTrader avec le bot
CMD ["/bin/bash", "/root/start_mt4.sh"]
