# DevOps-Automation-Suite

Conjunto modular de scripts y configuraciones para automatizar tareas de DevOps: despliegue Docker, CI/CD, infraestructura y monitoreo básico.

## Estructura

- `/scripts`: Scripts de automatización en Bash y Python.
- `/ci`: Pipelines de CI/CD para Jenkins y GitHub Actions.
- `/infra`: Ejemplo de infraestructura como código con Terraform.
- `/docs`: Documentación adicional.

## Requisitos previos

- Docker
- Python 3.x
- Terraform
- Jenkins o GitHub
- Acceso a la terminal/bash

## Ejecución Rápida

```bash
# 1. Desplegar aplicación Docker
./scripts/deploy_docker_app.sh

# 2. Monitorear aplicación (requiere Python 3)
python3 scripts/monitor_app.py

# 3. Aprovisionar infraestructura con Terraform (modifica variables según tus credenciales)
cd infra
terraform init
terraform apply
```

## Pipelines CI/CD

- Jenkins: Ver ejemplo en `/ci/jenkinsfile`
- GitHub Actions: Ver ejemplo en `/ci/github-actions.yml`
