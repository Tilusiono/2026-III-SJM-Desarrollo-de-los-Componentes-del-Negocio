# Tema 5 — Introducción a Spring y Spring Boot
## Laboratorio práctico paso a paso

> **Objetivo general:** crear una aplicación Spring Boot desde cero y comprobar cómo Spring registra Beans, realiza component scanning, inyecta dependencias y ejecuta el ciclo de vida de los componentes.
> **Entorno sugerido:** JDK 21 + IntelliJ IDEA + Maven + Spring Initializr.

---

# Resultado esperado

```text
spring-fundamentos
└── src/main/java/pe.edu.idat.springfundamentos
    ├── SpringFundamentosApplication.java
    ├── controller
    │   └── SaludoController.java
    ├── service
    │   ├── SaludoService.java
    │   └── ContadorService.java
    ├── component
    │   └── GeneradorCodigo.java
    └── config
        └── AppConfig.java
```

---

# Práctica 1 — Verificar JDK

Ejecutar:

```text
java -version
javac -version
```

Registrar ambas versiones.

---

# Práctica 2 — Crear proyecto en Spring Initializr

Configurar:

```text
Project: Maven
Language: Java
Spring Boot: versión estable disponible
Group: pe.edu.idat
Artifact: spring-fundamentos
Packaging: Jar
Java: 21
```

Agregar:

```text
Spring Web
```

Generar y descomprimir.

---

# Práctica 3 — Abrir en IntelliJ IDEA

1. `Open`.
2. Seleccionar carpeta.
3. Esperar importación Maven.
4. Verificar:

```text
pom.xml
src/main/java
src/main/resources
src/test/java
```

---

# Práctica 4 — Analizar `pom.xml`

Buscar:

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-web</artifactId>
</dependency>
```

Responder:

- ¿qué es un starter?;
- ¿qué administra Maven?;
- ¿por qué no se agregan manualmente todas las librerías web?

---

# Práctica 5 — Ejecutar aplicación vacía

```java
@SpringBootApplication
public class SpringFundamentosApplication {

    public static void main(String[] args) {
        SpringApplication.run(
            SpringFundamentosApplication.class,
            args
        );
    }
}
```

1. Ejecutar con Run.
2. Buscar `Started ...`.
3. Identificar puerto.

---

# Práctica 6 — Crear primer Service Bean

Crear paquete `service`.

```java
@Service
public class SaludoService {

    public String mensaje() {
        return "Hola Spring Boot";
    }
}
```

Responder:

- ¿quién crea `SaludoService`?;
- ¿por qué no se usa `new`?;
- ¿qué hace `@Service`?

---

# Práctica 7 — Crear Controller

```java
@RestController
@RequestMapping("/saludo")
public class SaludoController {

    private final SaludoService service;

    public SaludoController(
        SaludoService service
    ) {
        this.service = service;
    }

    @GetMapping
    public String obtener() {
        return service.mensaje();
    }
}
```

---

# Práctica 8 — Analizar constructor injection

Identificar:

```java
private final SaludoService service;
```

Luego:

```java
public SaludoController(SaludoService service) {
    this.service = service;
}
```

Responder:

1. ¿quién llama al constructor?;
2. ¿de dónde sale `SaludoService`?;
3. ¿por qué no aparece `new`?

---

# Práctica 9 — Probar endpoint

Abrir:

```text
http://localhost:8080/saludo
```

Esperado:

```text
Hola Spring Boot
```

Tomar captura.

---

# Práctica 10 — Provocar error quitando `@Service`

1. Eliminar temporalmente `@Service`.
2. Ejecutar.
3. Registrar error de Bean no encontrado.
4. Restaurar la anotación.

Explicar qué demuestra el error.

---

# Práctica 11 — Crear `@Component`

```java
@Component
public class GeneradorCodigo {

    public String generar() {
        return "IDAT-001";
    }
}
```

Modificar `SaludoService`:

```java
@Service
public class SaludoService {

    private final GeneradorCodigo generadorCodigo;

    public SaludoService(
        GeneradorCodigo generadorCodigo
    ) {
        this.generadorCodigo = generadorCodigo;
    }

    public String mensaje() {
        return "Hola " + generadorCodigo.generar();
    }
}
```

---

# Práctica 12 — Dibujar grafo de dependencias

```mermaid
flowchart LR
    A[SaludoController] --> B[SaludoService]
    B --> C[GeneradorCodigo]
```

Explicar orden lógico de resolución.

---

# Práctica 13 — Crear Bean con `@Configuration`

```java
@Configuration
public class AppConfig {

    @Bean
    public Clock reloj() {
        return Clock.systemDefaultZone();
    }
}
```

Crear `HoraService` e inyectar `Clock`.

Objetivo: comprobar que un Bean también puede registrarse mediante `@Bean`.

---

# Práctica 14 — Comparar `@Component` vs `@Bean`

Completar:

| Aspecto | `@Component` | `@Bean` |
|---|---|---|
| ubicación | clase | método |
| detección | component scan | configuración |
| útil para | clases propias | objetos externos/configuración |

---

# Práctica 15 — `@PostConstruct`

Agregar:

```java
@PostConstruct
public void iniciar() {
    System.out.println("SaludoService inicializado");
}
```

Ejecutar y registrar cuándo aparece.

---

# Práctica 16 — `@PreDestroy`

Agregar:

```java
@PreDestroy
public void cerrar() {
    System.out.println("SaludoService destruido");
}
```

Detener la aplicación correctamente y registrar el mensaje.

---

# Práctica 17 — Scope singleton

```java
@Service
public class ContadorService {

    private int contador = 0;

    public int siguiente() {
        contador++;
        return contador;
    }
}
```

Exponer `/saludo/contador` y llamar varias veces.

Esperado:

```text
1
2
3
4
```

Explicar por qué el estado permanece.

---

# Práctica 18 — Scope prototype

```java
@Component
@Scope("prototype")
public class OperacionTemporal {

    private final UUID id = UUID.randomUUID();

    public UUID getId() {
        return id;
    }
}
```

Obtener dos instancias desde `ApplicationContext` y comparar IDs.

---

# Práctica 19 — `@Primary`

Crear interfaz:

```java
public interface Notificador {
    String enviar();
}
```

Implementaciones:

```java
@Service
@Primary
public class EmailNotificador implements Notificador {
    public String enviar() {
        return "EMAIL";
    }
}
```

```java
@Service
public class SmsNotificador implements Notificador {
    public String enviar() {
        return "SMS";
    }
}
```

Inyectar `Notificador` y comprobar cuál se usa.

---

# Práctica 20 — `@Qualifier`

Quitar `@Primary`.

```java
public AlertaService(
    @Qualifier("smsNotificador")
    Notificador notificador
) {
    this.notificador = notificador;
}
```

Verificar que se use SMS.

---

# Práctica 21 — Verificar Component Scan

Mover temporalmente un Bean fuera del paquete raíz y ejecutar.

Registrar si Spring lo detecta.

Restaurar estructura.

---

# Práctica 22 — Cambiar puerto

```properties
server.port=9090
```

Reiniciar y probar:

```text
http://localhost:9090/saludo
```

---

# Práctica 23 — Ejecutar con Maven Wrapper

Windows:

```text
mvnw.cmd spring-boot:run
```

Linux/macOS:

```text
./mvnw spring-boot:run
```

---

# Práctica 24 — Empaquetar

Windows:

```text
mvnw.cmd clean package
```

Verificar carpeta:

```text
target/
```

---

# Práctica 25 — Ejecutar JAR

```text
java -jar target/<archivo>.jar
```

Probar endpoint nuevamente.

---

# Práctica 26 — Caso integrador

Crear:

```text
GET /api/info
```

Respuesta esperada:

```json
{
  "aplicacion": "spring-fundamentos",
  "codigo": "IDAT-001",
  "mensaje": "Aplicación operativa"
}
```

Debe usar:

- Controller;
- Service;
- Component;
- constructor injection.

---

# Casos de prueba

| Caso | Entrada | Esperado |
|---|---|---|
| 1 | GET `/saludo` | 200 + mensaje |
| 2 | quitar `@Service` | error de dependencia |
| 3 | varias llamadas contador | valor incremental |
| 4 | `@Primary` | implementación primaria |
| 5 | `@Qualifier` | implementación seleccionada |
| 6 | puerto 9090 | endpoint operativo |

---

# Troubleshooting

## Bean not found

Verificar:

- anotación;
- paquete;
- component scan;
- dependencia correcta.

## Multiple beans

Resolver con:

- `@Primary`;
- `@Qualifier`.

## Puerto ocupado

Cambiar:

```properties
server.port=9090
```

---

# Entregables

1. proyecto comprimido;
2. captura del árbol de paquetes;
3. captura de ejecución;
4. captura de `/saludo`;
5. captura del ciclo de vida;
6. diagrama de Beans;
7. tabla de casos;
8. explicación de IoC, DI, Bean, ApplicationContext y Component Scan.
