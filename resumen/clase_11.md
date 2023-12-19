# Accesibilidad e Internacionalizacion
[Go to Index](resumen.md)

## Accesibilidad

Permite a usuarios con discapacidades poder acceder a la aplicación. Es importante no solo en términos de potenciales usuarios sino también por ciertas regulaciones que existen en diferentes países según el tipo de app.

### Principales

- Visual:
    - Ceguera &rarr; Lectores de pantalla (Arbol de accesibilidad de Flutter y el widget Semantics)
    - Vision reducida &rarr; Soporte para fuenta mas grande
    - Daltonismo &rarr; Alto contraste
- Auditiva &rarr; Subtitulos y transcripciones de audio
- Cognitiva:
    - Epilepsias &rarr; Reducir contenido potencialmente dañino
    - TDA &rarr; Simplicidad y reduccion de ruido

### Checklist

- Interacciones: toda interacción tiene que hacer algo, o sea darle feedback al usuario
- Testear con un screen reader
- Tener un contrast ratio de al menos 4.5/1
- Widgets tappeables: deben ser de al menos 48x48
- Errores: acciones importantes deberían poder deshacerse. Si es un error de un campo, sugerir correcciones.
- La app debe entenderse en modo escala de grises
- La UI debe entenderse para tamaños de letra grande

## Internacionalizacion

Implica desarrollar una app para que pueda adaptarse a diferentes ubicaciones.

Incluye &rarr; simbolos de moneda, separador decimal, orientacion texto, unidades de medida, fecha y hora.

Conviene hacerlo en el back ya que lo hace mas mantenible pero es mas costoso y lleva mas trabajo al principio.

**Pseudo Localizacion** &rarr; Es una manera de testear localización reemplazando el contenido traducible por uno que contenga elementos que puedan generar un conflicto.