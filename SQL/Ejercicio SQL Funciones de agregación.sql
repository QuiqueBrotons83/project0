
/* MIN y MAX */

-- Ejercicio 1: Encontrar la duración mínima de las pistas en milisegundos.
select min("Milliseconds") as "Duración munima de las pistas"	
from "Track"; 

-- Ejercicio 2: Encontrar la duración máxima de las pistas en milisegundos.
select max("Milliseconds") as "Duración máxima de las pistas"
from "Track"; 
-- Ejercicio 3: Encontrar el precio mínimo de las pistas.
select min("UnitPrice") as "Precio mínimo de las pistas"
from "Track";
-- Ejercicio 4: Encontrar el precio máximo de las pistas.
select max("UnitPrice") as "Precio máximo de las pistas"
from "Track" ;

-- Ejercicio 5: Encontrar la fecha mínima de la factura.
select min("InvoiceDate") as "Fecha mínima factura"
from "Invoice" ;

-- Ejercicio 6: Encontrar la fecha máxima de la factura.
select max("InvoiceDate") as "Fecha máxima factura"
from "Invoice" ;

/* COUNT y SUM */

-- Ejercicio 7: Contar el número total de pistas.
select count("TrackId") as "Número total de pistas"
from "Track" ;
-- Ejercicio 8: Contar el número de clientes en Brasil.

select count("Country") as "numero de clientes en Brasil"
from "Customer" c 
where "Country" = 'Brazil';

-- Ejercicio 9: Sumar la duración total de todas las pistas en milisegundos.
 select sum("Milliseconds") as "Suma de pistas"
 from "Track" t ;

-- Ejercicio 10: Contar el número de empleados con el título 'Sales Support Agent'.
select count("Title") as "Numero de empleados con titulo Sales Support Agent"
from "Employee" e 
where "Title" = 'Sales Support Agent';
-- Ejercicio 11: Sumar el total de las cantidades en las facturas.
select sum("Total") as "Cantidades en las facturas"
from "Invoice" i; 

/* AVG, STDDEV, VARIANCE */

-- Ejercicio 12: Calcular la duración media de las pistas en milisegundos.
select avg("Milliseconds") as "Calculo de la media de las pistas" 
from "Track" t;

-- Ejercicio 13: Calcular el precio medio de las pistas.
select avg("UnitPrice") as "Precio medio de las pistas"
from "Track" t;
    

-- Ejercicio 14: Calcular la desviación estándar de la duración de las pistas.
select stddev("Milliseconds") as "desviacion estándar de la duración"
from "Track" t ;
    

-- Ejercicio 15: Calcular la varianza de la duración de las pistas.
select variance("Milliseconds") as "Varianza de duración pistas" 
from "Track" t; 

-- Ejercicio 16: Calcular la desviación estándar del precio de las pistas.
select stddev("UnitPrice") "desviación estándar del precio de las pistas" 
from "Track" t; 

/* CONCAT */

-- Ejercicio 17: Concatenar el nombre y el apellido de los clientes.

SELECT CONCAT("FirstName", ' ', "LastName") AS "nombre_completo" 
FROM "Customer";

