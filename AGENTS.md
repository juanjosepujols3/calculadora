# Repository Guidelines

## Project Structure & Module Organization
- Root: `README.md`, this guide (`AGENTS.md`), and the `pricing-automatizaciones/` app folder.
- `pricing-automatizaciones/calculator.html`: single-page UI with HTML/CSS/JS for la calculadora de pricing.
- `pricing-automatizaciones/Dockerfile` y `nginx.conf`: imagen nginx para servir la página en EasyPanel; `.dockerignore` reduce el contexto.

## Build, Test, and Development Commands
- Vista local rápida: abrir `pricing-automatizaciones/calculator.html` en el navegador (macOS: `open pricing-automatizaciones/calculator.html`).
- Docker (usado en EasyPanel):
  - `cd pricing-automatizaciones`
  - `docker build -t calculadora-pricing .`
  - `docker run -p 8080:80 calculadora-pricing` y visitar `http://localhost:8080`.
- No hay tests automatizados aún; hacer smoke test manual en el navegador.

## Coding Style & Naming Conventions
- HTML/CSS/JS en un solo archivo; mantener funciones claras y parámetros configurables arriba antes de añadir lógica nueva.
- CSS: usar variables definidas en `:root`; mantener tipografías y colores consistentes.
- Indentación de 2 espacios; sin trailing whitespace; ASCII.

## Testing Guidelines
- Validar inputs: cambios de valores recalculan resultados, chips de escenarios, botón de copiar resumen y modo impresión (`window.print`).
- Revisar responsive (desktop/móvil) y estilos `@media print`.
- En Docker: después de `docker run`, verificar carga y números en el navegador.

## Commit & Pull Request Guidelines
- Mensajes en imperativo y concisos (ej.: "Add pricing calculator page", "Add Dockerfile and nginx config for EasyPanel").
- Antes de PR/push: `git status` limpio y calculadora validada en browser y/o contenedor.
- PRs: breve resumen de cambios, pasos de prueba manual, y captura/GIF para modificaciones de UI.
