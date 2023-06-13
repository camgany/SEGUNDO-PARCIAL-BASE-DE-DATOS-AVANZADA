# SEGUNDO PARCIAL Base De Datos Avanzadas
## Alumno: Camila Alejandra Grandy Camacho
## Codigo: 56784
## Carrera: Ingenieria de Sistemas
## Materia: Base de Datos Avanzadas

## Descripcion
El presente repositorio contiene los archivos necesarios para la creacion de una base de datos en MySQL sobre PROVISIÓN DE ALIMENTOS FRESCOS (ABARROTES Y CONDIMENTOS EN GENERAL) CORRESPONDIENTE AL SEGUNDO TRIMESTRE DE LA GESTIÓN 2023 PARA LA ESTACIÓN POLICIAL INTEGRAL Nª 1 DEPENDIENTE DEL COMANDO DEPARTAMENTAL DE POLICÍA DE ORURO (CODPO) DE LA POLICÍA BOLIVIANA. Adjuntando su diagrama UML y el archivo 
que describe su forma de instalacion.
## Descripción de la entidad y los requisitos
# PROVISIÓN DE ALIMENTOS FRESCOS (ABARROTES Y CONDIMENTOS EN GENERAL) 
La Policía Boliviana requiere una sólida base de datos para gestionar eficientemente su sistema de suministros y recursos, con el objetivo de optimizar sus operaciones y garantizar la disponibilidad de los productos necesarios para cumplir con sus responsabilidades y funciones. Esta base de datos es fundamental para llevar un control detallado de proveedores, pedidos, productos, inventario, facturación, personal y consumo, permitiendo a la institución mantener un registro completo y actualizado de todos los aspectos relacionados con sus suministros.

La base de datos proporcionada presenta una estructura de tablas que permite almacenar información relacionada con una organización policial en Bolivia. A continuación, se proporciona una descripción de las tablas y su importancia para la Policía Boliviana:

- Tabla "Direccion":

Descripción: Almacena información sobre las direcciones, como el número de la dirección, la calle, la zona y la ciudad.
Importancia: Permite registrar y recuperar direcciones asociadas a personas, estaciones policiales, proveedores, entre otros. Es fundamental para establecer la ubicación física de los distintos elementos de la base de datos.

- Tabla "Personas":

Descripción: Contiene información personal de las personas, como su nombre, apellidos, identificación de dirección y número de teléfono.
Importancia: Permite almacenar y administrar los datos básicos de las personas relacionadas con la Policía Boliviana, como empleados, clientes, etc.

- Tabla "Empleados":

Descripción: Registra información sobre los empleados, incluyendo su identificación y el vínculo con la tabla "Personas".
Importancia: Permite gestionar y rastrear los datos de los empleados de la Policía Boliviana, asociando cada empleado con su correspondiente entrada en la tabla "Personas".

- Tabla "Roles":

Descripción: Almacena los roles o cargos que pueden desempeñar los empleados.
Importancia: Facilita la asignación y administración de roles o cargos específicos a los empleados de la Policía Boliviana, lo cual es útil para la gestión de autoridades y responsabilidades dentro de la organización.
Tabla "Empleado_Rol":

Descripción: Establece la relación entre los empleados y los roles que desempeñan, mediante la asignación de identificadores de empleado y rol.
Importancia: Permite asociar los empleados con sus respectivos roles o cargos en la organización policial.

- Tabla "Clientes":

Descripción: Almacena información de los clientes, incluyendo su identificación y su relación con la tabla "Personas", además del correo electrónico.
Importancia: Es útil para registrar y administrar los datos de los clientes o personas externas a la Policía Boliviana que interactúan con la organización en algún contexto específico.

- Tabla "Estaciones_Policiales":

Descripción: Registra información sobre las estaciones policiales, como su nombre, identificación de dirección y número de teléfono.
Importancia: Permite mantener un registro de las estaciones policiales en Bolivia, incluyendo sus ubicaciones y datos de contacto, lo cual es esencial para la gestión y coordinación de operaciones policiales en diferentes áreas geográficas.

- Tabla "Periodos":

Descripción: Almacena información sobre los periodos de tiempo, incluyendo la gestión y el trimestre.
Importancia: Es útil para organizar y clasificar las provisiones o suministros realizados en períodos específicos, lo que facilita la gestión de inventarios y la generación de informes.

- Tabla "Provisiones":

Descripción: Registra información detallada sobre las provisiones realizadas en las estaciones policiales en un periodo determinado.
Importancia: Permite gestionar y rastrear las provisiones realizadas a las estaciones policiales en términos de fecha, total y otras características, lo que es crucial para la administración de recursos y suministros.

En conclusión, la Policía Boliviana necesita esta base de datos para optimizar su gestión de suministros, asegurar la disponibilidad de productos esenciales y garantizar un control detallado de sus operaciones logísticas y financieras. Mediante el uso de esta base de datos, la institución podrá tomar decisiones informadas, mejorar la eficiencia y garantizar un adecuado abastecimiento de recursos, lo que contribuirá a fortalecer su capacidad operativa y cumplir con sus responsabilidades de manera efectiva.

### El archivo "stored_procedures.sql" contiene una serie de procedimientos almacenados en lenguaje SQL. Los procedimientos almacenados son fragmentos de código que se guardan en la base de datos y se pueden ejecutar posteriormente. Aquí hay un resumen de cada procedimiento almacenado definido en el archivo:

- Procedimiento "ObtenerProvisionAlimentosFrescos":

Objetivo: Obtener los detalles de la provisión de alimentos frescos para una estación policial y periodo específicos.
Parámetros: No recibe parámetros de entrada.
Salida: Muestra el nombre del alimento, la cantidad y el stock disponible para cada alimento en la provisión.

- Procedimiento "ObtenerEmpleadosPorRol":

Objetivo: Obtener una lista de empleados que desempeñan un rol específico.
Parámetros: Recibe el ID de un rol como entrada.
Salida: Muestra el nombre, apellido paterno y apellido materno de los empleados que tienen el rol especificado.

- Procedimiento "ObtenerProveedorAlimento":

Objetivo: Obtener el nombre del proveedor de un alimento específico.
Parámetros: Recibe el ID de un alimento como entrada.
Salida: Devuelve el nombre del proveedor correspondiente al alimento especificado.

- Procedimiento "ObtenerClientesPorFechaProvision":

Objetivo: Obtener una lista de clientes que están asociados a una provisión realizada en una fecha específica.
Parámetros: Recibe una fecha de provisión como entrada.
Salida: Muestra el ID del cliente, nombre, apellido paterno, apellido materno y correo electrónico de los clientes asociados a la provisión realizada en la fecha especificada.

- Procedimiento "ObtenerAlimentosAgotados":

Objetivo: Obtener una lista de alimentos que tienen un stock igual a cero.
Parámetros: No recibe parámetros de entrada.
Salida: Muestra todos los datos de los alimentos que tienen un stock de cero.
Estos procedimientos almacenados proporcionan funcionalidades específicas para obtener información de la base de datos de acuerdo con los criterios y filtros especificados en cada procedimiento.

### El archivo "stored_triggers.sql" contiene una serie de disparadores (triggers) definidos en lenguaje SQL. Los triggers son objetos de la base de datos que se activan automáticamente cuando ocurren ciertos eventos en la base de datos, como la inserción, eliminación o actualización de registros. Aquí hay un resumen de cada trigger definido en el archivo:

- Trigger "trigger_persona_creada":

Objetivo: Auditar la creación de personas registrando la fecha y hora de la acción en la tabla "Auditoria_Personas" cada vez que se inserta un nuevo registro en la tabla "Personas".

- Trigger "trigger_provision_creada":

Objetivo: Auditar la creación de provisiones registrando la fecha y hora de la acción en la tabla "Auditoria_Provisiones" cada vez que se inserta un nuevo registro en la tabla "Provisiones".

- Trigger "trigger_provision_eliminada":

Objetivo: Auditar la eliminación de provisiones registrando la fecha y hora de la acción en la tabla "Auditoria_Provisiones" cada vez que se elimina un registro de la tabla "Provisiones".

- Trigger "trigger_estacion_policial_creada":

Objetivo: Auditar la creación de estaciones policiales registrando la fecha y hora de la acción en la tabla "Auditoria_Estaciones_Policiales" cada vez que se inserta un nuevo registro en la tabla "Estaciones_Policiales".

- Trigger "trigger_estacion_policial_eliminada":

Objetivo: Auditar la eliminación de estaciones policiales registrando la fecha y hora de la acción en la tabla "Auditoria_Estaciones_Policiales" cada vez que se elimina un registro de la tabla "Estaciones_Policiales".

- Trigger "trigger_alimento_creado":

Objetivo: Auditar la creación de alimentos registrando la fecha y hora de la acción en la tabla "Auditoria_Alimentos" cada vez que se inserta un nuevo registro en la tabla "Alimentos".

- Trigger "trigger_alimento_eliminado":

Objetivo: Auditar la eliminación de alimentos registrando la fecha y hora de la acción en la tabla "Auditoria_Alimentos" cada vez que se elimina un registro de la tabla "Alimentos".

- Trigger "trigger_proveedor_creado":

Objetivo: Auditar la creación de proveedores registrando la fecha y hora de la acción en la tabla "Auditoria_Proveedores" cada vez que se inserta un nuevo registro en la tabla "Proveedores".

- Trigger "trigger_proveedor_eliminado":

Objetivo: Auditar la eliminación de proveedores registrando la fecha y hora de la acción en la tabla "Auditoria_Proveedores" cada vez que se elimina un registro de la tabla "Proveedores".

- Trigger "verificar_fecha_provision":

Objetivo: Verificar que no se pueda eliminar una provisión cuya fecha sea anterior a la fecha actual. Si se intenta eliminar una provisión pasada, se genera un error.

- Trigger "calcular_total_provision":

Objetivo: Calcular el total de una provisión automáticamente cada vez que se inserta un nuevo detalle de provisión en la tabla "Provisiones_Detalles". El trigger suma el precio por la cantidad de cada alimento en el detalle y actualiza el campo "total" en la tabla "Provisiones".

- Trigger "verificar_disponibilidad_alimentos":

Objetivo: Verificar que haya suficiente stock disponible para el alimento solicitado en un nuevo detalle de provisión antes de insertarlo en la tabla "Provisiones_Detalles". Si no hay suficiente stock, se genera un error.

- Trigger "restar_stock_insert":

Objetivo: Restar la cantidad del alimento solicitado del stock disponible en la tabla "Alimentos" cada vez que se inserta un nuevo detalle de provisión en la tabla "Provisiones_Detalles".

- Trigger "verificar_telefono":

Objetivo: Verificar que el número de teléfono de una persona tenga entre 7 y 8 dígitos antes de insertar un nuevo registro en la tabla "Personas". Si el número de teléfono no cumple con el rango, se genera un error.

- Trigger "verificar_telefono_estacion_policial":

Objetivo: Verificar que el número de teléfono de una estación policial tenga entre 7 y 8 dígitos antes de insertar un nuevo registro en la tabla "Estaciones_Policiales". Si el número de teléfono no cumple con el rango, se genera un error.

- Trigger "restriccion_eliminacion_empleados_provisiones":

Objetivo: Restringir la eliminación de registros en la tabla "Empleados_Provisiones" si la provisión asociada tiene una fecha anterior a la fecha actual. Se genera un error si se intenta eliminar un registro en esta situación.
Estos triggers se utilizan para realizar acciones automáticas y asegurar la integridad y la consistencia de los datos en la base de datos.

## Diagrama UML
### A continuacion se muestra el diagrama UML propuesto

![diagramaBDDA](https://github.com/camgany/SEGUNDO-PARCIAL-BASE-DE-DATOS-AVANZADA/assets/84194948/a3f812ba-6993-4b6d-ab8e-542562ff75e2)
## Requisitos Tecnicos
### A continuacion se muestra los requisitos tecnicos para la instalacion de la base de datos
PASO 1 Instalar WSL2 en Windows 10 con el siguiente comando:

wsl --install
(esto para poder tener acceso a la terminal de linux en windows)

PASO 2 Instalar Debian:

wsl --install -d Debian
(esto para poder tener Debian en la terminal de windows)

PASO 3 Instalar Docker Desktop en Windows 10 con el siguiente link:

https://docs.docker.com/docker-for-windows/install/

PASO 4 Se verifica la instalacion de Docker compose con el siguiente comando:

docker-compose -v

PASO 5 carpeta que contendra los archivos de configuracion de docker compose, en mi caso seria:
mkdir SEGUNDOPARCIALBaseDeDatosAvanzadas

PASO 6 Crear el archivo docker-compose.yml que tendra la configuracion de los contenedores de MySQL y MySQL-Replica.
El archivo docker-compose.yml tendra la siguiente configuracion:

    version: "3"
services:
  databasemaster:
    image: mysql:debian
    container_name: "databasemaster"
    ports:
      - 3326:3306
    volumes:
      - ./sql/init2.sql:/docker-entrypoint-initdb.d/init2.sql
      - ./sql/triggers.sql:/docker-entrypoint-initdb.d/triggers.sql
      - ./sql/stored_procedures.sql:/docker-entrypoint-initdb.d/stored_procedures.sql
    environment:
      - MYSQL_ROOT_PASSWORD=S3cret
      - MYSQL_DATABASE=ALMACEN
      


Paso 7 Crear la carpeta sql y dentro el archivo init2.sql que tendra la configuracion de las tablas y el contenido de estas para la base de datos en la base de datos master.

Paso 8 Levantar los contenedores con el siguiente comando:

docker-compose up -d

Paso 9 Verificar que el contenedor esten levantados con el siguiente comando:

docker ps

Paso 13 ingresar al contenedor de la base de datos master con el siguiente comando:

docker exec -it databasemaster /bin/bash

Paso 14 ingresar a la base de datos master con el siguiente comando:

mysql -u root -pS3cret
(donde S3cret es la contraseña de la base de datos)

Paso 15 Verificar que se encuentre la base de datos con el siguiente comando:

show databases;

Paso 16 ingresar al contenedor de la base de datos slave con el siguiente comando:

docker exec -it databaseslave /bin/bash




# Como levantar localmente

## Requisitos
- Docker
- Docker Compose
- Git
- Debian
- Docker Desktop

## Pasos
1. Clonar el repositorio del proyecto
- [https://github.com/camgany/SEGUNDOPARCIALBaseDeDatosAvanzadas/](https://github.com/camgany/SEGUNDO-PARCIAL-BASE-DE-DATOS-AVANZADA.git)
2. Abrir la terminal de Debian 
- bash 
3. Posicionarse en la carpeta donde se clono el repositorio
4. Posicionarse en la carpeta del repositorio
- cd SEGUNDOPARCIALBaseDeDatosAvanzadas
5. Ejecutar el comando `docker-compose up -d`
6. Esperar a que se levanten los contenedores
7. Ejecutar el comando `docker ps` para verificar que los contenedores esten levantados
8. Ejecutar el comando `docker exec -it databasemaster bash` para ingresar al contenedor de la base de datos master
9. Ejecutar el comando `mysql -u root -pS3cret` para ingresar a la base de datos siendo S3cret la contraseña de la base de datos
10. Ejecutar el comando `show databases;` para verificar que se encuentre la base de datos


