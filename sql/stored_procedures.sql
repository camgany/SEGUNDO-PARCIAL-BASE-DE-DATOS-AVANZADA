USE ALMACEN;

DELIMITER $$
CREATE PROCEDURE ObtenerProvisionAlimentosFrescos()
BEGIN
  DECLARE estacion_id INT;
  DECLARE periodo_id INT;
  DECLARE provision_id INT;
  
  -- Obtener el ID de la Estación Policial Integral Nº 1
  SELECT id_estacionPolicial INTO estacion_id FROM Estaciones_Policiales WHERE nombre = 'Estacion Policial 1';
  
  -- Obtener el ID del periodo correspondiente al segundo trimestre de la gestión 2023
  SELECT id_periodo INTO periodo_id FROM Periodos WHERE gestion = 2020 AND trimestre = 1;
  
  -- Obtener el ID de la provisión de alimentos frescos para la estación y el periodo específicos
  SELECT id_provision INTO provision_id FROM Provisiones WHERE id_estacionPolicial = estacion_id AND id_periodo = periodo_id;
  
  -- Obtener los detalles de la provisión de alimentos frescos
  SELECT a.nombre AS nombre_alimento, pd.cantidad, a.stock
  FROM Alimentos_Proveedores ap
  JOIN Alimentos a ON ap.id_alimento = a.id_alimento
  JOIN Provisiones_Detalles pd ON pd.id_alimento = a.id_alimento
  WHERE pd.id_provision = provision_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE ObtenerEmpleadosPorRol(IN rol_id INT)
BEGIN
  SELECT p.nombre, p.apellido_paterno, p.apellido_materno
  FROM Empleados e
  JOIN Personas p ON e.id_persona = p.id_persona
  JOIN Empleado_Rol er ON e.id_empleado = er.id_empleado
  WHERE er.id_rol = rol_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE ObtenerProveedorAlimento(IN alimento_id INT, OUT nombre_proveedor VARCHAR(50))
BEGIN
  SELECT p.nombre INTO nombre_proveedor
  FROM Proveedores p
  JOIN Alimentos_Proveedores ap ON ap.id_proveedor = p.id_proveedor
  WHERE ap.id_alimento = alimento_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE ObtenerClientesPorFechaProvision(IN fecha_provision DATE)
BEGIN
  SELECT c.id_cliente, p.nombre, p.apellido_paterno, p.apellido_materno, c.email
  FROM Clientes_Provisiones cp
  INNER JOIN Clientes c ON cp.id_cliente = c.id_cliente
  INNER JOIN Personas p ON c.id_persona = p.id_persona
  INNER JOIN Provisiones pr ON cp.id_provision = pr.id_provision
  WHERE pr.fecha = fecha_provision;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE ObtenerAlimentosAgotados()
BEGIN
  SELECT *
  FROM Alimentos
  WHERE stock = 0;
END $$
DELIMITER ;
