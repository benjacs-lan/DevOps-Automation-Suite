#!/bin/bash
# Script para desplegar una aplicación Docker de ejemplo usando variables de entorno
set -e

# Variables de entorno (puedes exportarlas o modificarlas aquí)
IMAGE_NAME=${IMAGE_NAME:-"nginx:latest"}
CONTAINER_NAME=${CONTAINER_NAME:-"devops_nginx"}
PORT=${PORT:-8080}

echo "[INFO] Desplegando el contenedor Docker '$CONTAINER_NAME' con imagen '$IMAGE_NAME' en el puerto $PORT..."

# Detener y eliminar el contenedor si ya existe
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "[INFO] Deteniendo contenedor existente..."
    docker stop $CONTAINER_NAME
fi

if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "[INFO] Eliminando contenedor existente..."
    docker rm $CONTAINER_NAME
fi

# Desplegar el nuevo contenedor
docker run -d --name $CONTAINER_NAME -p $PORT:80 $IMAGE_NAME

echo "[SUCCESS] Aplicación desplegada en http://localhost:$PORT"

# Logs del contenedor para monitoreo rápido
echo "[INFO] Mostrando últimos logs (Ctrl+C para salir):"
docker logs -f $CONTAINER_NAME
