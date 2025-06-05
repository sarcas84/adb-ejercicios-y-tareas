
## Ejercicio 6. Shakila (Español)

- [Esquema SQL](./06-schema.sql)
- [Datos SQL](./06-data.sql)

```
-- 1. ¿Cuál es el título de la película con el ID 10?
SELECT title FROM film WHERE film_id = 10;

-- 2. ¿Cuántas películas hay en total en la tabla film?
SELECT COUNT(*) FROM film;

-- 3. ¿Cuál es el ID de la película más cara?
SELECT film_id FROM film ORDER BY replacement_cost DESC LIMIT 1;

-- 4. ¿Cuántos actores están asociados con la película cuyo título es "ACADEMY DINOSAUR"?
SELECT COUNT(*) 
FROM film_actor 
WHERE film_id = (SELECT film_id FROM film WHERE title = 'ACADEMY DINOSAUR');

-- 5. ¿Cuáles son los primeros 5 títulos de películas con una clasificación de "PG"?
SELECT title FROM film WHERE rating = 'PG' ORDER BY title LIMIT 5;

-- 6. ¿Qué director tiene más películas en la base de datos?
-- No hay tabla "director" en Sakila. Se asume que es una confusión. Se omite.

-- 7. ¿Cuántas películas tienen un alquiler con un costo superior a 3.50?
SELECT COUNT(*) FROM film WHERE rental_rate > 3.50;

-- 8. ¿Cuál es el título de la película con el ID más bajo?
SELECT title FROM film ORDER BY film_id ASC LIMIT 1;

-- 9. ¿Cuántas películas en total están disponibles para alquilar en la tienda?
SELECT COUNT(DISTINCT film_id) FROM inventory;

-- 10. ¿Cuál es la duración promedio de las películas en la tabla film?
SELECT ROUND(AVG(length), 2) AS duracion_promedio FROM film;

-- 11. ¿Qué actor tiene más películas asociadas a él en la tabla film_actor?
SELECT actor_id, COUNT(*) AS cantidad
FROM film_actor
GROUP BY actor_id
ORDER BY cantidad DESC
LIMIT 1;

-- 12. ¿Cuáles son los 10 títulos de películas con la mayor duración?
SELECT title, length FROM film ORDER BY length DESC LIMIT 10;

-- 13. ¿Cuál es la clasificación más común entre las películas?
SELECT rating, COUNT(*) AS cantidad
FROM film
GROUP BY rating
ORDER BY cantidad DESC
LIMIT 1;

-- 14. ¿Qué idioma se utiliza con mayor frecuencia en las películas?
SELECT language_id, COUNT(*) AS cantidad
FROM film
GROUP BY language_id
ORDER BY cantidad DESC
LIMIT 1;

-- 15. ¿Cuántas películas fueron estrenadas en el año 2005?
SELECT COUNT(*) FROM film WHERE release_year = 2005;

-- 16. ¿Cuántas películas tienen una clasificación de "R" y un costo de alquiler superior a 4.00?
SELECT COUNT(*) FROM film WHERE rating = 'R' AND rental_rate > 4.00;

-- 17. ¿Qué película tiene el precio de alquiler más bajo?
SELECT title FROM film ORDER BY rental_rate ASC LIMIT 1;

-- 18. ¿Cuál es el actor con más películas en la tabla film_actor?
SELECT actor_id, COUNT(*) AS cantidad
FROM film_actor
GROUP BY actor_id
ORDER BY cantidad DESC
LIMIT 1;

-- 19. ¿Cuáles son los 3 títulos de películas que tienen la mayor cantidad de copias disponibles en inventario?
SELECT f.title, COUNT(*) AS copias
FROM inventory i
JOIN film f ON i.film_id = f.film_id
GROUP BY i.film_id
ORDER BY copias DESC
LIMIT 3;

-- 20. ¿Cuáles son los 5 actores más comunes en las películas de la categoría "Action"?
SELECT fa.actor_id, COUNT(*) AS cantidad
FROM film_actor fa
JOIN film_category fc ON fa.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Action'
GROUP BY fa.actor_id
ORDER BY cantidad DESC
LIMIT 5;

-- 21. ¿Cuántas películas están catalogadas como "Drama" y tienen una duración superior a 120 minutos?
SELECT COUNT(*)
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Drama' AND f.length > 120;

-- 22. ¿Cuántas películas fueron estrenadas antes del 1 de enero de 2000?
SELECT COUNT(*) FROM film WHERE release_year < 2000;

-- 23. ¿Cuál es el costo promedio de alquiler de todas las películas?
SELECT ROUND(AVG(rental_rate), 2) FROM film;

-- 24. ¿Qué película tiene el mayor precio de compra?
SELECT title FROM film ORDER BY replacement_cost DESC LIMIT 1;

-- 25. ¿Cuántos actores participaron en la película con el título "CHAMPION"?
SELECT COUNT(*)
FROM film_actor
WHERE film_id = (SELECT film_id FROM film WHERE title = 'CHAMPION');

-- 26. ¿Cuál es la película más reciente en la base de datos?
SELECT title, release_year FROM film ORDER BY release_year DESC LIMIT 1;

-- 27. ¿Cuál es el precio promedio de las películas en la categoría "Action"?
SELECT ROUND(AVG(f.rental_rate), 2)
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Action';

-- 28. ¿Cuáles son los 10 primeros títulos de películas cuyo título empieza con la letra "S"?
SELECT title FROM film WHERE title LIKE 'S%' ORDER BY title LIMIT 10;

-- 29. ¿Cuáles son las 5 películas que tienen la menor duración y están disponibles para alquilar?
SELECT DISTINCT f.title, f.length
FROM film f
JOIN inventory i ON f.film_id = i.film_id
ORDER BY f.length ASC
LIMIT 5;

-- 30. ¿Cuál es la película con más copias en inventario?
SELECT f.title, COUNT(*) AS copias
FROM inventory i
JOIN film f ON i.film_id = f.film_id
GROUP BY f.film_id
ORDER BY copias DESC
LIMIT 1;
```
