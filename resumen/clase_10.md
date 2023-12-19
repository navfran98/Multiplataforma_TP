# Feature Flagging & AB Testing
[Go to Index](resumen.md)

## Feature Flagging

Permite habilitar y deshabilitar funcionalidades sin necesidad de hacer un deploy. Es básicamente una configuración que controla la disponibilidad de una feature.

Beneficios:
- Desarrollo más rápido y con menos riesgo.
- Testeo más sencillo con usuarios reales.
- Más control sobre lanzamiento de funcionalidades.
- Debugging más controlado.
- Rollback de funcionalidades.
- Flexibilidad y personalización

Desafios:
- Feature flags dependientes entre sí.
- Feature flags superpuestas.
- Mantenimiento de feature flags.
- Elección de sistema de feature flags

Hay varios usos &rarr; Lanzamiento - Operacional - Experimental

### Gradual Rollouts

No siempre que se desarrolla una feature se quiere lanzar a todos los usuarios al mismo tiempo. Cuando se quiere avanzar con cierta precaución por las dudas sobre la adopción de la funcionalidad, se hacen lanzamientos en etapas.

### Feature Flags Operacionales

Podemos habilitar o deshabilitar una funcionalidad según el contexto o las condiciones del usuario. 

Ejemplos &rarr; carga del servidor, disponibilidad de un servicio, region del usuario, etc.

### Beta Testing

Cuando no alcanza el entorno de prueba para testear una funcionalidad y es necesario probar con usuarios reales, se puede usar feature flagging para beta testing.

## AB Testing

Los AB tests son experimentos aleatorios controlados de dos variables. Básicamente se trata de comparar dos o más versiones de un diseño o feature con el objetivo de maximizar alguna métrica.