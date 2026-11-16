# Tema 2 — Sintaxis y conceptos básicos
## Documento de teoría ampliada


> **Base del material:** este documento amplía la presentación V14 correspondiente.  
> **Enfoque:** mantiene el orden, terminología y ejemplos de la PPT, pero desarrolla con mayor detalle los conceptos para estudio y dictado de clase.  
> **Entorno sugerido:** JDK moderno + IntelliJ IDEA.


# 1. Variables

```java
int edad = 20;
```

- `int`: tipo.
- `edad`: identificador.
- `20`: valor.

Declarar:

```java
int edad;
```

Inicializar:

```java
edad = 20;
```

Reasignar:

```java
edad = 21;
```

---

# 2. final

```java
final double IGV = 0.18;
```

Una variable `final` no puede reasignarse.

---

# 3. Tipos primitivos

| Tipo | Ejemplo |
|---|---|
| byte | 10 |
| short | 1000 |
| int | 50000 |
| long | 10L |
| float | 2.5F |
| double | 19.9 |
| char | 'A' |
| boolean | true |

---

# 4. Wrappers

| Primitivo | Wrapper |
|---|---|
| byte | Byte |
| short | Short |
| int | Integer |
| long | Long |
| float | Float |
| double | Double |
| char | Character |
| boolean | Boolean |

Uso:

```java
List<Integer> numeros = new ArrayList<>();
```

---

# 5. Autoboxing / unboxing

```java
int edad = 20;
Integer obj = edad;
int copia = obj;
```

Riesgo:

```java
Integer n = null;
int valor = n;
```

Puede causar `NullPointerException`.

---

# 6. Casting

```java
int n = 10;
double d = n;
```

Widening.

```java
double p = 19.9;
int entero = (int) p;
```

Narrowing.

---

# 7. Operadores

## Aritméticos

```text
+ - * / %
```

## Relacionales

```text
== != > < >= <=
```

## Lógicos

```text
&& || !
```

---

# 8. String

```java
String texto = "Java";
```

Métodos:

```java
texto.length();
texto.contains("av");
texto.substring(1, 3);
texto.toUpperCase();
texto.equals("Java");
```

---

# 9. == vs equals

```java
String a = new String("Java");
String b = new String("Java");
```

```java
a == b
```

compara referencias.

```java
a.equals(b)
```

compara contenido.

---

# 10. if simple

```java
if (stock == 0) {
    System.out.println("Sin stock");
}
```

---

# 11. if / else

```java
if (edad >= 18) {
    System.out.println("Mayor");
} else {
    System.out.println("Menor");
}
```

---

# 12. if / else if / else

```java
if (nota >= 18) {
    nivel = "Excelente";
} else if (nota >= 13) {
    nivel = "Aprobado";
} else {
    nivel = "Desaprobado";
}
```

---

# 13. if anidado

```java
if (usuarioActivo) {
    if (tienePermiso) {
        ingresar();
    }
}
```

---

# 14. Ternario

```java
String estado =
    edad >= 18
        ? "Mayor"
        : "Menor";
```

---

# 15. switch clásico

```java
switch (opcion) {

    case 1:
        registrar();
        break;

    case 2:
        buscar();
        break;

    default:
        error();
}
```

---

# 16. switch moderno

```java
switch (opcion) {
    case 1 -> registrar();
    case 2 -> buscar();
    default -> error();
}
```

---

# 17. case múltiple

```java
switch (dia) {
    case 1, 2, 3, 4, 5 -> System.out.println("Laborable");
    case 6, 7 -> System.out.println("Fin de semana");
    default -> System.out.println("Inválido");
}
```

---

# 18. switch expression

```java
String accion = switch (opcion) {
    case 1 -> "Registrar";
    case 2 -> "Buscar";
    default -> "Inválida";
};
```

---

# 19. yield

```java
String resultado = switch (opcion) {
    case 1 -> {
        System.out.println("Procesando");
        yield "Registro";
    }
    default -> "Inválido";
};
```

---

# 20. for

```java
for (int i = 0; i < 5; i++) {
    System.out.println(i);
}
```

---

# 21. while

```java
while (saldo > 0) {
    saldo--;
}
```

---

# 22. do-while

```java
do {
    opcion = leer();
} while (opcion != 0);
```

---

# 23. break y continue

```java
if (i == 8) {
    break;
}
```

```java
if (i == 5) {
    continue;
}
```

---

# 24. try / catch

```java
try {
    int numero = Integer.parseInt(texto);
} catch (NumberFormatException e) {
    System.out.println("Número inválido");
}
```

---

# 25. finally

```java
finally {
    System.out.println("Fin");
}
```

---

# 26. Múltiples catch

```java
try {
    procesar();
} catch (NumberFormatException e) {
    System.out.println("Formato");
} catch (IllegalArgumentException e) {
    System.out.println("Argumento");
}
```

---

# 27. Modificadores de acceso

| Contexto | public | protected | package-private | private |
|---|---|---|---|---|
| misma clase | sí | sí | sí | sí |
| mismo paquete | sí | sí | sí | no |
| subclase otro paquete | sí | sí* | no | no |
| no relacionada | sí | no | no | no |

---

# 28. Ejemplo integrador

```java
do {

    try {

        opcion =
            Integer.parseInt(
                scanner.nextLine()
            );

        switch (opcion) {

            case 1 -> sumar();

            case 2 -> dividir();

            case 0 ->
                System.out.println("Fin");

            default ->
                System.out.println("Opción inválida");
        }

    } catch (NumberFormatException e) {

        System.out.println(
            "Ingrese un número"
        );
    }

} while (opcion != 0);
```

---

# 29. Recursos

- `https://docs.oracle.com/en/java/javase/26/language/`
- `https://docs.oracle.com/en/java/javase/26/language/switch-expressions-statements.html`
- `https://docs.oracle.com/en/java/javase/26/docs/api/java.base/java/lang/package-summary.html`
