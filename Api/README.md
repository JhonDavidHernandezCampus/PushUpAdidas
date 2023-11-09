![](https://raw.githubusercontent.com/CampusLands/DER/main/DER.jpg)

**1. Listar todas las ventas que se realizaron en el mes de julio de 2023**

```sql
SELECT * FROM venta WHERE Fecha > '2023-07-01' and Fecha < '2023-07-28'; 
```

**2. Seleccionar todos los empleados con sus respectivos cargos y municipios**

```sql
SELECT *  FROM empleado Inner Join cargos ON cargos.Id = empleado.IdCargoFk INNER JOIN municipio  ON municipio.Id = empleado.IdMunicipioFk;
```

**3. Obtener la lista de todas las ventas con la información de los clientes y la forma de pago**

```sql
SELECT *  FROM venta 
Inner Join cliente 
ON cliente.Id = venta.IdClienteFk 
INNER JOIN forma_pago  
ON forma_pago.Id = venta.IdFormaPagoFk;
```

**4. Mostrar los detalles de todas las órdenes junto con los nombres de los empleados y clientes asociados**

```sql
SELECT *  FROM orden 
Inner Join cliente 
ON cliente.Id = orden.IdClienteFk 
INNER JOIN empleado  
ON empleado.Id = orden.IdEmpleadoFk
INNER JOIN detalle_orden  
ON orden.Id = detalle_orden.IdOrdenFk;
```

**5. Listar los productos disponibles en el inventario junto con su talla y color**

```sql
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
```

**6. Mostrar todos los proveedores junto con la lista de insumos que suminis**

```sql
SELECT *  FROM proveedor 
Inner Join insumo_proveedor 
ON proveedor.Id = insumo_proveedor.IdProveedorFk 
INNER JOIN insumo  
ON insumo.Id = insumo_proveedor.IdInsumoFk;
```

**7. Encontrar la cantidad de ventas realizadas por cada empleado**

```sql
SELECT empleado.nombre, COUNT(venta.IdEmpleadoFk) Cantidad_Ventas FROM empleado 
Inner Join venta 
ON empleado.Id = venta.IdEmpleadoFk
GROUP BY empleado.nombre ;
```

**8. Mostrar la lista de órdenes en proceso junto con los nombres de los clientes y empleados asociados**

```sql
# --.....
```

**9. Obtener el nombre de la empresa y su respectivo representante legal junto con el nombre del municipio al que pertenecen**

```sql
 
 SELECT empresa.representante_legal,empresa.nit, municipio.nombre 
 FROM municipio 
 INNER JOIN empresa 
 ON municipio.Id = empresa.IdMunicipioFk;

```

**10. Mostrar la lista de prendas y su respectivo stock disponible**

```sql
# Consulta realizada ....
```

**11. Encontrar el nombre de los clientes que realizaron compras en una fecha específica junto con la cantidad de artículos comprados**

```sql
# Consulta realizada ....
```

**12. Mostrar la lista de empleados y la duración de su empleo en años **

```sql
# Consulta realizada ....
```

**13. Obtener el nombre de las prendas junto con el valor total de ventas en dólares para cada una **

```sql
# Consulta realizada ....
```

**14. Obtener el nombre de las prendas junto con la cantidad mínima y máxima de insumos necesarios para su fabricación **

```sql
# Consulta realizada ....
```

**15. Obtener la lista de empleados y su información de contacto, incluyendo el nombre, el cargo y el municipio **

```sql
# Consulta realizada ....
```

**16. Mostrar la lista de ventas realizadas en un rango de fechas específico junto con el nombre del cliente y la forma de pago **

```sql
# Consulta realizada ....
```

**17. Obtener el nombre de las prendas y su valor unitario en dólares junto con el estado de disponibilidad **

```sql
# Consulta realizada ....
```

**18. Mostrar la lista de clientes y la cantidad de compras que han realizado **

```sql
# Consulta realizada ....
```

**19. Obtener la lista de órdenes junto con el estado actual y la fecha en que se crearon **

```sql
# Consulta realizada ....
```

**20. Obtener el nombre y la descripción de los cargos con un sueldo base superior a 2.000.000  **

```sql
# Consulta realizada ....
```

**21. Mostrar la lista de clientes con sus respectivos municipios y países  **

```sql
# Consulta realizada ....
```

**22 Obtener el nombre y la descripción de los tipos de protección y el número de prendas asociadas a cada tipo  **

```sql
# Consulta realizada ....
```

**23 Mostrar la lista de empleados con sus cargos y fechas de ingreso ordenados por la fecha de ingreso de manera descendente  **

```sql
# Consulta realizada ....
```

**24 Mostrar el nombre y la descripción de todos los cargos junto con la cantidad de empleados en cada cargo  **

```sql
# Consulta realizada ....
```

**25 Obtener el nombre y la descripción de los estados junto con la cantidad de prendas asociadas a cada estado  **

```sql
# Consulta realizada ....
```

**26 Obtener el nombre y la descripción de los tipos de persona junto con la cantidad de clientes asociados a cada tipo  **

```sql
# Consulta realizada ....
```

**27 Mostrar el nombre y la descripción de los tipos de protección junto con la cantidad de prendas asociadas a cada tipo  **

```sql
# Consulta realizada ....
```

**28 Obtener el nombre y la descripción de los estados junto con la cantidad de órdenes asociadas a cada estado  **

```sql
# Consulta realizada ....
```

**29 Obtener el nombre y la descripción de los tipos de pago junto con la cantidad de ventas asociadas a cada tipo  **

```sql
# Consulta realizada ....
```

**30 Mostrar el nombre y la descripción de los tipos de insumos junto con la cantidad de prendas que los utilizan **

```sql
# Consulta realizada ....
```

**31 Obtener el nombre de los clientes y la cantidad total gastada por cada uno en ventas **

```sql
# Consulta realizada ....
```

**32 Mostrar el nombre y la descripción de las prendas junto con el valor total de ventas en pesos colombianos para cada una **

```sql
# Consulta realizada ....
```

**33 Mostrar el nombre y la descripción de los estados junto con la cantidad de prendas asociadas a cada estado en orden ascendente de la cantidad de prendas **

```sql
# Consulta realizada ....

```

