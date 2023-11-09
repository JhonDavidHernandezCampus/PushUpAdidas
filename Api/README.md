# Guia para el Uso del Api
## Instalacion
- Para instalar el proyecto seguir los siguientes pasos
1. Abrir terminal y ejecutar.

```cmd
git clone https://github.com/JhonDavidHernandezCampus/PushUpServientrega.git
 ```

2. Abrir carpeta.
3. Ejecutar el siguiente comando. 

```cmd
cd PushUpServientrega
npm update
```

## !Advertencia para usar el api primero debes obtener un token de verificacion¡

- Method = GET
- Enpoint:  http://127.1.1.1:5001/token/:id/nombreUsusario
- Ejemplo: http://127.1.1.1:5001/token/123212/Miguel

Una vez tengas tu token de verificacion debes colocarlo en un header llamado Authorization para que el api te pueda validar.

### Uso general de crod para todas las tablas

El metodo que debras usar sera correspondiente a la accion que desees realizar 
###### Method
Actualizar = PUT
Insertar = POST
Eliminar = DELETE
Octener datos = GET

###### Formulacion de peticion
# ventas
```cmd
http://127.1.1.1:5001/${NombreTabla}/${NombreAccion}
```










![](./diagrama.png)


# Notas 
- En el archivo DML.sql se encuentran los scrips de la base de datos,
en este archivo se encuentra una imagen con el digrama entidad-relacion.
