#!/usr/bin/env python3
"""
Monitor básico de disponibilidad para la aplicación en Docker.
Hace peticiones HTTP y muestra resultado en consola.
"""

import requests
import os
import time
import logging

# Configuración de logging
logging.basicConfig(
    format='%(asctime)s %(levelname)s %(message)s',
    level=logging.INFO
)

APP_URL = os.getenv('APP_URL', 'http://localhost:8080')
CHECK_INTERVAL = int(os.getenv('CHECK_INTERVAL', 10))  # segundos

def check_app(url):
    try:
        response = requests.get(url, timeout=2)
        if response.status_code == 200:
            logging.info(f"Aplicación disponible en {url}")
        else:
            logging.warning(f"App respondió con código {response.status_code}")
    except Exception as e:
        logging.error(f"No se pudo conectar a la app: {e}")

if __name__ == "__main__":
    logging.info(f"Iniciando monitoreo de: {APP_URL} cada {CHECK_INTERVAL}s")
    while True:
        check_app(APP_URL)
        time.sleep(CHECK_INTERVAL)
