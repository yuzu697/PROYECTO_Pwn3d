# ☕ Aplicación Java - Plataforma de CTFs Éticos

Este módulo representa el núcleo de la aplicación web: está desarrollado en **Java** bajo el nombre de proyecto `Pwn3dWeb`, y contiene toda la lógica de negocio, la API y el controlador de acceso a la base de datos.

---

## 🧰 Requisitos Previos

- **Java JDK 17+**
- **Eclipse IDE for Enterprise Java Developers**
- **Apache Maven**
- PostgreSQL en ejecución (la app se conecta a la base de datos montada con el script `mount_DDBB.sql`)
- Archivo `application.properties` configurado (se explica más abajo)

---

## 🛠️ Cómo importar el proyecto en Eclipse

1. Abre Eclipse.
2. Ve a **File > Import > Maven > Existing Maven Projects**.
3. Selecciona la carpeta del proyecto `Pwn3dWeb`.
4. Eclipse detectará automáticamente el archivo `pom.xml`. Haz clic en **Finish**.
5. Espera a que se resuelvan las dependencias Maven.

---

## 📁 Estructura del Proyecto

El proyecto sigue el patrón MVC (Modelo-Vista-Controlador) con capas bien definidas:

```
/Pwn3dWeb
│
├── /src/main/java
│ ├── /controllers -> Controladores REST
│ ├── /services -> Lógica de negocio
│ ├── /dao -> Interfaces DAO (Data Access Object)
│ ├── /models -> Entidades y modelos de datos
│ └── /config -> Configuración general (CORS, seguridad, etc.)
│
├── /src/main/resources
│ ├── application.properties -> Configuración de conexión a la base de datos
│ └── /static, /templates -> Recursos web si aplica (dependiendo del stack)
```

## ⚙️ `application.properties` (conexión a PostgreSQL)

Asegúrate de configurar este archivo con los datos correctos de la base de datos:

```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/ctf_platform
spring.datasource.username=tu_usuario
spring.datasource.password=tu_password
spring.jpa.hibernate.ddl-auto=none
spring.jpa.show-sql=true
```
> ⚠️ No uses create o update en ddl-auto si ya estás importando la base con ``mount_DDBB.sql``, para evitar que Spring intente sobreescribir.

## 📦 ¿Cómo funciona la app?

Controladores (`controllers`): gestionan las peticiones HTTP (GET, POST, etc.) y redirigen a los servicios correspondientes.

Servicios (`services`): contienen la lógica de negocio (validaciones, reglas, etc.).

DAOs (`dao`): interfaces que manejan el acceso a la base de datos mediante JPA/Hibernate.

Modelos (`models`): representan las entidades que se mapean con las tablas SQL (usuarios, retos, etc.).

## ▶️ Cómo ejecutar la aplicación

Abre el proyecto en Eclipse.

Asegúrate de tener la base de datos activa y accesible.

Ejecuta la clase principal (con `@SpringBootApplication`).

Accede a `http://localhost:8080` o al endpoint configurado.

## 📡 Endpoints (ejemplo)

`GET /retos` → lista de CTFs disponibles.

`POST /login` → autenticación de usuarios (redirige al módulo Python si aplica).

`POST /writeup` → subida de soluciones.

`GET /ranking` → ranking de usuarios.

Se incluirá una documentación Swagger o Postman próximamente.

## 🧪 Pruebas

Puedes crear pruebas unitarias o de integración dentro del paquete `/test`, usando `JUnit` y `MockMvc` para simular peticiones.

## 🚧 TODO (roadmap interno)

- Documentación Swagger de API.
- Integración OAuth para login externo.
- Frontend integrado (actualmente backend puro).
- Dockerización del backend.

#### ¿Dudas o sugerencias? ¡Crea un issue o contribuye con un PR! 💻
