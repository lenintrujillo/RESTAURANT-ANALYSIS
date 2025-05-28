-- a) Crear la base de datos con el archivo create_restaurant_db.sql
-- b) Explorar la tabla “menu_items” para conocer los productos del menú.

select * 
	from menu_items;

-- 1.- Realizar consultas para contestar las siguientes preguntas:
-- * Encontrar el número de artículos en el menú.
select count(*) 
	from menu_items as numero_articulos_menu;

-- RESPUESTA: Hay 32 artículos en el menú.

-- * ¿Cuál es el artículo menos caro y el más caro en el menú?
select item_name as articulo_barato, price
	from menu_items
	where price = (select min(price) from menu_items);

select item_name as articulo_caro, price
	from menu_items
	where price = (select max(price) from menu_items);

-- RESPUESTA:  El artículo más barato es el Edamame y el más caro es Shrimp Scampi.

-- * ¿Cuántos platos americanos hay en el menú?
select (item_name) as platos_americanos
	from menu_items
	where category like 'American';

-- RESPUESTA: Existen 6 platos americanos en el menú.

-- * ¿Cuál es el precio promedio de los platos?
select round(avg (price),2) as promedio_precio
	from menu_items;

-- RESPUESTA: El precio promedio de los platos es de $13.29.

-- c) Explorar la tabla “order_details” para conocer los datos que han sido recolectados.

select * 
	from order_details;

-- 1.- Realizar consultas para contestar las siguientes preguntas:
-- * ¿Cuántos pedidos únicos se realizaron en total?
select count (distinct order_id) as total_pedidos_unicos
	from order_details;

-- RESPUESTA: Existe un total de 5,370 pedidos únicos.

-- * ¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?
select order_id, count(order_id) as total_articulos
	from order_details
	group by order_id
	order by total_articulos desc
		limit 10;

-- RESPUESTA: Hay más de 5 pedidos con la misma cantidad de 14 artículos los cuales son: 4482, 3473, 440, 443, 1957, 330, 4305, 2675.

-- * ¿Cuándo se realizó el primer pedido y el último pedido?
select order_date, order_time 
	from order_details
	group by order_date, order_time
	order by order_date asc, order_time asc
		limit 1;

select order_date, order_time 
	from order_details
	group by order_date, order_time
	order by order_date desc, order_time desc
		limit 1;

-- RESPUESTA: El primer pedido se hizo el 2023-01-01 a las 11:38:36 y el último el 2023-03-31 a las 22:15:38.

-- * ¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?

select count(*) as total_pedidos
	from order_details
	where order_date between '2023-01-01' and '2023-01-05';

-- RESPUESTA: Durante este periodo se han hecho 702 pedidos.

-- d) Usar ambas tablas para conocer la reacción de los clientes respecto al menú.

/* 1.- Realizar un left join entre entre order_details y menu_items con el identificador
item_id(tabla order_details) y menu_item_id(tabla menu_items).*/
select *
	from order_details od
	left join menu_items mi 
		on od.item_id = mi.menu_item_id;


/* e) Una vez que hayas explorado los datos en las tablas correspondientes y respondido las
preguntas planteadas, realiza un análisis adicional utilizando este join entre las tablas. El
objetivo es identificar 5 puntos clave que puedan ser de utilidad para los dueños del
restaurante en el lanzamiento de su nuevo menú. Para ello, crea tus propias consultas y
utiliza los resultados obtenidos para llegar a estas conclusiones.*/

-- * ¿Cuales son los 5 productos del menú que han sido más pedidos?
select mi.item_name, count(*) as veces_pedido
	from order_details od
	left join menu_items mi 
		on od.item_id = mi.menu_item_id
	group by mi.item_name
	order by veces_pedido desc
		limit 5;

-- RESPUESTA: Los 5 productos más vendidos son: Hamburger, Edamame, Korean Beef Bowl, Cheeseburger, French Fries.

-- * ¿Cuáles son los pedidos más caros?
select od.order_id, sum(mi.price) as total_pedido
	from order_details od
	left join menu_items mi 
		on od.item_id = mi.menu_item_id
	group by od.order_id
	order by total_pedido desc
		limit 5;

-- RESPUESTA: Los pedidos más caros han sido: 1044, 50, 2614, 1004, 147.

-- * ¿En qué fecha y hora se hizo el último pedido?
select order_date, order_time
	from order_details
	order by order_date desc, order_time desc
		limit 1;

-- RESPUESTA: El último pedido se hizo el 2023-03-31 a las 22:15:38.

-- * ¿Cuántos pedidos se hicieron por día?
select order_date, count(distinct order_id) as total_pedidos
	from order_details
	group by order_date
	order by order_date;

-- RESPUESTA: Te permite ver el total de pedidos por cada día registrado.

-- * ¿Qué registros tienen item_id que ya no existen en menu_items?
select *
	from order_details od
	left join menu_items mi on od.item_id = mi.menu_item_id
	where mi.menu_item_id is null;

-- RESPUESTA: Te permite ver que item_id ya no se encuentran en menu_items.
