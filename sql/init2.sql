USE ALMACEN;

CREATE TABLE Direccion (
  id_direccion INT PRIMARY KEY,
  numero INT,
  calle VARCHAR(50),
  zona VARCHAR(50),
  ciudad VARCHAR(50)
);
-- Creación de la tabla Personas
CREATE TABLE Personas (
  id_persona INT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido_paterno VARCHAR(50),
  apellido_materno VARCHAR(50),
  id_direccion INT,
  telefono INT,
  FOREIGN KEY (id_direccion) REFERENCES Direccion(id_direccion)
);

-- Creación de la tabla Empleados
CREATE TABLE Empleados (
  id_empleado INT PRIMARY KEY,
  id_persona INT,
  FOREIGN KEY (id_persona) REFERENCES Personas(id_persona)
);

-- Creación de la tabla Roles
CREATE TABLE Roles (
  id_rol INT PRIMARY KEY,
  nombre_rol VARCHAR(50)
);

-- Creación de la tabla Empleado Rol
CREATE TABLE Empleado_Rol (
  id_empleadoRol INT PRIMARY KEY,
  id_empleado INT,
  id_rol INT,
  FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado),
  FOREIGN KEY (id_rol) REFERENCES Roles(id_rol)
);

-- Creación de la tabla Clientes
CREATE TABLE Clientes (
  id_cliente INT PRIMARY KEY,
  id_persona INT,
  email VARCHAR(50),
  FOREIGN KEY (id_persona) REFERENCES Personas(id_persona)
);

-- Creación de la tabla Estaciones Policiales
CREATE TABLE Estaciones_Policiales (
  id_estacionPolicial INT PRIMARY KEY,
  nombre VARCHAR(50),
  id_direccion INT,
  telefono INT,
  FOREIGN KEY (id_direccion) REFERENCES Direccion(id_direccion)
);

-- Creación de la tabla Periodos
CREATE TABLE Periodos (
  id_periodo INT PRIMARY KEY,
  gestion INT,
  trimestre INT
);

-- Creación de la tabla Provisiones
CREATE TABLE Provisiones (
  id_provision INT PRIMARY KEY,
  id_estacionPolicial INT,
  id_periodo INT,
  fecha DATE,
  total DECIMAL(10, 2),
  FOREIGN KEY (id_estacionPolicial) REFERENCES Estaciones_Policiales(id_estacionPolicial),
  FOREIGN KEY (id_periodo) REFERENCES Periodos(id_periodo)
);

-- Creación de la tabla Empleados Provisiones
CREATE TABLE Empleados_Provisiones (
  id_empleadoProvision INT PRIMARY KEY,
  id_empleado INT,
  id_provision INT,
  FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado),
  FOREIGN KEY (id_provision) REFERENCES Provisiones(id_provision)
);

-- Creación de la tabla Clientes Provisiones
CREATE TABLE Clientes_Provisiones (
  id_clienteProvision INT PRIMARY KEY,
  id_cliente INT,
  id_provision INT,
  FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
  FOREIGN KEY (id_provision) REFERENCES Provisiones(id_provision)
);

-- Creación de la tabla Alimentos
CREATE TABLE Alimentos (
  id_alimento INT PRIMARY KEY,
  nombre VARCHAR(50),
  descripcion VARCHAR(100),
  precio DECIMAL(10, 2),
  stock INT
);

-- Creación de la tabla Proveedores
CREATE TABLE Proveedores (
  id_proveedor INT PRIMARY KEY,
  nombre VARCHAR(50),
  id_direccion INT,
  telefono INT,
  FOREIGN KEY (id_direccion) REFERENCES Direccion(id_direccion)
);

-- Creación de la tabla Provisones Detalles
CREATE TABLE Provisiones_Detalles (
  id_detalle INT PRIMARY KEY,
  id_provision INT,
  id_alimento INT,
  cantidad INT,
  FOREIGN KEY (id_provision) REFERENCES Provisiones(id_provision),
  FOREIGN KEY (id_alimento) REFERENCES Alimentos(id_alimento)
);

-- Creación de la tabla Alimentos Proveedores
CREATE TABLE Alimentos_Proveedores (
  id_alimentoProveedor INT PRIMARY KEY,
  id_alimento INT,
  id_proveedor INT,
  FOREIGN KEY (id_alimento) REFERENCES Alimentos(id_alimento),
  FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);



-- Creación de la tabla Auditoria_Personas
CREATE TABLE Auditoria_Personas (
  id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
  fecha_hora DATETIME,
  accion VARCHAR(50)
);

CREATE TABLE Auditoria_Provisiones (
  id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
  fecha_hora DATETIME,
  accion VARCHAR(50)
);

CREATE TABLE Auditoria_Alimentos (
  id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
  fecha_hora DATETIME,
  accion VARCHAR(50)
);

CREATE TABLE Auditoria_Proveedores (
  id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
  fecha_hora DATETIME,
  accion VARCHAR(50)
);

CREATE TABLE Auditoria_Estaciones_Policiales (
  id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
  fecha_hora DATETIME,
  accion VARCHAR(50)
);

CREATE INDEX idx_proveedores_nombre ON Proveedores(nombre);

CREATE INDEX idx_roles_nombre_rol ON Roles (nombre_rol);

CREATE INDEX idx_alimentos_precio ON Alimentos(precio);

CREATE INDEX idx_personas_apellidos ON Personas(apellido_paterno, apellido_materno);

CREATE INDEX idx_provisiones_fecha_total ON Provisiones(fecha, total);

INSERT INTO Direccion (id_direccion, numero, calle, zona, ciudad) 
VALUES 
  (1, 123, 'Calle Murillo', 'Zona Norte', 'La Paz'),
  (2, 456, 'Calle Sucre', 'Zona Central', 'Cochabamba'),
  (3, 789, 'Calle Aniceto Arce', 'Zona Este', 'Tarija'),
  (4, 567, 'Calle Bolívar', 'Zona Sur', 'Santa Cruz'),
  (5, 890, 'Calle Potosí', 'Zona Oeste', 'Oruro'),
  (6, 321, 'Calle Camacho', 'Zona Central', 'La Paz'),
  (7, 654, 'Calle Ballivián', 'Zona Norte', 'Cochabamba'),
  (8, 987, 'Calle Abaroa', 'Zona Sur', 'Tarija'),
  (9, 432, 'Calle Junín', 'Zona Este', 'Santa Cruz'),
  (10, 765, 'Calle Suipacha', 'Zona Oeste', 'Oruro'),
  (11, 234, 'Calle Murillo', 'Zona Central', 'La Paz'),
  (12, 567, 'Calle Jordán', 'Zona Norte', 'Cochabamba'),
  (13, 890, 'Calle Avaroa', 'Zona Sur', 'Tarija'),
  (14, 876, 'Calle Méndez Arcos', 'Zona Este', 'Santa Cruz'),
  (15, 109, 'Calle Velasco', 'Zona Oeste', 'Oruro'),
  (16, 543, 'Calle Sagárnaga', 'Zona Central', 'La Paz'),
  (17, 876, 'Calle San Martín', 'Zona Norte', 'Cochabamba'),
  (18, 209, 'Calle Ballivián', 'Zona Sur', 'Tarija'),
  (19, 543, 'Calle Piraí', 'Zona Este', 'Santa Cruz'),
  (20, 876, 'Calle 6 de Octubre', 'Zona Oeste', 'Oruro'),
  (21, 109, 'Calle Illampu', 'Zona Central', 'La Paz'),
  (22, 432, 'Calle Hamiraya', 'Zona Norte', 'Cochabamba'),
  (23, 765, 'Calle Colón', 'Zona Sur', 'Tarija'),
  (24, 109, 'Calle Ayacucho', 'Zona Este', 'Santa Cruz'),
  (25, 432, 'Calle Campero', 'Zona Oeste', 'Oruro'),
  (26, 765, 'Calle Murillo', 'Zona Central', 'La Paz'),
  (27, 109, 'Calle Baptista', 'Zona Norte', 'Cochabamba'),
  (28, 432, 'Calle Méndez Arcos', 'Zona Sur', 'Tarija'),
  (29, 765, 'Calle Bolívar', 'Zona Este', 'Santa Cruz'),
  (30, 109, 'Calle Potosí', 'Zona Oeste', 'Oruro');

INSERT INTO Personas (id_persona, nombre, apellido_paterno, apellido_materno, id_direccion, telefono)
VALUES
  (1, 'Juan', 'Perez', 'Garcia', 1, 7654321),
  (2, 'Maria', 'Lopez', 'Gonzalez', 2, 9876543),
  (3, 'Carlos', 'Gomez', 'Rodriguez', 3, 3216547),
  (4, 'Ana', 'Martinez', 'Hernandez', 4, 7891234),
  (5, 'Pedro', 'Sanchez', 'Lopez', 5, 4567891),
  (6, 'Laura', 'Garcia', 'Torres', 6, 98765432),
  (7, 'Luis', 'Rodriguez', 'Flores', 7, 1478523),
  (8, 'Monica', 'Hernandez', 'Vargas', 8, 65478912),
  (9, 'Sergio', 'Lopez', 'Gomez', 9, 3216547),
  (10, 'Julia', 'Gonzalez', 'Martinez', 10, 7894561),
  (11, 'Diego', 'Ramirez', 'Silva', 11, 1234567),
  (12, 'Valentina', 'Fernandez', 'Lopez', 12, 7654321),
  (13, 'Roberto', 'Guzman', 'Soto', 13, 9876543),
  (14, 'Carolina', 'Mendoza', 'Vargas', 14, 3216547),
  (15, 'Andres', 'Morales', 'Garcia', 15, 7891234),
  (16, 'Isabel', 'Vargas', 'Navarro', 16, 4567891),
  (17, 'Ricardo', 'Paredes', 'Flores', 17, 98765432),
  (18, 'Fernanda', 'Cortez', 'Castro', 18, 1478523),
  (19, 'Gustavo', 'Velasco', 'Rojas', 19, 65478912),
  (20, 'Paola', 'Herrera', 'Gomez', 20, 3216547);

INSERT INTO Empleados (id_empleado, id_persona)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);

INSERT INTO Roles (id_rol, nombre_rol)
VALUES
  (1, 'Administrador'),
  (2, 'Jefe de Estacion'),
  (3, 'Oficial de Policia'),
  (4, 'Sargento');

INSERT INTO Empleado_Rol (id_empleadoRol, id_empleado, id_rol)
VALUES
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 3),
  (4, 4, 4),
  (5, 5, 1),
  (6, 6, 4),
  (7, 7, 3),
  (8, 8, 4),
  (9, 9, 1),
  (10, 10, 3);

INSERT INTO Clientes (id_cliente, id_persona, email)
VALUES
  (1, 11, 'diego_ramirez@gmail.com'),
  (2, 12, 'valentina_fernandez@gmail.com'),
  (3, 13, 'roberto_guzman@gmail.com'),
  (4, 14, 'carolina_mendoza@gmail.com'),
  (5, 15, 'andres_morales@gmail.com'),
  (6, 16, 'isabel_vargas@gmail.com'),
  (7, 17, 'ricardo_paredes@gmail.com'),
  (8, 18, 'fernanda_cortez@gmail.com'),
  (9, 19, 'gustavo_velasco@gmail.com'),
  (10, 20, 'paola_herrera@gmail.com');

INSERT INTO Estaciones_Policiales (id_estacionPolicial, nombre, id_direccion, telefono)
VALUES
  (1, 'Estacion Policial 1', 21, 2788788),
  (2, 'Estacion Policial 2', 22, 2788789),
  (3, 'Estacion Policial 3', 23, 2788790),
  (4, 'Estacion Policial 4', 24, 2788791),
  (5, 'Estacion Policial 5', 25, 2788792);

INSERT INTO Periodos (id_periodo, gestion, trimestre)
VALUES
  (1, 2020, 1),
  (2, 2020, 2),
  (3, 2020, 3),
  (4, 2020, 4),
  (5, 2021, 1),
  (6, 2021, 2),
  (7, 2021, 3),
  (8, 2021, 4),
  (9, 2022, 1),
  (10, 2022, 2);

INSERT INTO Provisiones (id_provision, id_estacionPolicial, id_periodo, fecha, total)
VALUES
  (1, 1, 1, '2020-01-01', 1000),
  (2, 2, 2, '2020-04-01', 2000),
  (3, 3, 3, '2020-07-01', 3000),
  (4, 4, 4, '2020-10-01', 4000),
  (5, 5, 5, '2021-01-01', 5000),
  (6, 1, 6, '2021-04-01', 1000),
  (7, 2, 7, '2021-07-01', 2000),
  (8, 3, 8, '2021-10-01', 3000),
  (9, 4, 9, '2022-01-01', 4000),
  (10, 5, 10, '2022-04-01', 5000);

  INSERT INTO Empleados_Provisiones (id_empleadoProvision, id_empleado, id_provision)
  VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5),
    (6, 6, 6),
    (7, 7, 7),
    (8, 8, 8),
    (9, 9, 9),
    (10, 10, 10);

  INSERT INTO Clientes_Provisiones (id_clienteProvision, id_cliente, id_provision)
  VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5),
    (6, 6, 6),
    (7, 7, 7),
    (8, 8, 8),
    (9, 9, 9),
    (10, 10, 10);

INSERT INTO Alimentos (id_alimento, nombre, descripcion, precio, stock)
VALUES
    (1, 'Arroz', 'Arroz blanco de alta calidad', 80.00, 50),
    (2, 'Fideo', 'Fideo de pasta larga para sopas y guisos', 40.00, 75),
    (3, 'Sal', 'Sal refinada para condimentar alimentos', 10.00, 200),
    (4, 'Azucar', 'Azucar blanca granulada para endulzar alimentos y bebidas', 30.00, 30),
    (5, 'Aceite vegetal', 'Aceite vegetal comestible para cocinar y freir', 90.00, 100),
    (6, 'Vinagre', 'Vinagre de vino para aderezar ensaladas y marinar alimentos', 20.00, 150),
    (7, 'Pimienta', 'Pimienta molida para condimentar alimentos', 15.00, 40),
    (8, 'Comino', 'Comino en polvo para realzar el sabor de las preparaciones', 25.00, 60),
    (9, 'Oregano', 'Oregano seco para sazonar platos y pizzas', 12.00, 80),
    (10, 'Aji molido', 'Aji molido picante para añadir sabor y picor a las comidas', 18.00, 120);

INSERT INTO Proveedores (id_proveedor, nombre, id_direccion, telefono)
VALUES
    (1, 'Distribuidora El Sol', 1, 71234567),
    (2, 'Importadora Andina', 2, 71234568),
    (3, 'Mayorista La Paz', 3, 71234569),
    (4, 'Comercial Bolivia', 4, 71234570),
    (5, 'Proveedor Santa Cruz', 5, 71234571),
    (6, 'Distribuidora Cochabamba', 6, 71234572),
    (7, 'Importadora Oruro', 7, 71234573),
    (8, 'Mayorista Potosi', 8, 71234574),
    (9, 'Proveedor Tarija', 9, 71234575),
    (10, 'Distribuidora Chuquisaca', 10, 71234576);

INSERT INTO Provisiones_Detalles (id_detalle, id_provision, id_alimento, cantidad)
VALUES 
    (1,1,1,1),
    (2,2,2,2),
    (3,3,3,3),
    (4,4,4,4),
    (5,5,5,5),
    (6,6,6,6),
    (7,7,7,7),
    (8,8,8,8),
    (9,9,9,9),
    (10,10,10,10);

INSERT INTO Alimentos_Proveedores (id_alimentoProveedor, id_alimento, id_proveedor)
VALUES
    (1,1,1),
    (2,2,2),
    (3,3,3),
    (4,4,4),
    (5,5,5),
    (6,6,6),
    (7,7,7),
    (8,8,8),
    (9,9,9),
    (10,10,10),
    (11,1,2),
    (12,2,3),
    (13,3,4),
    (14,4,5),
    (15,5,6),
    (16,6,7),
    (17,7,8),
    (18,8,9),
    (19,9,10),
    (20,10,1);
