# Tema 1 — Introducción a Java
## Laboratorio de prácticas por concepto


> **Base del material:** este documento amplía la presentación V14 correspondiente.  
> **Enfoque:** mantiene el orden, terminología y ejemplos de la PPT, pero desarrolla con mayor detalle los conceptos para estudio y dictado de clase.  
> **Entorno sugerido:** JDK moderno + IntelliJ IDEA.


# Práctica 1 — Verificar JDK

```text
java -version
javac -version
```

Registrar ambas versiones y explicar para qué sirve cada comando.

---

# Práctica 2 — Compilar manualmente

```java
public class Main {
    public static void main(String[] args) {
        System.out.println("Hola Java");
    }
}
```

Compilar:

```text
javac Main.java
```

Ejecutar:

```text
java Main
```

Verificar que se genere `Main.class`.

---

# Práctica 3 — Estructura de clase

Usar:

```java
public class Estudiante {

    public static void main(String[] args) {
        System.out.println("Estudiante IDAT");
    }

}
```

Identificar:

- clase;
- método;
- bloque;
- sentencia;
- identificador.

---

# Práctica 4 — Palabras reservadas

```java
public class Demo {

    public static int sumar(int a, int b) {
        return a + b;
    }
}
```

Explicar `public`, `class`, `static`, `int`, `return`.

---

# Práctica 5 — args

```java
public class Main {

    public static void main(String[] args) {

        System.out.println(args.length);

        for (String arg : args) {
            System.out.println(arg);
        }
    }
}
```

Ejecutar:

```text
java Main Ana Java IDAT
```

---

# Práctica 6 — Comentarios

Crear un ejemplo que use:

```java
// comentario
```

```java
/* bloque */
```

```java
/** Javadoc */
```

Explicar cuándo usar cada uno.

---

# Práctica 7 — package e import

Estructura:

```text
src/com/idat/app/Main.java
```

Usar:

```java
package com.idat.app;
import java.util.Scanner;
```

---

# Práctica 8 — Scanner

```java
Scanner scanner = new Scanner(System.in);

System.out.print("Nombre: ");
String nombre = scanner.nextLine();

System.out.print("Edad: ");
int edad = Integer.parseInt(scanner.nextLine());
```

Probar con tres usuarios.

---

# Práctica 9 — IntelliJ vs terminal

Ejecutar el mismo proyecto desde:

1. IntelliJ.
2. Terminal.

Completar:

| Aspecto | IntelliJ | Terminal |
|---|---|---|
| compilar | | |
| ejecutar | | |
| ver errores | | |
| facilidad | | |

---

# Práctica 10 — Provocar errores

## Compilación

```java
int edad = "20";
```

## Ejecución

```java
int edad = Integer.parseInt("abc");
```

## Lógico

```java
double promedio = 10 + 20 / 2;
```

Registrar mensajes y explicar.

---

# Práctica 11 — Referencias y Heap

```java
class Producto {
    String nombre;
}

public class Main {

    public static void main(String[] args) {

        Producto p1 = new Producto();
        p1.nombre = "Mouse";

        Producto p2 = p1;
        p2.nombre = "Teclado";

        System.out.println(p1.nombre);
    }
}
```

Antes de ejecutar, predecir el resultado.

---

# Práctica 12 — Proyecto integrador

Crear `RegistroEstudiante`.

Datos:

- código;
- nombre;
- edad;
- carrera;
- ciclo.

Salida:

```text
--- FICHA DEL ESTUDIANTE ---
Código:
Nombre:
Edad:
Carrera:
Ciclo:
```

Entregar:

- código;
- captura;
- diagrama;
- tres pruebas;
- explicación de JDK, JVM, main y Scanner.
