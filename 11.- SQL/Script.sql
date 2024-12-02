-- Ejercicio

-- 1. Crear una base de datos llamada "tienda"

create database tienda

-- Crear 4 tablas dentro de la base de datos:

-- 1.1 Usuarios (id, nombre, apellido, edad, email, contrasena, rol, fechaCreacion, fechaActualizacion).

create table Usuarios (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
	nombre varchar(70), 
	apellido varchar(70), 
	edad int,
	email varchar(70), 
	contrasena varchar(30),
	rol_id int, 
	fechaCreacion date,
	fechaActualizacion date, 
	foreign key (rol_id) references Roles(id)
	
);

create table Roles (
	id INT NOT NULL PRIMARY KEY,
	nombreRol varchar(70)
	
);


-- 1.2 Categorias (id, nombre, tipo, fechaCreacion, fechaActualizacion).

create table Categorias (
	id INT NOT NULL PRIMARY KEY, 
	nombre varchar(70), 
	tipo varchar(70),
	fechaCreacion date,
	fechaActualizacion date
	
);

-- 1.3 Productos (id, nombre_producto, usuario_id, precio, stock, id_categoria, fechaCreacion, fechaActualizacion).

create table Productos (
	id varchar(8) NOT NULL PRIMARY KEY, 
	nombre_producto varchar(70), 
	usuario_id int, -- 01
	precio float,
	stock int, 
	id_categoria int,
	fechaCreacion date,
	fechaActualizacion date,
	foreign key (usuario_id) references Usuarios(id),	
	foreign key (id_categoria) references Categorias(id)		
);

-- 1.4 Ventas (id, producto_id, usuario_id, cantidad, precio_total, fechaCreacion, fechaActualizacion).


create table Ventas (
	id INT NOT NULL PRIMARY KEY, 
	producto_id varchar(8),
	usuario_id int,
	cantidad float, 
	precio_total float,
	fechaCreacion date, 
	fechaActualizacion date,
	foreign key (producto_id) references Productos(id),
	foreign key (usuario_id) references Usuarios(id)
);

-- 2. Insertar datos.

INSERT INTO tienda.usuarios
(id, nombre, apellido, edad, email, contrasena, rol_id, fechaCreacion, fechaActualizacion)
VALUES(4,"Greymar", "Barreto", 25, "prueba121@gmail.com", MD5("12345"),2, ('2024-01-29') , ('2024-01-29'));


INSERT INTO tienda.roles
(id, nombreRol)
VALUES(2, "Basico");



-- 2.1 Insertar datos en usuarios (4 usuarios normales y un administrador).

INSERT INTO tienda.usuarios
(id, nombre, apellido, edad, email, contrasena, rol_id, fechaCreacion, fechaActualizacion)
VALUES(4,"Greymar", "Barreto", 25, "prueba121@gmail.com", MD5("12345"),2, ('2024-01-29') , ('2024-01-29'));


-- 2.2 Insertar minimo 3 categorias.

INSERT INTO tienda.categorias
(id, nombre, tipo, fechaCreacion, fechaActualizacion)
VALUES(1, "Animales y Mascotas", "Animales",('2024-01-29'),('2024-01-29'));

INSERT INTO tienda.categorias
(id, nombre, tipo, fechaCreacion, fechaActualizacion)
VALUES(2, "Alimentos y Bebidas", "Comida",('2024-01-29'),('2024-01-29'));


INSERT INTO tienda.categorias
(id, nombre, tipo, fechaCreacion, fechaActualizacion)
VALUES(3, "Bebés", "Bebés",('2024-01-29'),('2024-01-29'));





-- 2.3 Insertar minimo 6 productos (2 por categoria).

	-- Categoria de Animales 
		INSERT INTO tienda.productos
		(id, nombre_producto, usuario_id, precio, stock, id_categoria, fechaCreacion, fechaActualizacion)
		VALUES("ARE001", "Arena para Gatos" , 1, 32, 20, 1, ('2024-01-29'),('2024-01-29'));
	
		INSERT INTO tienda.productos
		(id, nombre_producto, usuario_id, precio, stock, id_categoria, fechaCreacion, fechaActualizacion)
		VALUES("COR001", "Collar para Gatos" , 2, 4.5 , 40, 1, ('2024-01-29'),('2024-01-29'));
	
	-- Categoria de Alimentos y Bebidas
	
		INSERT INTO tienda.productos
		(id, nombre_producto, usuario_id, precio, stock, id_categoria, fechaCreacion, fechaActualizacion)
		VALUES("ARR002", "Arroz Mary" , 2,5.2, 17, 2, ('2024-01-29'),('2024-01-29'));
	
		INSERT INTO tienda.productos
		(id, nombre_producto, usuario_id, precio, stock, id_categoria, fechaCreacion, fechaActualizacion)
		VALUES("ACE001", "Aceite de Coco" , 2, 4.5 , 40, 2, ('2024-01-29'),('2024-01-29'));
	
	
	-- Categoria de Bebes
	
		INSERT INTO tienda.productos
		(id, nombre_producto, usuario_id, precio, stock, id_categoria, fechaCreacion, fechaActualizacion)
		VALUES("COC003", "Coche para Bebé" , 2,150.40, 13, 3, ('2024-01-29'),('2024-01-29'));
	
		INSERT INTO tienda.productos
		(id, nombre_producto, usuario_id, precio, stock, id_categoria, fechaCreacion, fechaActualizacion)
		VALUES("CUN001", "Cuna para Bebé" , 2, 200 , 5, 3, ('2024-01-29'),('2024-01-29'));


-- 2.4 Insertar 10 ventas.
	
	
INSERT INTO tienda.ventas
(id, producto_id, usuario_id, cantidad, precio_total, fechaCreacion, fechaActualizacion)
VALUES(0, "ACE001", 2, 2, 9, ('2024-01-29'),('2024-01-29'));

INSERT INTO tienda.ventas
(id, producto_id, usuario_id, cantidad, precio_total, fechaCreacion, fechaActualizacion)
VALUES(1, "ACE001", 2, 3, 13.5, ('2024-01-29'),('2024-01-29'));


INSERT INTO tienda.ventas
(id, producto_id, usuario_id, cantidad, precio_total, fechaCreacion, fechaActualizacion)
VALUES(2, "ACE001", 1, 3, 13.5, ('2024-01-29'),('2024-01-29'));

INSERT INTO tienda.ventas
(id, producto_id, usuario_id, cantidad, precio_total, fechaCreacion, fechaActualizacion)
VALUES(3, "ARR002", 2, 1, 5.2, ('2024-01-29'),('2024-01-29'));


INSERT INTO tienda.ventas
(id, producto_id, usuario_id, cantidad, precio_total, fechaCreacion, fechaActualizacion)
VALUES(4, "ARR002", 2, 3, 15.6, ('2024-01-29'),('2024-01-29'));

INSERT INTO tienda.ventas
(id, producto_id, usuario_id, cantidad, precio_total, fechaCreacion, fechaActualizacion)
VALUES(5, "COC003", 2, 1, 150.4, ('2024-01-29'),('2024-01-29'));

INSERT INTO tienda.ventas
(id, producto_id, usuario_id, cantidad, precio_total, fechaCreacion, fechaActualizacion)
VALUES(6, "COR001", 1, 1, 4.5, ('2024-01-29'),('2024-01-29'));

INSERT INTO tienda.ventas
(id, producto_id, usuario_id, cantidad, precio_total, fechaCreacion, fechaActualizacion)
VALUES(7, "COR001", 2, 1, 4.5, ('2024-01-29'),('2024-01-29'));


INSERT INTO tienda.ventas
(id, producto_id, usuario_id, cantidad, precio_total, fechaCreacion, fechaActualizacion)
VALUES(8, "COC003", 2, 1, 150.4, ('2024-01-29'),('2024-01-29'));


INSERT INTO tienda.ventas
(id, producto_id, usuario_id, cantidad, precio_total, fechaCreacion, fechaActualizacion)
VALUES(9, "CUN001", 2, 1, 200.00, ('2024-01-29'),('2024-01-29'));


-- 3. Consultas a realizar.

-- 3.1 Seleccionar los usuarios con un rol especifico.

select * from Usuarios 
inner join roles on Usuarios.rol_id  = roles.id
where roles.nombreRol = "Basico"

-- 3.2 Obtener el stock disponible de todos los productos.

select id, stock from productos 

-- 3.3 Calcular el total de ventas por usuario_id.

select usuario_id ,Usuarios.Nombre,SUM(round(precio_total,2)) 
from VENTAS
inner join usuarios on Ventas.usuario_id = Usuarios.id 
group by usuario_id 


-- 3.4 Actualizar el precio de un producto mayor a 100 y aplicar descuento del 10%.

UPDATE tienda.productos
SET precio = precio-(precio*0.10)
WHERE precio > 100;

-- 3.5 Eliminar ventas de un producto agotado (es decir con stock de 0).

DELETE FROM ventas
WHERE ventas.producto_id IN  (select productos.id from productos where productos.stock = 0);




