USE ALMACEN;
-- tenemos los alimentos que suministra un proveedor especifico
SELECT p.nombre AS proveedor_nombre, a.nombre AS alimento_nombre
FROM Proveedores p
JOIN Alimentos_Proveedores ap ON ap.id_proveedor = p.id_proveedor
JOIN Alimentos a ON a.id_alimento = ap.id_alimento
WHERE p.nombre = 'Importadora Andina';

-- todos los empleados que tienen un rol
SELECT p.nombre, r.nombre_rol
FROM Personas p
JOIN Clientes c ON p.id_persona = c.id_persona
JOIN Clientes_Provisiones cp ON c.id_cliente = cp.id_cliente
JOIN Provisiones p2 ON cp.id_provision = p2.id_provision
JOIN Empleados_Provisiones ep ON p2.id_provision = ep.id_provision
JOIN Empleados e ON ep.id_empleado = e.id_empleado
JOIN Empleado_Rol er ON e.id_empleado = er.id_empleado
JOIN Roles r ON er.id_rol = r.id_rol
WHERE r.nombre_rol = 'Administrador';

-- todos los empleados con las provisiones a las que fueron vinculados
SELECT p.id_provision, e.id_empleado, pe.nombre, pe.apellido_paterno, pe.apellido_materno
FROM Provisiones p
JOIN Empleados_Provisiones ep ON p.id_provision = ep.id_provision
JOIN Empleados e ON ep.id_empleado = e.id_empleado
JOIN Personas pe ON e.id_persona = pe.id_persona
WHERE (pe.apellido_paterno, pe.apellido_materno) = ('Perez', 'Garcia');

-- los alimentos en un rango de precios
SELECT nombre, descripcion, precio
FROM Alimentos
WHERE precio >= 10.00 AND precio <= 20.00;

SELECT p.id_provision, p.fecha, p.total, ep.id_empleado
FROM Provisiones p
JOIN Empleados_Provisiones ep ON p.id_provision = ep.id_provision
WHERE p.fecha >= '2020-01-01' AND p.fecha <= '2020-12-31' AND p.total > 1000.00;

















