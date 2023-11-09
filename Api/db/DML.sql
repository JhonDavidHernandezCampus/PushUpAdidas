DROP DATABASE servientrega;
CREATE DATABASE servientrega;
USE servientrega;

CREATE TABLE tipo_paquete (
	id_tipo_paquete INT PRIMARY KEY AUTO_INCREMENT,
	tipo VARCHAR(60),
	descripcion VARCHAR(200)
);


CREATE TABLE dimenciones (
	id_dimenciones INT PRIMARY KEY AUTO_INCREMENT,
	alto_centimetros INT,
	ancho_centimetros INT,
	profundidad_centimetros INT
);

CREATE TABLE paquete (
	id_paquete INT PRIMARY KEY AUTO_INCREMENT,
	decripcion VARCHAR(200),
	cobro_estimado DOUBLE,
	id_dimenciones_fk INT,
	peso_paquete_kilogramos DOUBLE, 
	id_tipo_paquete_fk INT,
	FOREIGN KEY (id_tipo_paquete_fk) REFERENCES tipo_paquete(id_tipo_paquete),
	FOREIGN KEY (id_dimenciones_fk) REFERENCES dimenciones(id_dimenciones)
);


CREATE TABLE ruta (
	id_ruta INT PRIMARY KEY AUTO_INCREMENT,
	ruta_descripcion VARCHAR(200),
	tiempo_en_ruta_horas DOUBLE
);

CREATE TABLE seguimiento (
	id_seguimiento INT PRIMARY KEY AUTO_INCREMENT,
	ubicacion VARCHAR(100),
	fecha DATE
);
CREATE TABLE tipo_transporte (
	id_transporte INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(60),
	decripcion VARCHAR(200)
);


CREATE TABLE usuario (
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(60),
	email VARCHAR(60),
	edad INT,
	direccion  VARCHAR(150), 
	telefono VARCHAR(15)
);

CREATE TABLE envio (
	id_envio INT PRIMARY KEY AUTO_INCREMENT,
	id_remitente_fk INT,
	id_reseptor_fk INT,
	direc_origen VARCHAR(100),
	direc_destino VARCHAR(100),
	id_paquete_fk INT,
	id_ruta_fk INT,
	id_seguimiento_fk INT,
	id_tipo_transporte_fk INT,
	FOREIGN KEY (id_remitente_fk) REFERENCES usuario(id_usuario),
	FOREIGN KEY (id_reseptor_fk) REFERENCES usuario(id_usuario),
	FOREIGN KEY (id_paquete_fk) REFERENCES paquete(id_paquete),
	FOREIGN KEY (id_ruta_fk) REFERENCES ruta(id_ruta),
	FOREIGN KEY (id_seguimiento_fk) REFERENCES seguimiento(id_seguimiento),
	FOREIGN KEY (id_tipo_transporte_fk) REFERENCES tipo_transporte(id_transporte)
);


/* Incerciones de datos */
INSERT INTO tipo_paquete (tipo, descripcion) VALUES ('Pequeño', 'Paquete pequeño para objetos ligeros');
INSERT INTO tipo_paquete (tipo, descripcion) VALUES ('Mediano', 'Paquete mediano para artículos de tamaño promedio');
INSERT INTO tipo_paquete (tipo, descripcion) VALUES ('Grande', 'Paquete grande para objetos voluminosos');
INSERT INTO tipo_paquete (tipo, descripcion) VALUES ('Fragil', 'Paquete especial para objetos frágiles');
INSERT INTO tipo_paquete (tipo, descripcion) VALUES ('Documentos', 'Paquete para documentos importantes');


INSERT INTO dimenciones (alto_centimetros, ancho_centimetros, profundidad_centimetros) VALUES (20, 30, 10);
INSERT INTO dimenciones (alto_centimetros, ancho_centimetros, profundidad_centimetros) VALUES (40, 40, 20);
INSERT INTO dimenciones (alto_centimetros, ancho_centimetros, profundidad_centimetros) VALUES (60, 80, 30);
INSERT INTO dimenciones (alto_centimetros, ancho_centimetros, profundidad_centimetros) VALUES (15, 15, 15);
INSERT INTO dimenciones (alto_centimetros, ancho_centimetros, profundidad_centimetros) VALUES (25, 35, 5);


INSERT INTO paquete (decripcion, cobro_estimado, id_dimenciones_fk, peso_paquete_kilogramos, id_tipo_paquete_fk) VALUES ('Paquete pequeño y ligero', 12.50, 1, 1.2, 1);
INSERT INTO paquete (decripcion, cobro_estimado, id_dimenciones_fk, peso_paquete_kilogramos, id_tipo_paquete_fk) VALUES ('Paquete mediano con artículos varios', 25.00, 2, 3.5, 2);
INSERT INTO paquete (decripcion, cobro_estimado, id_dimenciones_fk, peso_paquete_kilogramos, id_tipo_paquete_fk) VALUES ('Gran paquete voluminoso', 50.00, 3, 10.8, 3);
INSERT INTO paquete (decripcion, cobro_estimado, id_dimenciones_fk, peso_paquete_kilogramos, id_tipo_paquete_fk) VALUES ('Paquete frágil con cristalería', 30.00, 4, 2.7, 4);
INSERT INTO paquete (decripcion, cobro_estimado, id_dimenciones_fk, peso_paquete_kilogramos, id_tipo_paquete_fk) VALUES ('Envío de documentos importantes', 15.00, 5, 0.5, 5);

INSERT INTO ruta (ruta_descripcion, tiempo_en_ruta_horas) VALUES ('Ruta nacional', 6.5);
INSERT INTO ruta (ruta_descripcion, tiempo_en_ruta_horas) VALUES ('Ruta regional', 4.0);
INSERT INTO ruta (ruta_descripcion, tiempo_en_ruta_horas) VALUES ('Ruta internacional', 12.0);
INSERT INTO ruta (ruta_descripcion, tiempo_en_ruta_horas) VALUES ('Ruta de entrega rápida', 3.5);
INSERT INTO ruta (ruta_descripcion, tiempo_en_ruta_horas) VALUES ('Ruta de servicio exprés', 2.0);


INSERT INTO seguimiento (ubicacion, fecha) VALUES ('Almacén central', '2023-11-03');
INSERT INTO seguimiento (ubicacion, fecha) VALUES ('En tránsito', '2023-11-04');
INSERT INTO seguimiento (ubicacion, fecha) VALUES ('Entregado', '2023-11-06');
INSERT INTO seguimiento (ubicacion, fecha) VALUES ('En ruta de entrega', '2023-11-05');
INSERT INTO seguimiento (ubicacion, fecha) VALUES ('En revisión aduanal', '2023-11-07');



INSERT INTO tipo_transporte (nombre, decripcion) VALUES ('Camión', 'Transporte por carretera en camiones');
INSERT INTO tipo_transporte (nombre, decripcion) VALUES ('Avión', 'Transporte aéreo de carga');
INSERT INTO tipo_transporte (nombre, decripcion) VALUES ('Barco', 'Transporte marítimo de mercancías');
INSERT INTO tipo_transporte (nombre, decripcion) VALUES ('Tren', 'Transporte ferroviario de carga');
INSERT INTO tipo_transporte (nombre, decripcion) VALUES ('Furgoneta', 'Transporte local en furgonetas');




INSERT INTO usuario (nombre, email, edad, direccion, telefono) VALUES ('Juan Pérez', 'juan@example.com', 30, '123 Calle Principal', '555-123-4567');
INSERT INTO usuario (nombre, email, edad, direccion, telefono) VALUES ('María López', 'maria@example.com', 28, '456 Avenida Secundaria', '555-987-6543');
INSERT INTO usuario (nombre, email, edad, direccion, telefono) VALUES ('Pedro Ramírez', 'pedro@example.com', 35, '789 Calle Secundaria', '555-789-1234');
INSERT INTO usuario (nombre, email, edad, direccion, telefono) VALUES ('Laura García', 'laura@example.com', 25, '101 Calle Principal', '555-567-8901');
INSERT INTO usuario (nombre, email, edad, direccion, telefono) VALUES ('Carlos Martínez', 'carlos@example.com', 40, '222 Avenida Principal', '555-234-5678');


INSERT INTO envio (id_remitente_fk, id_reseptor_fk, direc_origen, direc_destino, id_paquete_fk, id_ruta_fk, id_seguimiento_fk, id_tipo_transporte_fk) VALUES (1, 2, '123 Calle Principal', '456 Avenida Secundaria', 2, 1, 2, 1);
INSERT INTO envio (id_remitente_fk, id_reseptor_fk, direc_origen, direc_destino, id_paquete_fk, id_ruta_fk, id_seguimiento_fk, id_tipo_transporte_fk) VALUES (3, 4, '789 Calle Secundaria', '101 Calle Principal', 4, 3, 4, 2);
INSERT INTO envio (id_remitente_fk, id_reseptor_fk, direc_origen, direc_destino, id_paquete_fk, id_ruta_fk, id_seguimiento_fk, id_tipo_transporte_fk) VALUES (2, 5, '456 Avenida Secundaria', '222 Avenida Principal', 1, 5, 1, 3);
INSERT INTO envio (id_remitente_fk, id_reseptor_fk, direc_origen, direc_destino, id_paquete_fk, id_ruta_fk, id_seguimiento_fk, id_tipo_transporte_fk) VALUES (4, 1, '101 Calle Principal', '123 Calle Principal', 3, 2, 3, 4);
INSERT INTO envio (id_remitente_fk, id_reseptor_fk, direc_origen, direc_destino, id_paquete_fk, id_ruta_fk, id_seguimiento_fk, id_tipo_transporte_fk) VALUES (5, 3, '222 Avenida Principal', '789 Calle Secundaria', 5, 4, 5, 5);



