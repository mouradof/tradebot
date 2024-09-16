#!/bin/bash

# Nom de l'utilisateur et IP de la VM
VM_USER="mouradof"
VM_IP="13.74.138.166"

# Chemin vers le répertoire du projet sur la VM
PROJECT_PATH="/home/$VM_USER/trading_bot"

# Arrêter et supprimer le conteneur s'il est en cours d'exécution
ssh -i ~/.ssh/id_rsa.pem $VM_USER@$VM_IP "docker stop trading_bot || true && docker rm trading_bot || true"

# Copier le projet sur la VM
scp -i ~/.ssh/id_rsa.pem -r * $VM_USER@$VM_IP:$PROJECT_PATH

# Connecter à la VM et construire l'image Docker
ssh -i ~/.ssh/id_rsa.pem $VM_USER@$VM_IP "cd $PROJECT_PATH && docker build -t mt4-bot ."

# Démarrer le conteneur
ssh -i ~/.ssh/id_rsa.pem $VM_USER@$VM_IP "docker run -d --name trading_bot mt4-bot"

echo "Bot de trading déployé avec succès sur la VM $VM_IP."
