# Repository Guidelines

## Project Structure & Module Organization
- Root: `README.md`, this guide (`AGENTS.md`), root `Dockerfile` + `.dockerignore` (build de despliegue).
- App: `pricing-automatizaciones/` contiene la calculadora.
- `pricing-automatizaciones/calculator.html`: UI/JS/CSS en un solo archivo (lógica de pricing).
- `pricing-automatizaciones/Dockerfile` y `nginx.conf`: imagen nginx que usa EasyPanel; `.dockerignore` reduce el contexto.

## Build, Test, and Development Commands
- Vista local rápida: abrir `pricing-automatizaciones/calculator.html` en el navegador (macOS: `open pricing-automatizaciones/calculator.html`).
- Docker (subcarpeta, imagen usada en EasyPanel):
  - `cd pricing-automatizaciones`
  - `docker build -t calculadora-pricing .`
  - `docker run -p 8080:80 calculadora-pricing` → `http://localhost:8080`.
- Docker (root, sirve la misma página desde la raíz): `docker build -t calc-root .` y `docker run -p 8080:80 calc-root`.
- No hay tests automatizados; se espera smoke test manual (ver abajo).

## Coding Style & Naming Conventions
- HTML/CSS/JS en `calculator.html`; mantén funciones pequeñas y parámetros configurables arriba.
- CSS: usa variables en `:root`; conserva tipografías/colores existentes salvo rediseño explícito.
- Indentación 2 espacios; sin trailing whitespace; ASCII-only.
- Nombres claros y descriptivos; evita abreviaturas crípticas.

## Testing Guidelines
- Smoke tests manuales:
  - Cambiar inputs y escenarios (Base/Conservador/Agresivo) y verificar recalculo en resultados.
  - Probar “Copiar resumen” y `window.print()` (vista impresión).
  - Revisar responsive en móvil/desktop y estilos `@media print`.
- Contenedor: tras `docker run -p 8080:80 …`, abrir en navegador y validar números y acciones.
- No hay framework de tests configurado; ubicar futuros tests en `pricing-automatizaciones/` y documentar el comando.

## Commit & Pull Request Guidelines
- Mensajes en imperativo, cortos y específicos (ej.: “Add pricing calculator page”, “Add Dockerfile and nginx config for EasyPanel”, “Add root Dockerfile for EasyPanel”).
- Antes de push/PR: `git status` limpio; validación manual en navegador y/o contenedor.
- PRs: incluir resumen breve, pasos de prueba manual, captura/GIF para cambios de UI y referencia a issue si aplica.
