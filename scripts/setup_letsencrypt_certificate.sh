#!/bin/bash

#Mostrar los comandos que se van ejecutando 
set -ex

# Importamos las variables de entorno
source .env

#Instalamos y actualizamos snap core
snap install core
snap refresh core

#Eliminamos si existiese alguna instalación previa de certbot con apt.
apt remove certbot -y

#Instalamos el cliente de Certbot con snapd.
snap install --classic certbot

