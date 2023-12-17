# State Management
[Go to Index](resumen.md)

Consiste en la gestion del estado de la app, osea toda la informacion que va a definir el comportamiento y visualizacion de la app.

**Eventos** generan cambios de estado, los cuales generan cambios en la presentacion.

## Ephemeral State

**Estado Efimero** &rarr; Estado que puede estar contenido en un solo widget, tambien llamado estado local. Para manejar este estado se usa un Stateful Widget, y es a traves del _Set State_.

## App State

Es el estado que necesita ser compartido en varias partes de la app y es compartido entre distintas sesiones. Hay muchas alternativas para gestionar el estado de la app en Flutter.

Ejemplos &rarr; preferencias de usuario, informacion de login, notificaciones en una red social, carrito de compras, etc.

## Approaches

- Provider/Riverpod
- setState(bajo nivel/widgets)
- Inherited Widgets (bajo nivel/Provider lo usa por detras)
- Redux
- Bloc
- Blinder
- GetX

### Provider

Es una forma de implementar _app state management_ en Flutter. Tiene la desventaja de que utiliza estado mutable, lo que hace dificil de mantenerlo a medida que la app aumenta de tamaño.

- **Change Notifier** &rarr; Es una clase que permite definir a un objeto como "observable". Proveenotificaciones para los objetos que escuchen sus cambios.

- **Change Notifier Provider** &rarr; Es un widget que provee un ChangeNotifier a sus widgets hijos.