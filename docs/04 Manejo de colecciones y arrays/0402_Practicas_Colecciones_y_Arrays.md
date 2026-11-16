# Tema 4 — Colecciones y Arrays
## Laboratorio de prácticas por concepto


> **Base del material:** este documento amplía la presentación V14 correspondiente.  
> **Enfoque:** mantiene el orden, terminología y ejemplos de la PPT, pero desarrolla con mayor detalle los conceptos para estudio y dictado de clase.  
> **Entorno sugerido:** JDK moderno + IntelliJ IDEA.


# Práctica 1 — Array literal

Crear array de estaciones e imprimir por índices.

---

# Práctica 2 — Array fijo

```java
String[] nombres = new String[3];
```

Completar las posiciones.

---

# Práctica 3 — Modificar posición

Cambiar índice 1 y mostrar antes/después.

---

# Práctica 4 — for

Recorrer mostrando índice y valor.

---

# Práctica 5 — enhanced for

Recorrer sin índice y comparar.

---

# Práctica 6 — matriz

Crear notas 2x3 y recorrer con dos `for`.

---

# Práctica 7 — Array vs ArrayList

Registrar 3 nombres con array y luego intentar un cuarto; repetir con ArrayList.

---

# Práctica 8 — add

Crear lista:

```java
[A, B, C]
```

insertar X en índice 1.

---

# Práctica 9 — get

Leer un índice solicitado por usuario y validar rango.

---

# Práctica 10 — set

Reemplazar un elemento.

---

# Práctica 11 — remove

Probar:

```java
remove(index)
remove(objeto)
```

---

# Práctica 12 — remove con Integer

Comparar:

```java
numeros.remove(1);
```

y:

```java
numeros.remove(Integer.valueOf(1));
```

---

# Práctica 13 — contains e indexOf

Buscar valores existentes e inexistentes.

---

# Práctica 14 — HashSet.add

Agregar:

```text
P001
P002
P003
P001
```

Mostrar boolean devuelto.

---

# Práctica 15 — HashSet.contains

Buscar P002 y P999.

---

# Práctica 16 — HashMap.put

Registrar:

```text
P001 → Mouse
P002 → Teclado
```

---

# Práctica 17 — Reemplazar clave

Volver a hacer put con P001 y otro valor.

---

# Práctica 18 — get

Consultar P001 y P999.

---

# Práctica 19 — containsKey

Verificar si una clave ya existe antes de registrar.

---

# Práctica 20 — remove

Eliminar P001 y validar ausencia.

---

# Práctica 21 — keySet

Recorrer solo claves.

---

# Práctica 22 — values

Recorrer solo valores.

---

# Práctica 23 — entrySet

Recorrer clave y valor simultáneamente.

---

# Práctica 24 — List vs Set vs Map

Elegir estructura para:

- secuencia con duplicados;
- códigos únicos;
- búsqueda por código;
- lista editable.

---

# Práctica 25 — Producto

Crear clase:

```java
public class Producto {

    private String codigo;
    private String nombre;
    private double precio;
    private int stock;
}
```

---

# Práctica 26 — List<Producto>

Agregar tres productos y recorrerlos.

---

# Práctica 27 — Map<String, Producto>

Indexar productos por código y buscar.

---

# Práctica 28 — equals

Hacer que productos con el mismo código sean iguales.

---

# Práctica 29 — hashCode

Implementarlo coherente con código y probar con HashSet.

---

# Práctica 30 — Comparación conceptual

Usar `contains` sobre ArrayList y HashSet con muchos números.

No se busca benchmark exacto; explicar por qué la estructura influye.

---

# Práctica 31 — Inventario CRUD

Estructuras:

```java
List<Producto> lista =
    new ArrayList<>();

Set<String> codigos =
    new HashSet<>();

Map<String, Producto> indice =
    new HashMap<>();
```

Menú:

```text
1 Registrar
2 Buscar
3 Listar
4 Actualizar stock
5 Eliminar
6 Resumen
0 Salir
```

Validaciones:

- código obligatorio;
- código único;
- precio > 0;
- stock >= 0.

Entregar:

- código;
- arquitectura;
- 10 casos de prueba;
- explicación de por qué se usa cada estructura.
