USE ALMACEN;

-- Creación del trigger para auditar la creación de personas
DELIMITER $$
CREATE TRIGGER trigger_persona_creada
AFTER INSERT ON Personas
FOR EACH ROW
BEGIN
  INSERT INTO Auditoria_Personas (fecha_hora, accion)
  VALUES (NOW(), 'INSERT');
END $$
DELIMITER ;

-- Creación del trigger para auditar la creación de provisiones
DELIMITER $$
CREATE TRIGGER trigger_provision_creada
AFTER INSERT ON Provisiones
FOR EACH ROW
BEGIN
  INSERT INTO Auditoria_Provisiones (fecha_hora, accion)
  VALUES (NOW(), 'INSERT');
END $$
DELIMITER ;

-- Creación del trigger para auditar la eliminación de provisiones
DELIMITER $$
CREATE TRIGGER trigger_provision_eliminada
AFTER DELETE ON Provisiones
FOR EACH ROW
BEGIN
  INSERT INTO Auditoria_Provisiones (fecha_hora, accion)
  VALUES (NOW(), 'DELETE');
END $$
DELIMITER ;

-- Creación del trigger para insertar en la tabla de auditoría al insertar una estación policial
DELIMITER $$
CREATE TRIGGER trigger_estacion_policial_creada
AFTER INSERT ON Estaciones_Policiales
FOR EACH ROW
BEGIN
  INSERT INTO Auditoria_Estaciones_Policiales (fecha_hora, accion)
  VALUES (NOW(), 'INSERT');
END $$
DELIMITER ;

-- Creación del trigger para insertar en la tabla de auditoría al eliminar una estación policial
DELIMITER $$
CREATE TRIGGER trigger_estacion_policial_eliminada
AFTER DELETE ON Estaciones_Policiales
FOR EACH ROW
BEGIN
  INSERT INTO Auditoria_Estaciones_Policiales (fecha_hora, accion)
  VALUES (NOW(), 'DELETE');
END $$
DELIMITER ;

-- Creación del trigger para insertar en la tabla de auditoría al insertar un alimento
DELIMITER $$
CREATE TRIGGER trigger_alimento_creado
AFTER INSERT ON Alimentos
FOR EACH ROW
BEGIN
  INSERT INTO Auditoria_Alimentos (fecha_hora, accion)
  VALUES (NOW(), 'INSERT');
END $$
DELIMITER ;

-- Creación del trigger para insertar en la tabla de auditoría al eliminar un alimento
DELIMITER $$
CREATE TRIGGER trigger_alimento_eliminado
AFTER DELETE ON Alimentos
FOR EACH ROW
BEGIN
  INSERT INTO Auditoria_Alimentos (fecha_hora, accion)
  VALUES (NOW(), 'DELETE');
END $$
DELIMITER ;

-- Creación del trigger para insertar en la tabla de auditoría al insertar un proveedor
DELIMITER $$
CREATE TRIGGER trigger_proveedor_creado
AFTER INSERT ON Proveedores
FOR EACH ROW
BEGIN
  INSERT INTO Auditoria_Proveedores (fecha_hora, accion)
  VALUES (NOW(), 'INSERT');
END $$
DELIMITER ;

-- Creación del trigger para insertar en la tabla de auditoría al eliminar un proveedor
DELIMITER $$
CREATE TRIGGER trigger_proveedor_eliminado
AFTER DELETE ON Proveedores
FOR EACH ROW
BEGIN
  INSERT INTO Auditoria_Proveedores (fecha_hora, accion)
  VALUES (NOW(), 'DELETE');
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER verificar_fecha_provision
BEFORE DELETE ON Provisiones
FOR EACH ROW
BEGIN
    -- Verificar si la fecha de la provisión es anterior a la fecha actual
    IF OLD.fecha < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar una provisión pasada.';
    END IF;
END;
$$
DELIMITER ;

DELIMITER $$
-- Creación del trigger
CREATE TRIGGER calcular_total_provision
AFTER INSERT ON Provisiones_Detalles
FOR EACH ROW
BEGIN
  DECLARE total DECIMAL(10, 2);
  
  -- Obtener el total de la provisión
  SELECT SUM(precio * cantidad) INTO total
  FROM Alimentos
  INNER JOIN Provisiones_Detalles ON Alimentos.id_alimento = Provisiones_Detalles.id_alimento
  WHERE Provisiones_Detalles.id_provision = NEW.id_provision;
  
  -- Actualizar el total de la provisión en la tabla Provisiones
  UPDATE Provisiones
  SET total = total + total
  WHERE id_provision = NEW.id_provision;
END;
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER verificar_disponibilidad_alimentos
BEFORE INSERT ON Provisiones_Detalles
FOR EACH ROW
BEGIN
  DECLARE stock_disponible INT;
  
  SELECT stock INTO stock_disponible
  FROM Alimentos
  WHERE id_alimento = NEW.id_alimento;
  
  IF stock_disponible < NEW.cantidad THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'No hay suficiente stock disponible para el alimento solicitado';
  END IF;
END;
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER restar_stock_insert
AFTER INSERT ON Provisiones_Detalles
FOR EACH ROW
BEGIN
  UPDATE Alimentos
  SET stock = stock - NEW.cantidad
  WHERE id_alimento = NEW.id_alimento;
END;
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER verificar_telefono
BEFORE INSERT ON Personas
FOR EACH ROW
BEGIN
  DECLARE telefono_length INT;
  
  SET telefono_length = LENGTH(NEW.telefono);
  
  IF telefono_length < 7 OR telefono_length > 8 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El teléfono debe tener entre 7 y 8 dígitos';
  END IF;
END;
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER verificar_telefono_estacion_policial
BEFORE INSERT ON Estaciones_Policiales
FOR EACH ROW
BEGIN
  DECLARE telefono_length INT;
  
  SET telefono_length = LENGTH(NEW.telefono);
  
  IF telefono_length < 7 OR telefono_length > 8 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El teléfono de la estación policial debe tener entre 7 y 8 dígitos';
  END IF;
END;
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER restriccion_eliminacion_empleados_provisiones
BEFORE DELETE ON Empleados_Provisiones
FOR EACH ROW
BEGIN
  IF OLD.id_provision IN (SELECT id_provision FROM Provisiones WHERE fecha < CURDATE()) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede eliminar el registro debido a que la provisión asociada tiene una fecha anterior a la fecha actual.';
  END IF;
  -- Otras condiciones y acciones necesarias
END;
$$
DELIMITER ;
