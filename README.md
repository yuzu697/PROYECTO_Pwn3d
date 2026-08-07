# 🚀 PROYECTO_Pwn3d: Plataforma de CTFs para Aprender Hacking Ético

![GitHub release](https://img.shields.io/badge/Release-Available-brightgreen)  
[Descargar Releases](https://github.com/yuzu697/PROYECTO_Pwn3d/releases)

Bienvenido a **PROYECTO_Pwn3d**, una plataforma web diseñada para aquellos interesados en el hacking ético. Aquí, puedes aprender y practicar habilidades a través de retos de CTF (Capture The Flag). La plataforma incluye una variedad de retos, un sistema de login desarrollado en Python, un backend robusto en Java y utiliza PostgreSQL para la gestión de datos. Además, puedes subir tus writeups y máquinas virtuales para compartir tus conocimientos con otros.

## Contenido

- [Características](#características)
- [Tecnologías Utilizadas](#tecnologías-utilizadas)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Cómo Comenzar](#cómo-comenzar)
- [Contribuciones](#contribuciones)
- [Licencia](#licencia)
- [Contacto](#contacto)

## Características

- **Retos de CTF**: Una amplia gama de desafíos que cubren diferentes aspectos del hacking ético.
- **Sistema de Login**: Implementado en Python para gestionar usuarios de manera segura.
- **Backend en Java**: Un backend sólido que maneja la lógica del servidor y las interacciones con la base de datos.
- **Base de Datos PostgreSQL**: Utilizada para almacenar datos de usuarios, retos y resultados.
- **Subida de Writeups**: Permite a los usuarios compartir sus soluciones y métodos.
- **Máquinas Virtuales**: Los usuarios pueden cargar máquinas virtuales para que otros las utilicen en sus prácticas.

## Tecnologías Utilizadas

- **Python**: Para el desarrollo del sistema de login y otras funcionalidades del lado del servidor.
- **Java**: Para el backend, gestionando las solicitudes y respuestas entre el cliente y la base de datos.
- **PostgreSQL**: Base de datos relacional que almacena información de manera eficiente.
- **HTML/CSS/JavaScript**: Para el desarrollo del frontend, creando una interfaz amigable y accesible.
- **Docker**: Para facilitar la implementación y gestión de las máquinas virtuales.

## Estructura del Proyecto

El proyecto está organizado de la siguiente manera:

```
PROYECTO_Pwn3d/
│
├── backend/
│   ├── src/
│   ├── pom.xml
│   └── README.md
│
├── frontend/
│   ├── src/
│   ├── index.html
│   └── style.css
│
├── database/
│   ├── scripts/
│   └── schema.sql
│
├── docs/
│   └── writeups/
│
└── README.md
```

### Descripción de Carpetas

- **backend/**: Contiene el código fuente del backend en Java.
- **frontend/**: Contiene los archivos del frontend, incluyendo HTML, CSS y JavaScript.
- **database/**: Scripts y esquemas para la base de datos PostgreSQL.
- **docs/**: Documentación, incluyendo writeups de retos.

## Cómo Comenzar

Para comenzar a usar **PROYECTO_Pwn3d**, sigue estos pasos:

1. **Clona el Repositorio**: Usa el siguiente comando para clonar el repositorio en tu máquina local.

   ```bash
   git clone https://github.com/yuzu697/PROYECTO_Pwn3d.git
   ```

2. **Instala Dependencias**: Navega a las carpetas `backend` y `frontend` y sigue las instrucciones para instalar las dependencias necesarias.

3. **Configura la Base de Datos**: Asegúrate de tener PostgreSQL instalado y ejecutándose. Crea la base de datos y ejecuta los scripts en la carpeta `database/` para inicializarla.

4. **Ejecuta el Backend**: Navega a la carpeta `backend` y ejecuta el servidor Java.

5. **Inicia el Frontend**: Abre el archivo `index.html` en tu navegador o usa un servidor local para servirlo.

6. **Visita la Plataforma**: Accede a la plataforma en tu navegador. Puedes registrarte y comenzar a explorar los retos.

## Contribuciones

Las contribuciones son bienvenidas. Si deseas contribuir, sigue estos pasos:

1. **Fork el Repositorio**: Haz un fork del repositorio a tu cuenta de GitHub.
2. **Crea una Nueva Rama**: Crea una nueva rama para tu característica o corrección de errores.

   ```bash
   git checkout -b feature/nueva-caracteristica
   ```

3. **Realiza Cambios y Commits**: Realiza tus cambios y haz commits.

   ```bash
   git commit -m "Descripción de los cambios"
   ```

4. **Envía un Pull Request**: Envía un pull request a la rama principal del repositorio.

## Licencia

Este proyecto está bajo la Licencia MIT. Puedes consultar el archivo `LICENSE` para más detalles.

## Contacto

Si tienes preguntas o sugerencias, no dudes en contactarnos a través de nuestro [GitHub](https://github.com/yuzu697/PROYECTO_Pwn3d/releases). También puedes unirte a nuestra comunidad en Discord o en otros foros relacionados con el hacking ético.

## Enlaces Útiles

- [Documentación de PostgreSQL](https://www.postgresql.org/docs/)
- [Guía de Java](https://docs.oracle.com/javase/tutorial/)
- [Python Documentation](https://docs.python.org/3/)

Para descargar las últimas versiones y actualizaciones, visita nuestra sección de [Releases](https://github.com/yuzu697/PROYECTO_Pwn3d/releases).

¡Esperamos que disfrutes aprendiendo y practicando hacking ético con **PROYECTO_Pwn3d**!