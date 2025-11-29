# Calculadora de pricing para automatizaciones (n8n)

Objetivo: ayudar a tus alumnos a estimar cuánto cobrar por sus automatizaciones basándose en las horas que ahorran al cliente por semana y el valor económico de esas horas, añadiendo costes de herramientas, mantenimiento, margen, captura de valor y riesgo. Se podrá generar un resumen imprimible/PDF para enviar como presupuesto.

## Inputs clave
- Horas ahorradas por semana.
- Coste por hora del cliente (o valor/hora de su equipo).
- Beneficio incremental mensual (ventas/retención) — opcional.
- Coste mensual de herramientas.
- Horas de implementación (setup) y horas de mantenimiento/mes.
- Tu tarifa por hora.
- Margen deseado (%) y % de valor capturado (sobre el valor generado).
- Factor de riesgo/complejidad.
- Meses objetivo de payback.
- Notas de alcance (para mostrar en la propuesta).

## Conversión semanal → mensual
- Horas/mes = horas_semana × 4.33 (promedio de semanas al mes).

## Cálculos base
- Ahorro mensual = horas_mes × coste_hora_cliente.
- Valor mensual generado = ahorro_mensual + beneficio_incremental.
- Coste mensual propio = (horas_mantenimiento × tu_tarifa) + coste_herramientas.
- Coste setup = horas_implementacion × tu_tarifa.

## Recomendación de precios
- Setup recomendado = coste_setup × (1 + margen) × factor_riesgo.
- Mensual recomendado = max(
    coste_mensual × (1 + margen) × factor_riesgo,
    valor_mensual × %captura_valor
  ).
- Payback = setup_recomendado / (valor_mensual − mensual_recomendado) si el numerador es positivo; si no, marcar como N/A.
- ROI 12m = (valor_mensual × 12 − (setup + mensual × 12)) / (setup + mensual × 12).

## Escenarios
- Conservador: margen × 0.65, captura × 0.6; riesgo 0.9–1.0x.
- Agresivo: margen × 1.25, captura × 1.35; riesgo 1.1–1.3x.

## Output esperado (UI / PDF)
- Setup recomendado y mensualidad recomendada (números grandes).
- Payback estimado y ROI a 12 meses.
- Rango conservador vs. agresivo.
- Resumen corto del proyecto: cliente, objetivo, setup, mensual, payback, ROI, notas.
- Botón para imprimir/descargar PDF (con estilos `@media print`).

## Flujo UX propuesto
1) Inputs arriba (horas/semana y coste/hora destacados).
2) Resultados en panel a la derecha o abajo en móvil.
3) Chips de escenarios conservador/agresivo.
4) Campo de notas y texto editable de propuesta.
5) Botón “Generar PDF / Imprimir” (usa `window.print`).

## Datos iniciales de ejemplo (se pueden usar como defaults)
- Horas ahorradas/semana: 8
- Coste hora cliente: 45
- Beneficio incremental mensual: 300
- Coste herramientas: 60
- Horas implementación: 18
- Horas mantenimiento/mes: 4
- Tu tarifa hora: 75
- Margen: 40%
- % captura valor: 18%
- Factor riesgo: 1.0
- Payback objetivo: 4 meses

## Siguiente paso
Crear un `calculator.html` estático con la lógica anterior (HTML/CSS/JS), listo para desplegar en Easy Panel y protegido con auth básica o password simple si lo deseas.
