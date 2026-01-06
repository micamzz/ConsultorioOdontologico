# 🦷 Sistema de Gestión para Clínica Odontológica

Proyecto pesonal desarrollado con el objetivo de aplicar y consolidar conocimientos en **desarrollo web con Java**, simulando un escenario real de gestión administrativa para un consultorio odontológico.

>  Este sistema **no es un producto comercial**. Fue realizado únicamente con fines educativos y de práctica personal.

---
##  Descripción general
La aplicación permite administrar de forma integral:
- Odontólogos
- Pacientes
- Usuarios del sistema
- Turnos

Se implementa una **arquitectura multicapa**, control de sesiones, validaciones de negocio y seguridad básica, buscando buenas prácticas de diseño y mantenimiento del código.

---
##  Funcionalidades principales

### 🔹 Gestión Integral (CRUD)

- Alta, baja, modificación y listado de odontólogos/pacientes.
- Administración de usuarios del sistemas.


### 🔹 Seguridad y Roles

- Sistema de login con **HttpSession**
- Roles de usuario:
  - Administrador
  - Recepcionista
  - User
- Encriptación de contraseñas con **BCrypt**

### 🔹 Experiencia de Usuario (UX)
- Persistencia de datos en formularios ante errores de validación
- Mensajes claros de error y confirmación
- Interfaz web responsiva

### 🔹 Integridad de Datos
- Control de errores de base de datos
- Prevención de eliminación de registros vinculados
- Manejo de excepciones en la capa de persistencia

---

##  Tecnologías utilizadas

### Backend

- **Java EE**
- **Servlets**
- **JPA (Java Persistence API)**

### Frontend

- **JSP (JavaServer Pages)**
- **Bootstrap 4**
- **JavaScript**

### Base de Datos

- **MySQL / MariaDB**

### Arquitectura

- Patrón **Multicapa**:
  - Capa de Presentación (Servlets / JSP)
  - Capa de Lógica de Negocio
  - Capa de Persistencia (JPA)

### UI

- Template **SB Admin 2**

---

##  Estructura del proyecto

ConsultorioOdontologico
├── src/
│ ├── logica/
│ ├── persistencia/
│ └── servlets/
└── WebContent/
├── components/
└── *.jsp

## ⚙️ Requisitos para ejecutar el proyecto

- Java JDK 8 o superior
- Apache Tomcat 9
- MySQL o MariaDB
- IDE recomendado: Eclipse / IntelliJ IDEA
- Maven

---

##  Primeros Pasos (Acceso)

Para que el sistema sea funcional tras la primera instalación, es necesario:

- Crear un **usuario inicial** directamente en la base de datos
- Asignar el rol **Admin** para tener acceso completo a la gestión

---

##  Ejecución

1. Clonar el repositorio
2. Importar el proyecto como **Maven Project**
3. Configurar la conexión a la base de datos en `persistence.xml`
4. Crear la base de datos
5. Ejecutar el proyecto en Apache Tomcat
6. Acceder desde el navegador

---

##  Objetivos de aprendizaje

- Aplicar arquitectura en capas
- Implementar validaciones de negocio
- Manejar sesiones y roles de usuario
- Utilizar JPA para persistencia de datos
- Mejorar la experiencia de usuario en formularios
- Trabajar con seguridad básica en aplicaciones web

---
