# Navigation
[Go to Index](resumen.md)

**Arquitecture de la Informacion** &rarr; Define una organización jerárquica del contenido de la app, la cual es la base para la navegacion.

## Tipos de Navigation

### Lateral Navigation

Consiste en navegar entre paginas del mismo nivel de jerarquia.

El componente de navegacion principal de la app deberia permitir el acceso a todas las paginas del nivel de jerarquia mas alto. 

Algunas componentes usadas para navegacion lateral &rarr; **Navigation Drawer, Bottom Navigation Bar, Tbas**.

### Forward Navigation

Consiste en navegar hacia los niveles mas bajos de la jerarquia de paginas, se realiza de manera secuencial, nivel por nivel o directamente salteandose varios niveles.

Se puede implementar usando &rarr; Botones, Links, Busqueda, Content Containers (cards, listas, etc.).

### Reverse Navigation

Esta se puede realizar de dos formas &rarr; **Jerarquicamente** o **Cronologicamente**.

1. **Cronologico**: en Android y Web, el estandar es que se realice con el _back button_, IOS no provee una forma de hacerlo.

2. **Jerarquica**: tiene que implementarse para cada nivel, y se suele usar un boton de flecha en cada pantalla.

## Navigator

Es un **Stateful Widget** que permite la navegacion en la app. Se suele crear automaticamente a partir del _Router_ que se crea en la Material App.

Permite navegar de manera **imperativa** usando Navigator.push y Navigator.pop, y tambien de manera **declarativa** usando Navigator.pages.


Tambien se pueden definir **named routes** que permite ponerle un nombre a cada pagina y poder utilizar _deep links_ (se recomiendo usar esto solo para apps basicas). 

### Navigator 1.0

Contaba únicamente con la forma imperativa de navegar (push y pop), locual tiene varias limitaciones, incluyendo la falta de control sobre el stackde navegación y un limitado soporte para deep links

### Navigator 2.0

- Tiene un enfoque mas declarativo.
- Involucra al estado de la app para definir el stack de navegacion.
- Permite gestionar deep links de una mejor manera.
- Introduce varios elementos:
    - **Pages** &rarr; es la configuración inmutable de un Route
    - **Router** &rarr; configura la lista de páginas que manejara el Navigator. 
    - **RouterDelegate** &rarr; el corazón del router. Mapea el estado de la app a unstack de Pages
    - **RouterInformationParser** &rarr; una clase que parsea routes a estado de la appy viceversa
    - **BackButtonDispatcher** &rarr; reporta cuando se presiona el botón "back" enAndroid

**Go Router** &rarr; Paquete que nos permite de manera declarativa definir las URLs de la app y acceder de manera simplificada a cada ruta.

**Deep Links** &rarr; Es una manera de acceder a una parte especifica de la app a partir de un link. Se usan _URIs_, con un scheme, una authority y un path. Se suelen usar para Push Notifications, Publicidades, Codigos QR, etc. Tiene algunos desafios:

    - Compatibilidad hacia atras
    - Problemas de estado cuando se abre un deep link.
    - Falta de planificacion, es bastante complejo agregar deep links de manera tardia.