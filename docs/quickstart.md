# Quickstart

## Despliegue manual

1. Clona el repositorio y entra en el directorio:
   ```bash
   git clone https://github.com/tuusuario/devops-automation-suite.git
   cd devops-automation-suite
   ```

2. Despliega la app Docker:
   ```bash
   ./scripts/deploy_docker_app.sh
   ```

3. Monitoriza la app:
   ```bash
   python3 ./scripts/monitor_app.py
   ```

4. Infraestructura con Terraform:
   ```bash
   cd infra
   terraform init
   terraform apply
   ```
   *Modifica variables o credenciales según tu entorno.*

5. Usa los pipelines de `/ci` según tu plataforma.

## Variables de entorno personalizables

- IMAGE_NAME
- CONTAINER_NAME
- PORT
- APP_URL
- CHECK_INTERVAL

## Ejemplo de personalización

```bash
export PORT=9090
./scripts/deploy_docker_app.sh
export APP_URL="http://localhost:9090"
python3 scripts/monitor_app.py
```
