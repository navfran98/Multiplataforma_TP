# Networking & APIs
[Go to Index](resumen.md)

## Networking

Conectarnos a internet y en particular a APIs nos permite agregar muchas funcionalidades a la app y darle valor a los usuarios. 

Ejemplos &rarr; autenticacion - obtener informacion - publicar/actualizar informacion - cargar/descargar archivos.

### Offline Support

Uno de los mayores desafios de utilizar recursos externos es el soporte cuando no hay acceso a internet. Dependiendo de los requerimientos de la app hay casos que hay que manejar:
- Detectar si hay conexion.
- Detectar la velocidad y latencia de la conexion.
- Persistir el estado en caso de desconexion.

#### Detectar si hay conexion

Lo dificil es detectarlo con seguridad, ya que puede ocurrir que el sistema operativo reporta que hay conexion y no hay. Para solucionar esto se podria hacer ping sobre ciertos sitios que estan "siempre online" para asegurar que la conexion exista realmente.

#### Velocidad y Latencia

Para ciertas funcionalidades como streaming o llamadas es muy útil entender la calidad de la conexión para modificar el comportamiento de la app.

#### Persistencia Offline

Si la conexión se ve interrumpida mientras el usuario está realizando una acción importante, puede ser necesario persistir el estado efímero de la aplicación hasta que se reestablezca la conexión y se pueda sincronizar conel backend.

### Planificacion

Es muy útil decidir de antemano cuáles funcionalidades de la aplicación van a poder operar offline y cuáles no. Este paso simplifica la planificación y reduce el scope creep.

Si la conexion es muy lenta &rarr; se podria tratar dicho caso como si estuviera offline.

Las requests deberian ser idempotentes, obteniendo y enviando _idempotency keys_ y mantenerse al tanto del estado.

**Offline Mode** &rarr; buena práctica puede ser incluir el estado de conectividad al estado general de la aplicación y modificar la UI en base a ese estado y a las definiciones sobre cómo reacciona cada funcionalidad ante la presencia o falta de conectividad.

## Rest APIs

- REST nos provee una manera estructurada de acceder y modificar data de un backend.
- Es importante implementar versionado de la api para mantener una compatibilidad hacia atrás y prevenir errores en versiones viejas de la app.
- Es bueno contar con paginacion.

## Back End as a Service

**BaaS** es buena opcion cuando no tenemos requerimientos por fuera de lo estandar.

**Firebase** &rarr; integrado con Flutter y provee varios servicios: Firebase Authentication - Firestore Database - Firebase Storage.

Trabajar con NoSQL tiene ventajas y desafios:
- Nos permite iterar mucho más rápidamente ya que no precisamos realizar migraciones de esquemas en la mayoría de los cambios.
- Nos exige programar de manera mucho más defensiva ya que nadie me asegura que los datos que intento obtener estén ahí.

