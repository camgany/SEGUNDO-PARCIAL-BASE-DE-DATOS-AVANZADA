USE ALMACEN;
INSERT INTO Personas (id_persona, nombre, apellido_paterno, apellido_materno, id_direccion, telefono)
VALUES (32, 'Camila', 'Doe', 'Smith', 1, 123456786);
DELETE FROM Provisiones WHERE id_provision = 1;



SELECT * FROM ALMACEN.Provisiones_Detalles;
INSERT INTO Provisiones_Detalles (id_detalle, id_provision, id_alimento, cantidad)
VALUES (11, 1, 1, 10);
INSERT INTO Provisiones (id_provision, id_estacionPolicial, id_periodo, fecha, total)
VALUES (11, 1, 2, '2023-06-10', 150.00);
CALL ObtenerProvisionAlimentosFrescos();
CALL ObtenerEmpleadosPorRol(1);
CALL ObtenerProveedorAlimento(1, @nombre_proveedor);
SELECT @nombre_proveedor;
CALL ObtenerClientesPorFechaProvision('2020-01-01');
CALL ObtenerAlimentosAgotados();












