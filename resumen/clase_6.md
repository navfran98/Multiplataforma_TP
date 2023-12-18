# Riverpod
[Go to Index](resumen.md)

Busca solucionar:
- Compile-time safety
- Estado inmutable
- Independiente del framework
- Combinacion de Providers

## Providers

Encapsulan un estado y permiten "escuchar" cambios.

Objeto **ref** &rarr; permite lectura de otros providers.

**watch** &rarr; permite obtener valor y rebuildear ante cambios.

**listen** &rarr; permite realizar accion arbitraria ante cambios. Recibe _provider_ a escuchar y un _callback_.

**read** &rarr; permite obtener estado sin escuchar cambios.

**select** &rarr; permite filtrar rebuilds.

**autodispose/keepalive** &rarr; mantiene estado del provider aunque no estésiendo escuchado.

### Provider

Son el tipo mas simple, exponen un valor: "Singletons", valores computados. 

### Notifier Provider

- Exponer un estado más complejo.
- Centralizar lógica de negocio.
- Asignación a propiedad state notifica listeners.

### Async Notifier Provider

- Exponer un estado asincronico más complejo.
- Centralizar lógica de negocio.
- Estado: objeto AsyncValue

### Future Provider

Provider para estado asincrónico: expone AsyncValue.
