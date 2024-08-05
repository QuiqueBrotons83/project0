
-- Ejercicio 1:  Selecciona el nombre de todos los álbumes y ordénalos alfabéticamente.
select "Title" as "Nombre de los albums"
FROM "Album" a 
order by "Title" ;

-- Ejercicio 2:  Encuentra el álbum con el mayor número de canciones.
select "Title" as "Titulo del album", COUNT(t."TrackId") AS "Numero_de_canciones"
from "Album" a 
join "Track" t  ON a."AlbumId" = t."AlbumId" 
group by  "Title" 
order by "Numero_de_canciones" DESC
limit 1;


-- Ejercicio 3:  Calcula la duración promedio, desviación estándar y varianza por compositor.
select "Composer", 
  avg("Milliseconds") AS Duracion_Promedio,
  stddev("Milliseconds") AS Desviacion_Estandar,
  variance("Milliseconds") AS Varianza
from "Track" t 
group by "Composer" ;



-- Ejercicio 4: Selecciona el título y el precio de las pistas, y limita los resultados a 10.
select "Name"as "Titulo", "UnitPrice" as "Precio" 
from "Track" t 
limit 10;   

-- Ejercicio 5: Lista los nombres de los empleados y ordénalos por el ID del empleado en orden descendente.
select "FirstName", "LastName", "EmployeeId" 
from "Employee" e 
order by "EmployeeId" desc; 
-- Ejercicio 6:  Muestra el número de géneros distintos disponibles en la base de datos.
select count("Name") "Distintos numeros de generos"
from "Genre" g; 
-- Ejercicio 7: Selecciona el nombre del cliente y el país, limitando los resultados a 5, y ordena por el nombre del cliente.
select "FirstName" , "LastName", "Country" 
from "Customer" c 
order by "FirstName"
limit 5;
-- Ejercicio 8: Muestra la cantidad total de clientes agrupados por país.
select "Country" as "Paises", COUNT(*) as Numero_Clientes
from "Customer" c 
group by "Country" 
order by Numero_Clientes desc;


-- Ejercicio 9: Obtén el total de importes de facturas para cada país y muestra solo aquellos con un total superior a 10,000.
select "Country" as "Paises", sum(i."Total") as "Total_Importe"
from "Customer" c 
join "Invoice" i on c."CustomerId" = i."CustomerId" 
group by "Country" 
having  sum(i."Total") > 10000
order by "Total_Importe" desc;
-- No aparecen por que no hay superiores a esa cantidad--


-- Ejercicio 10: Encuentra los países donde el número total de clientes es mayor a 5. Muestra el país y el número de clientes.
select "Country" as "País" , count(*) AS Numero_Clientes
from "Customer" c 
group by "Country" 
having count(*) > 5
order by Numero_Clientes desc;


-- Ejercicio 11: Obtén la cantidad de pistas en cada tipo de medio (MediaType) que tienen una duración mayor a 250,000 milisegundos.
select mt."Name" as "Tipo_de_medio", count(t."TrackId") as "Cantidad de pistas" 
from "Track" t
join "MediaType" mt on t."MediaTypeId" = mt."MediaTypeId" 
where t."Milliseconds" > 250000
group by mt."Name" 
order by "Cantidad de pistas" desc;

-- Ejercicio 12: Lista el país y el número total de clientes que han sido asistidos por un representante de ventas específico, cuyo ID sea menor a 5.
select c."Country"as "País", count(c."CustomerId") as "Número_clientes", "EmployeeId" 
from "Customer" c 
join "Employee" e on c."SupportRepId" = e."EmployeeId" 
where e."EmployeeId" < 5
group by c."Country" , "EmployeeId" 
order by "Número_clientes" desc; 		

-- Ejercicio 13: Muestra los códigos postales (BillingPostalCode) de los clientes que han hecho más de 5 compras.
SELECT DISTINCT i."BillingPostalCode" , c."FirstName" , c."LastName"
from "Invoice" i
join "Customer" c on i."CustomerId" = c."CustomerId" 
where c."CustomerId" in ( 
    select "CustomerId" 
    from "Invoice" 
    group by "CustomerId" 
    having count(*)> 5);
 -- He añadido nombre y apellidos para que tenga más datos ya que solo con el Codigo postal no habia los suficientes.--
   
-- Ejercicio 14: Encuentra la cantidad total de pistas en cada tipo de medio (MediaTypeId) donde el precio de la pista (UnitPrice) es mayor a 0.99 y la duración de la pista (Milliseconds) es mayor a 200,000. Muestra el tipo de medio y el número total de pistas.
select mt."Name" as "tipo_medio", count(t."TrackId") as "cantidad_pistas"
from "Track" t
join "MediaType" mt on t."MediaTypeId" = mt."MediaTypeId" 
where t."UnitPrice" > 0.99 and t."Milliseconds" > 200000
group by mt."Name" 
order by  "cantidad_pistas" desc;


-- Ejercicio 15: Lista el país y el estado de los clientes que tienen el soporte asignado a un representante con ID mayor a 3 y cuyo nombre de empresa (Company) no es nulo. Muestra el país, el estado y el número de clientes.
select c."Country" , c."State", count(c."CustomerId") as "Numero_Clientes"
from "Customer" c
join "Employee" e on c."SupportRepId" = e."EmployeeId" 
where e."EmployeeId" > 3 and c."Company" is not null 
group by c."Country" , c."State" 
order by "Numero_Clientes" desc;
