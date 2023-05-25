# PRIMER PARCIAL Base De Datos Avanzadas
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

La gestión de proveedores es esencial para establecer y mantener relaciones comerciales sólidas. La tabla "Proveedor" almacena información clave, como el nombre del proveedor, su dirección y número de teléfono. Esta información facilita la comunicación y la identificación de los proveedores que suministran los productos necesarios para el funcionamiento diario de la Policía Boliviana.

El seguimiento de los pedidos es crucial para garantizar que los suministros se soliciten y entreguen de manera oportuna. La tabla "Pedido" registra la información relevante, como el identificador único del pedido y la fecha en que se realizó. Además, se establece una relación con la tabla "Proveedor" para vincular cada pedido con el proveedor correspondiente. Esta relación permite un seguimiento eficiente de los proveedores asociados a cada pedido y facilita la planificación de las entregas.

La tabla "Producto" almacena detalles esenciales sobre los productos utilizados por la Policía Boliviana. Cada producto tiene un identificador único, nombre, precio y cantidad en stock. Esta información permite llevar un control exhaustivo del inventario, conocer la disponibilidad de cada producto y planificar adecuadamente las compras y reposiciones necesarias.

El registro de los detalles de cada pedido se realiza en la tabla "DetallePedido". Aquí se vinculan los productos solicitados en cada pedido, incluyendo el identificador del pedido, el identificador del producto y la cantidad solicitada. Esta tabla permite un seguimiento preciso de los productos incluidos en cada pedido y facilita la gestión de las entregas y los niveles de stock.

El control del inventario es fundamental para asegurar la disponibilidad de los productos necesarios. La tabla "Stock" registra la cantidad disponible de cada producto, permitiendo una gestión eficiente de las existencias y facilitando la planificación de las compras y distribución interna.

La generación de facturas es esencial para mantener un registro financiero preciso. La tabla "Factura" almacena información relevante sobre las facturas generadas a partir de los pedidos, como el identificador único de la factura, el identificador del pedido asociado, la fecha de emisión y el monto total. Esta información permite llevar un control detallado de las transacciones financieras y facilita la generación de informes contables y de seguimiento.

La gestión del personal es otro aspecto clave en la base de datos propuesta. La tabla "Personal" almacena información sobre el personal de la Policía Boliviana, incluyendo su identificador único, nombre, puesto y número de teléfono. Esto facilita la identificación y contacto del personal involucrado en los procesos de adquisición y consumo de suministros.

El registro de recepción en la tabla "RegistroRecepcion" permite un seguimiento detallado de las entregas realizadas por el personal. Se registra el identificador único de cada registro de recepción, así como el identificador del personal y del producto asociados, la cantidad recibida y la fecha de recepción. Esto brinda un control exhaustivo sobre las entregas y contribuye a la gestión eficiente de los suministros.

Finalmente, la tabla "Consumo" registra el uso de productos por parte del personal. Se almacena el identificador único de cada registro de consumo, junto con el identificador del personal y del producto asociados, la cantidad utilizada y la fecha de consumo. Esta información permite un seguimiento preciso de los productos consumidos y facilita la planificación de las reposiciones necesarias.

En conclusión, la Policía Boliviana necesita esta base de datos para optimizar su gestión de suministros, asegurar la disponibilidad de productos esenciales y garantizar un control detallado de sus operaciones logísticas y financieras. Mediante el uso de esta base de datos, la institución podrá tomar decisiones informadas, mejorar la eficiencia y garantizar un adecuado abastecimiento de recursos, lo que contribuirá a fortalecer su capacidad operativa y cumplir con sus responsabilidades de manera efectiva.
## Diagrama UML
### A continuacion se muestra el diagrama UML propuesto

![diagramaAdquisiones](https://github.com/camgany/PRIMERPARCIALBaseDeDatosAvanzadas/assets/84194948/48805a6f-ec85-4268-9456-0280c5dd1e94)
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
mkdir PRIMERPARCIALBaseDeDatosAvanzadas

PASO 6 Crear el archivo docker-compose.yml que tendra la configuracion de los contenedores de MySQL y MySQL-Replica.
El archivo docker-compose.yml tendra la siguiente configuracion:

    version: "3"
services:
  databasemaster:
    hostname : databasemaster
    image: mysql:debian
    container_name: "databasemaster"
    ports:
      - 3326:3306
    command: bash -c "cp /etc/mysql/master.cnf /etc/mysql/my.cnf && chown root /etc/mysql/my.cnf && chmod 644 /etc/mysql/my.cnf && docker-entrypoint.sh mysqld"
    volumes:
      - ./master.cnf:/etc/mysql/master.cnf
      - ./sql/init.sql:/docker-entrypoint-initdb.d/init.sql
    environment:
      - MYSQL_ROOT_PASSWORD=S3cret  
    networks:
      - mynetwork
  databaseslave:
    hostname : databaseslave
    image: mysql:debian
    container_name: "databaseslave"
    depends_on:
      - databasemaster
    ports:
      - 3327:3306
    command: bash -c "cp /etc/mysql/slave.cnf /etc/mysql/my.cnf && chown root /etc/mysql/my.cnf && chmod 644 /etc/mysql/my.cnf && docker-entrypoint.sh mysqld"
    volumes:
      - ./slave.cnf:/etc/mysql/slave.cnf
      - ./sql/replication.sql:/docker-entrypoint-initdb.d/replication.sql
    environment:
      - MYSQL_ROOT_PASSWORD=S3cret
    networks:
      - mynetwork
  databaseslave2:
    hostname : databaseslave2
    image: mysql:debian
    container_name: "databaseslave2"
    depends_on:
      - databasemaster
    ports:
      - 3328:3306
    command: bash -c "cp /etc/mysql/slave2.cnf /etc/mysql/my.cnf && chown root /etc/mysql/my.cnf && chmod 644 /etc/mysql/my.cnf && docker-entrypoint.sh mysqld"
    volumes:
      - ./slave2.cnf:/etc/mysql/slave2.cnf
      - ./sql/replication.sql:/docker-entrypoint-initdb.d/replication.sql
    environment:
      - MYSQL_ROOT_PASSWORD=S3cret
    networks:
      - mynetwork
networks:
  mynetwork:
    driver: bridge
volumes:
  master:
  slave1:


Paso 7 Crear la carpeta sql y dentro el archivo init.sql que tendra la configuracion de las tablas y el contenido de estas para la base de datos en la base de datos master.

Paso 8 Crear dentro de la carpeta sql el archivo replication.sql que tendra la configuracion de la replicacion de la base de datos master a las bases de datos slaves.

Paso 9 Crear el archivo master.cnf que tendra la configuracion de la base de datos master.

Paso 10 Crear los archivos slave1.cnf y slave2.cnf que tendran la configuracion de las bases de datos slaves.

Paso 11 Levantar los contenedores con el siguiente comando:

docker-compose up -d

Paso 12 Verificar que los contenedores esten levantados con el siguiente comando:

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

Paso 17 ingresar a la base de datos slave con el siguiente comando:

mysql -u root -pS3cret
(donde S3cret es la contraseña de la base de datos)

Paso 18 Verificar que se encuentre la base de datos con el siguiente comando:

show databases;

Paso 19 ingresar al contenedor de la base de datos slave2 con el siguiente comando:

docker exec -it databaseslave2 /bin/bash

Paso 20 ingresar a la base de datos slave2 con el siguiente comando:

mysql -u root -pS3cret

Paso 21 Verificar que se encuentre la base de datos con el siguiente comando:

show databases;


# Como levantar localmente

## Requisitos
- Docker
- Docker Compose
- Git
- Debian
- Docker Desktop

## Pasos
1. Clonar el repositorio del proyecto
- https://github.com/camgany/PRIMERPARCIALBaseDeDatosAvanzadas/tree/master
2. Abrir la terminal de Debian 
- bash 
3. Posicionarse en la carpeta donde se clono el repositorio
4. Posicionarse en la carpeta del repositorio
- cd PRIMERPARCIALBaseDeDatosAvanzadas
5. Ejecutar el comando `docker-compose up -d`
6. Esperar a que se levanten los contenedores
7. Ejecutar el comando `docker ps` para verificar que los contenedores esten levantados
8. Ejecutar el comando `docker exec -it databasemaster bash` para ingresar al contenedor de la base de datos master
9. Ejecutar el comando `mysql -u root -pS3cret` para ingresar a la base de datos siendo S3cret la contraseña de la base de datos
10. Ejecutar el comando `show databases;` para verificar que se encuentre la base de datos
11. Ejecutar el comando `docker exec -it databaseslave bash` para ingresar al contenedor de la base de datos slave
12. Ejecutar el comando `mysql -u root -pS3cret` para ingresar a la base de datos siendo S3cret la contraseña de la base de datos
13. Ejecutar el comando `show databases;` para verificar que se encuentre la base de datos
14. Ejecutar el comando `docker exec -it databaseslave2 bash` para ingresar al contenedor de la base de datos slave2
15. Ejecutar el comando `mysql -u root -pS3cret` para ingresar a la base de datos siendo S3cret la contraseña de la base de datos
16. Ejecutar el comando `show databases;` para verificar que se encuentre la base de datos
17. Ejecutar `docker-compose down` para detener los contenedores

