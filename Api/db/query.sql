ORDEN DE CREACION 

pais -
departamento-
municipio-
empresa-
insumo-
tipo_estado-
estado - 
color -
tipo_proteccion -
genero -
prenda -
insumo_prendas -
inventario-
talla -
forma_pago -
cargos -
empleado-
tipo_persona-
cliente-
proveedor-
orden-
detalle_orden-
venta -
inventario_talla-
detalle_venta-
insumo_proveedor





create database Bioseguridad;
USE Bioseguridad;

CREATE TABLE pais (
 Id INT PRIMARY KEY AUTO_INCREMENT, 
 nombre varchar(50)
 );


CREATE TABLE departamento (
 Id INT PRIMARY KEY AUTO_INCREMENT, 
 nombre varchar(50),
 IdPaisFk INT,
 FOREIGN KEY (IdPaisFk) REFERENCES pais(Id)
 );

CREATE TABLE municipio (
 Id INT PRIMARY KEY AUTO_INCREMENT, 
 nombre varchar(50),
 IdDepartamentoFk INT,
 FOREIGN KEY (IdDepartamentoFk) REFERENCES departamento(Id)
 );
 
 CREATE TABLE empresa (
 Id INT PRIMARY KEY AUTO_INCREMENT, 
 nit varchar(50),
 razon_social text,
 representante_legal VARCHAR(50),
 FechaCreacion DATE,
 IdMunicipioFk INT,
 FOREIGN KEY (IdMunicipioFk) REFERENCES municipio(Id)
 );
 
 CREATE TABLE insumo (
 Id INT PRIMARY KEY AUTO_INCREMENT, 
 nombre varchar(50),
 valor_unit DOUBLE,
 stock_min DOUBLE,
 stock_max DOUBLE
 );

 CREATE TABLE tipo_estado(
 Id INT PRIMARY KEY AUTO_INCREMENT, 
 Descripcion varchar(50)
 );

 CREATE TABLE estado(
 Id INT PRIMARY KEY AUTO_INCREMENT, 
 descripcion varchar(50),
 IdTipoEstadoFK INT,
 FOREIGN KEY (IdTipoEstadoFK) REFERENCES tipo_estado(Id)
 );


 CREATE TABLE color(
 Id INT PRIMARY KEY AUTO_INCREMENT, 
 Descripcion varchar(50)
 );

 CREATE TABLE tipo_proteccion(
 Id INT PRIMARY KEY AUTO_INCREMENT, 
 Descripcion varchar(255)
 );
 
 CREATE TABLE genero(
 Id INT PRIMARY KEY AUTO_INCREMENT, 
 descripcion varchar(50)
 );


 CREATE TABLE prenda (
 Id INT PRIMARY KEY AUTO_INCREMENT, 
 Nombre varchar(50),
 ValorUnitCop DOUBLE,
 ValorUnitUsd DOUBLE,
 IdEstadoFK INT,
 IdTipoProteccion INT,
 IdGeneroFK INT,
 Codigo VARCHAR(50),
 FOREIGN KEY (IdEstadoFK) REFERENCES estado(Id),
 FOREIGN KEY (IdTipoProteccion) REFERENCES tipo_proteccion(Id),
 FOREIGN KEY (IdGeneroFK) REFERENCES genero(Id)
 );
 
 CREATE TABLE insumo_prendas(
 IdInsumoFk INT, 
 IdPrendaFk INT,
 Cantidad INT,
 FOREIGN KEY (IdInsumoFk) REFERENCES insumo(Id),
 FOREIGN KEY (IdPrendaFk) REFERENCES prenda(Id)
 );
 
  CREATE TABLE inventario (
 Id INT PRIMARY KEY AUTO_INCREMENT, 
 CodInv varchar(255),
 IdPrendaFK INT,
 ValorVtaCop DOUBLE,
 ValorVtaUsd DOUBLE,
 FOREIGN KEY (IdPrendaFK) REFERENCES prenda(Id)
 );

 CREATE TABLE talla(
 Id INT PRIMARY KEY AUTO_INCREMENT, 
 descripcion varchar(50)
 );


 CREATE TABLE forma_pago(
 Id INT PRIMARY KEY AUTO_INCREMENT, 
 descripcion varchar(50)
 );


 CREATE TABLE cargos(
 Id INT PRIMARY KEY AUTO_INCREMENT, 
 descripcion varchar(50),
 sueldo_base DOUBLE
 );

 CREATE TABLE empleado (
 Id INT PRIMARY KEY AUTO_INCREMENT, 
 nombre varchar(50),
 fecha_ingreso DATE,
 IdCargoFk INT,
 IdMunicipioFk INT,
 FOREIGN KEY (IdCargoFk) REFERENCES cargos(Id),
 FOREIGN KEY (IdMunicipioFk) REFERENCES municipio(Id)
 );

 CREATE TABLE tipo_persona(
 Id INT PRIMARY KEY AUTO_INCREMENT, 
 Nombre varchar(50)
 );

 CREATE TABLE cliente (
 Id INT PRIMARY KEY AUTO_INCREMENT, 
 nombre varchar(50),
 IdCliente VARCHAR(255),
 fechaRegistro DATE,
 IdTipoPersonaFk INT,
 IdMunicipioFk INT,
 FOREIGN KEY (IdTipoPersonaFk) REFERENCES tipo_persona(Id),
 FOREIGN KEY (IdMunicipioFk) REFERENCES municipio(Id)
 );

 CREATE TABLE proveedor (
 Id INT PRIMARY KEY AUTO_INCREMENT, 
 NitProveedor VARCHAR(50),
 Nombre varchar(50),
 IdTipoPersona INT,
 IdMunicipioFk INT,
 FOREIGN KEY (IdTipoPersona) REFERENCES tipo_persona(Id),
 FOREIGN KEY (IdMunicipioFk) REFERENCES municipio(Id)
 );

 CREATE TABLE orden (
 Id INT PRIMARY KEY AUTO_INCREMENT, 
 fecha date,
 IdEmpleadoFk INT,
 IdClienteFk INT,
 IdEstadoFK INT,
 FOREIGN KEY (IdEmpleadoFk) REFERENCES empleado(Id),
 FOREIGN KEY (IdClienteFk) REFERENCES cliente(Id),
 FOREIGN KEY (IdEstadoFK) REFERENCES estado(Id)
 );
 
  CREATE TABLE detalle_orden (
 Id INT PRIMARY KEY AUTO_INCREMENT, 
 IdOrdenFk INT,
 IdPrendaFk INT,
 PrendaId INT,
 cantidad_producir INT,
 IdColorFk INT,
 cantidad_producida INT,
 IdEstadoFk INT,
 FOREIGN KEY (IdOrdenFk) REFERENCES orden(Id),
 FOREIGN KEY (IdPrendaFk) REFERENCES prenda(Id),
 FOREIGN KEY (IdColorFk) REFERENCES color(Id),
 FOREIGN KEY (IdEstadoFk) REFERENCES estado(Id)
 );
 
  CREATE TABLE venta (
 Id INT PRIMARY KEY AUTO_INCREMENT, 
 Fecha date,
 IdEmpleadoFk INT,
 IdClienteFk INT,
 IdFormaPagoFK INT,
 FOREIGN KEY (IdEmpleadoFk) REFERENCES empleado(Id),
 FOREIGN KEY (IdClienteFk) REFERENCES cliente(Id),
 FOREIGN KEY (IdFormaPagoFK) REFERENCES forma_pago(Id)
 );
 
  CREATE TABLE inventario_talla (
 IdInvFk INT ,
 IdTallaFk INT, 
 FOREIGN KEY (IdInvFk) REFERENCES inventario(Id),
 FOREIGN KEY (IdTallaFk) REFERENCES talla(Id)
 );
 
 CREATE TABLE detalle_venta (
 Id INT PRIMARY KEY AUTO_INCREMENT, 
 IdVentaFk INT,
 IdProductoFk INT,
 IdTallaFk INT,
 cantidad INT,
 valot_unit double,
 FOREIGN KEY (IdVentaFk) REFERENCES venta(Id),
 FOREIGN KEY (IdProductoFk) REFERENCES inventario(Id),
 FOREIGN KEY (IdTallaFk) REFERENCES talla(Id)
 );
 
 
 CREATE TABLE insumo_proveedor (
 IdInsumoFk INT,
 IdProveedorFk INT, 
 FOREIGN KEY (IdInsumoFk) REFERENCES insumo(Id),
 FOREIGN KEY (IdProveedorFk) REFERENCES proveedor(Id)
 );
 
 
 ALTER TABLE org RENAME COLUMN deptnumb TO deptnum



Listar todas las ventas que se realizaron en el mes de julio de 2023.

SELECT * FROM venta WHERE Fecha > '2023-07-01' and Fecha < '2023-07-28'; 

Seleccionar todos los empleados con sus respectivos cargos y municipios.

SELECT *  FROM empleado Inner Join cargos ON cargos.Id = empleado.IdCargoFk INNER JOIN municipio  ON municipio.Id = empleado.IdMunicipioFk;

Obtener la lista de todas las ventas con la información de los clientes y la forma de pago.

SELECT *  FROM venta 
Inner Join cliente 
ON cliente.Id = venta.IdClienteFk 
INNER JOIN forma_pago  
ON forma_pago.Id = venta.IdFormaPagoFk;

Mostrar los detalles de todas las órdenes junto con los nombres de los empleados y clientes
asociados.

SELECT *  FROM orden 
Inner Join cliente 
ON cliente.Id = orden.IdClienteFk 
INNER JOIN empleado  
ON empleado.Id = orden.IdEmpleadoFk
INNER JOIN detalle_orden  
ON orden.Id = detalle_orden.IdOrdenFk;


Listar los productos disponibles en el inventario junto con su talla y color.

SELECT *  FROM prenda 
INNER JOIN inventario  
ON prenda.Id = inventario.IdPrendaFk
Inner Join inventario_talla 
ON inventario.Id = inventario_talla.IdInvFk 
Inner Join talla 
ON talla.Id = inventario_talla.IdTallaFk 
INNER JOIN detalle_orden  
ON prenda.Id = detalle_orden.idPrendaFk
INNER JOIN color 
ON color.Id = detalle_orden.IdColorFk;

Mostrar todos los proveedores junto con la lista de insumos que suministra

SELECT *  FROM proveedor 
Inner Join insumo_proveedor 
ON proveedor.Id = insumo_proveedor.IdProveedorFk 
INNER JOIN insumo  
ON insumo.Id = insumo_proveedor.IdInsumoFk;

Encontrar la cantidad de ventas realizadas por cada empleado.

SELECT empleado.nombre, COUNT(venta.IdEmpleadoFk) Cantidad_Ventas FROM empleado 
Inner Join venta 
ON empleado.Id = venta.IdEmpleadoFk
GROUP BY empleado.nombre ;


Mostrar la lista de órdenes en proceso junto con los nombres de los clientes y empleados
asociados.

 Obtener el nombre de la empresa y su respectivo representante legal junto con el nombre del municipio al que pertenecen.
 
 SELECT empresa.representante_legal,empresa.nit, municipio.nombre 
 FROM municipio 
 INNER JOIN empresa 
 ON municipio.Id = empresa.IdMunicipioFk;

 Encontrar el nombre de los clientes que realizaron compras en una fecha específica junto
con la cantidad de artículos comprados.

Mostrar la lista de empleados y la duración de su empleo en años.

Obtener el nombre de las prendas junto con el valor total de ventas en dólares para cada
una.

UPDATE empleados
SET Fecha = '50000',
IdEmpleadoFk = '3000',
IdClienteFk = "",
IdFormaPagoFK = ""
WHERE Id = 1;