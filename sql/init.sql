CREATE USER 'replicacion'@'%' IDENTIFIED BY 'admin123';
GRANT REPLICATION SLAVE ON *.* TO 'replicacion'@'%';
FLUSH PRIVILEGES;
CREATE DATABASE ADQUISICIONES;
USE ADQUISICIONES;

CREATE TABLE Proveedor (
  idProveedor INT PRIMARY KEY,
  nombreProveedor VARCHAR(255),
  direccionProveedor VARCHAR(255),
  telefonoProveedor INT
);

CREATE TABLE Pedido (
  idPedido INT PRIMARY KEY,
  fechaPedido DATE,
  idProveedor INT,
  FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor)
);

CREATE TABLE Producto (
  idProducto INT PRIMARY KEY,
  nombreProducto VARCHAR(255),
  precioProducto INT,
  stockProducto INT
);

CREATE TABLE DetallePedido (
  idDetallePedido INT PRIMARY KEY,
  idPedido INT,
  idProducto INT,
  cantidadProducto INT,
  FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido),
  FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

CREATE TABLE Stock (
  idStock INT PRIMARY KEY,
  idProducto INT,
  cantidadDisponible INT,
  FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

CREATE TABLE Factura (
  idFactura INT PRIMARY KEY,
  idPedido INT,
  fechaFactura DATE,
  montoTotal DECIMAL(10, 2),
  FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);

CREATE TABLE Personal (
  idPersonal INT PRIMARY KEY,
  nombrePersonal VARCHAR(255),
  puesto VARCHAR(255),
  telefonoPersonal INT
);

CREATE TABLE RegistroRecepcion (
  idRegistro INT PRIMARY KEY,
  idPersonal INT,
  idProducto INT,
  cantidadRecibida INT,
  fechaRecepcion DATE,
  FOREIGN KEY (idPersonal) REFERENCES Personal(idPersonal),
  FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

CREATE TABLE Consumo (
  idConsumo INT PRIMARY KEY,
  idPersonal INT,
  idProducto INT,
  cantidadUtilizada INT,
  fechaConsumo DATE,
  FOREIGN KEY (idPersonal) REFERENCES Personal(idPersonal),
  FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

INSERT INTO Proveedor VALUES (1, 'EMAPA', 'Oficina Central Avenida Mariscal Santa Cruz; Edificio Centro de Comunicaciones La Paz', 2115500), (2, 'FINO', 'Av. Cristo Redentor Km. 6, Santa Cruz, Bolivia', 3443000), (3, 'PRINCESA', 'Av. Chacaltaya, La Paz, Bolivia', 2281343);
INSERT INTO Pedido VALUES (1, '2023-04-01', 1), (2, '2003-05-02', 2), (3, '2023-04-11', 3);
INSERT INTO Producto VALUES (1, 'Azucar', 100, 100), (2, 'Aceite', 200, 200), (3, 'Cereales', 300, 300);
INSERT INTO DetallePedido VALUES (1, 1, 1, 10), (2, 2, 2, 20), (3, 3, 3, 30);
INSERT INTO Stock VALUES (1, 1, 100), (2, 2, 200), (3, 3, 300);
INSERT INTO Factura VALUES (1, 1, '2023-04-15', 1000.00), (2, 2, '2023-05-15', 2000.00), (3, 3, '2023-06-15', 3000.00);
INSERT INTO Personal VALUES (1, 'Juan Lopez', 'Oficial de Policia', 71234567), (2, 'Maria Garcia', 'Sargento', 76543210), (3, 'Carlos Rodriguez', 'Suboficial', 78787878);
INSERT INTO RegistroRecepcion VALUES (1, 1, 1, 10, '2023-04-21'), (2, 2, 2, 20, '2023-04-01'), (3, 3, 3, 30, '2023-06-03');
INSERT INTO Consumo VALUES (1, 1, 1, 10, '2023-04-11'), (2, 2, 2, 20, '2023-04-22'), (3, 3, 3, 30, '2023-05-12');
