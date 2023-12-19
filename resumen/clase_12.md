# Testing
[Go to Index](resumen.md)

**Que es?** &rarr; Testear no significa verificar la correctitud del código sino más bien asegurarme de queel código no cambie sin que me entere.

**Por que?** &rarr; Escribimos tests para asegurarnos de que el código siga obteniendo el mismo resultado que cuando lo escribí, hasta que sea necesario cambiarlos.

## Tipos

### User Journey Test

- Son los mas abarcativos.
- Este tipo de test se trata de elegir una funcionalidad, representada por un flujo de usuario y testearla. 
- No se verifican elementos visuales sino únicamente la completitud de la funcionalidad en cuestión.

Pros:
1. Permiten incluir mucha funcionalidad en un solo test.
2. Con pocos user journey tests se puede abarcar gran parte de la app.
3. Es lo más cercano a testear en producción.

Cons:
1. Muy lentos de ejecutar.
2. Difíciles de automatizar.
3. Pueden ser intestables (flaky).

### Golden Test

Consiste en testear los píxeles que imprime una pantalla. La manera de realizarlo es guardando el bitmap original cuando se ejecuta el primer test, y luego comparando cada bitmap con el original.

Pros:
1. Requieren pocas líneas de código.
2. Permiten testear mucha información.
3. Es una manera rápida y barata de evitar cambios indeseados en la UI.

Cons:
1. Cualquier cambio en la UI requiere volver a generar los bitmaps para comparar.
2. A veces un cambio en una librería o framework puede afectar este tipo de tests y que den falsos.

### User Interaction Test

Se trata de testear que las interacciones produzcan el resultado esperado.

Pros:
1. Corren rápido.
2. Involucran poco código.

Cons:
1. Cubren poca funcionalidad.
2. Pueden ser difíciles de implementar.

### Protocol Test

- No tienen relacion directa con los requerimientos funcionales.
- Busca testear los protocolos internos definidos en la arquitectura.

Pros:
1. Corren rapido.

Cons:
1. Es tan efectivo como la calidad de la arquitectura.

### Unit Test

Son los más pequeños en cuanto a granularidad de lo que se testea. Se testea una sola función, método o clase.

Pros:
1. Cortos
2. Fáciles de escribir
3. Rápidos

Cons:
1. Pueden haber cientos de unit tests
2. El mantenimiento se puede volver tedioso

## Herramientas

- **Interaction Test** &rarr; User Journey
- **Widget Test** &rarr; Golden - User Interaction
- **Dart Test** &rarr; Protocol - Unit