# Plataforma de CTFs Éticos - Aprende Hacking Legalmente

Este repositorio contiene el desarrollo completo de una plataforma web de CTFs (Capture The Flag) para aprender hacking ético de manera estructurada y práctica.

## 🌐 Descripción General

El objetivo del proyecto es proporcionar un entorno seguro y legal donde los usuarios puedan:

- Aprender sobre ciberseguridad y hacking ético.
- Resolver retos técnicos (CTFs) clasificados por categorías y dificultad.
- Subir sus propios writeups y máquinas virtuales.
- Participar activamente en una comunidad de aprendizaje.

La plataforma acepta máquinas en formatos compatibles con:
- **VMWare**
- **VirtualBox**
- **Docker**

## 🧠 Características Principales

- **Autenticación segura:** Módulo de login desarrollado en Python.
- **Frontend y Backend en Java:** Toda la lógica de la aplicación principal está desarrollada en Java.
- **Base de Datos PostgreSQL:** Almacena usuarios, retos, puntuaciones, writeups y más.
- **Sistema de subida:** Los usuarios pueden subir sus propias máquinas y soluciones (writeups).
- **Interfaz amigable:** Diseño enfocado en la experiencia de aprendizaje y exploración.

## 🔐 Tecnologías Utilizadas

- **Lenguajes:** Java, Python, SQL
- **Frameworks/Librerías:** Spring Boot (Java), psycopg2 (Python)
- **Base de Datos:** PostgreSQL
- **Virtualización:** Docker, VMWare, VirtualBox

## 📁 Estructura del Repositorio

```
/src
/java-app -> Aplicación principal en Java
/python-auth -> Módulo de login y autenticación en Python
/database -> Scripts y esquemas SQL de PostgreSQL
/challenges -> Máquinas y retos para practicar
/writeups -> Soluciones enviadas por la comunidad
```

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! Puedes:

- Enviar tus propios CTFs (máquinas).
- Compartir writeups de los retos.
- Reportar errores o sugerencias mediante issues.
- Mejorar el código o la documentación.

## 🚀 Cómo Ejecutar el Proyecto

1. Clona el repositorio.
2. Levanta la base de datos con PostgreSQL.
3. Inicia el módulo de autenticación en Python.
4. Ejecuta la aplicación Java.
5. Accede a través del navegador en el puerto configurado.

Pronto se incluirán scripts automatizados de despliegue y documentación técnica más detallada.

## 📜 Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo `LICENSE` para más detalles.

---

**¡Únete y aprende hacking ético con nosotros! 🛡️**
