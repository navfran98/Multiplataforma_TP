# User Input
[Go to Index](resumen.md)

User input es la manera de obtener información de los usuarios y generar un mayor engagement personalizando su experiencia. Al mismo tiempo es una fuente de fricciones muy grandes que pueden empobrecer mucho la usabilidad y reducir el éxito de la aplicación.

Tipos &rarr; touch, voice, sensors, hardware buttons and peripherals.

## Desafios

### Tamaño de pantalla

Nos da un espacio muy limitado para elementos,botones, etc. Hay distintas tecnicas para ayudar al usuario:
- Autocompletar, ver contraseña, separar un formulario largo, proveer social log in, mostrar solo teclado numerico.

### Accesibilidad

Soporte para diferentes tipos de inputs para usuarios condiscapacidades

### Manejo de errores

Proveer una interfaz clara y una correctavisualización de errores para minimizar los intentos de los usuarios. Dentro de lo posible:
- Prevenir errores dando informacion clara.
- Mostrar errores lo mas temprano posible.
- Especificar cual fue el error.

### Dialogo de confirmacion

Para operaciones complejas/criticas perdirle al usuario que confirme antes de ejecutar cada accion.

### Duplicacion de envio

Evitar que el usuario pueda enviar más de una vez información deformularios que no sea idempotentes. Bloquear el botón de envío y sies posible agregar chequeos en el backend.

### Conectividad

Mientras el usuario está completando información en un formulario,podrían ocurrir varios eventos que interrumpan o borren la información cargada.

## Practicas Comunes

- Minimizar la friccion con el usuario.
- Demorar lo maximo posible la carga de formularios pesados.
- Obtener informacion del usuario sin perdisela (dentro de lo posible).
- Utilizar servicios de autenticacion como AuthO.

