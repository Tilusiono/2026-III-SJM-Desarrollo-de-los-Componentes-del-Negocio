# Tema 2 — Sintaxis y conceptos básicos
## Laboratorio de prácticas por concepto


> **Base del material:** este documento amplía la presentación V14 correspondiente.  
> **Enfoque:** mantiene el orden, terminología y ejemplos de la PPT, pero desarrolla con mayor detalle los conceptos para estudio y dictado de clase.  
> **Entorno sugerido:** JDK moderno + IntelliJ IDEA.


# Práctica 1 — Variables

Crear:

```java
int edad = 20;
double sueldo = 3500.50;
String nombre = "Ana";
boolean activo = true;
```

Mostrar y reasignar valores.

---

# Práctica 2 — final

```java
final double IGV = 0.18;
```

Intentar:

```java
IGV = 0.20;
```

Registrar el error.

---

# Práctica 3 — Primitivos

Crear una variable de cada tipo primitivo e imprimirlas.

---

# Práctica 4 — Wrappers

Usar:

```java
Integer.parseInt("200");
Integer.valueOf("200");
Double.parseDouble("99.50");
```

Explicar qué retorna cada uno.

---

# Práctica 5 — Autoboxing / unboxing

```java
int numero = 10;
Integer wrapper = numero;
int copia = wrapper;
```

Luego:

```java
Integer valor = null;
int n = valor;
```

Registrar el resultado.

---

# Práctica 6 — Casting

```java
double precio = 19.99;
int entero = (int) precio;
```

Explicar qué se pierde.

---

# Práctica 7 — Operadores

Para:

```java
int a = 15;
int b = 4;
```

calcular `+ - * / %` y comparaciones.

---

# Práctica 8 — String

```java
String curso = "Fundamentos de Java";
```

Aplicar:

```text
length
contains
substring
toUpperCase
toLowerCase
```

---

# Práctica 9 — == vs equals

```java
String a = new String("Java");
String b = new String("Java");
```

Comparar ambas formas.

---

# Práctica 10 — if simple

Si `stock == 0`, mostrar `Sin stock`.

---

# Práctica 11 — if / else

Clasificar mayoría de edad.

---

# Práctica 12 — if / else if

Notas:

```text
18–20 Excelente
13–17 Aprobado
0–12 Desaprobado
```

---

# Práctica 13 — if anidado

Resolver ingreso con:

```text
usuarioActivo
tienePermiso
```

Luego rehacer con `&&`.

---

# Práctica 14 — Ternario

Resolver edad con ternario y luego con if/else.

---

# Práctica 15 — switch clásico

Menú:

```text
1 Registrar
2 Buscar
3 Listar
0 Salir
```

---

# Práctica 16 — switch moderno

Rehacer con `case ->`.

---

# Práctica 17 — case múltiple

Días 1–5 laborable; 6–7 fin de semana.

---

# Práctica 18 — switch expression

Convertir número de mes en nombre.

---

# Práctica 19 — yield

Crear tarifa con bloque `case` y `yield`.

---

# Práctica 20 — for

Mostrar:

- 1 a 10;
- 10 a 1;
- pares;
- múltiplos de 3.

---

# Práctica 21 — while

Solicitar contraseña hasta que sea correcta.

---

# Práctica 22 — do-while

Crear menú que se muestre al menos una vez.

---

# Práctica 23 — break

Interrumpir un ciclo cuando `i == 12`.

---

# Práctica 24 — continue

Mostrar 1 a 10 excepto 5.

---

# Práctica 25 — try/catch

Leer edad con `Integer.parseInt` y capturar `NumberFormatException`.

---

# Práctica 26 — múltiples catch

Combinar conversión y división; tratar distintos errores.

---

# Práctica 27 — finally

Mostrar `Intento finalizado` haya o no excepción.

---

# Práctica 28 — Modificadores

Crear dos paquetes y probar:

```java
public int a;
protected int b;
int c;
private int d;
```

Completar una matriz real de acceso.

---

# Práctica 29 — Calculadora robusta

Menú:

```text
1 Sumar
2 Restar
3 Multiplicar
4 Dividir
0 Salir
```

Requisitos:

- `do-while`;
- `switch`;
- `try/catch`;
- división por cero;
- contador de operaciones;
- contador de errores.

Entregar mínimo 6 casos de prueba.
