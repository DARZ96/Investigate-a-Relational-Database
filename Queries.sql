/* What is the percentage of rentals per category? */

SELECT  f.title AS film_title, c.name AS category_name, COUNT(*) AS count_rentals
  FROM  film AS f
  JOIN  film_category AS fc
    ON  f.film_id = fc.film_id
  JOIN  category AS c
    ON  fc.category_id = c.category_id
  JOIN  inventory AS i
    ON  f.film_id = i.film_id
  JOIN  rental AS r
    ON  i.inventory_id = r.inventory_id
 WHERE  c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
 GROUP  BY 1, 2
 ORDER  BY 2

/* What is the average rental duration per film category? */

WITH t1 AS (
            SELECT  f.title AS film_title, c.name AS category_name, f.rental_duration AS rental_duration,
                     NTILE(4) OVER (ORDER BY f.rental_duration) AS quartiles
              FROM  film AS f
              JOIN  film_category AS fc
                ON  f.film_id = fc.film_id
              JOIN  category AS c
                ON  fc.category_id = c.category_id
             WHERE  c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music'))

SELECT  category_name, quartiles, COUNT(film_title)
  FROM  t1
 GROUP  BY  1, 2
 ORDER  BY  1, 2

/* How do the two stores compare in rental orders during every month for all the years we have data for? */

SELECT  DATE_PART('year', r.rental_date) AS rental_year,
        DATE_PART('month', r.rental_date) AS rental_month,
        s.store_id, COUNT(*)
  FROM  store AS s
  JOIN  staff AS sf
    ON  s.store_id = sf.store_id
  JOIN  rental AS r
    ON  sf.staff_id = r.staff_id
 GROUP  BY 1, 2, 3
 ORDER  BY 4 DESC

/* What is the evolution of our customer payments on a month to month basis? */

WITH top_10 AS (
                SELECT  c.customer_id AS customer_id, c.first_name||' '||c.last_name AS full_name,
                        SUM(p.amount) AS pay_amount
                  FROM  customer AS c
                  JOIN  payment AS p
                    ON  c.customer_id = p.customer_id
                 GROUP  BY 1, 2
                 ORDER  BY 3 DESC
                 LIMIT  10),

          t2 AS (
                  SELECT  DATE_TRUNC('month', p.payment_date) AS pay_month,
                          full_name, COUNT(*) pay_count_per_month, SUM(p.amount) AS pay_amount
                    FROM  top_10
                    JOIN  payment AS p
                      ON  top_10.customer_id = p.customer_id
                   GROUP  BY 1, 2
                   ORDER  BY 2, 1)

SELECT  t2.pay_month, t2.full_name, t2.pay_count_per_month, t2.pay_amount,
        LEAD(t2.pay_amount) OVER (PARTITION BY t2.full_name ) AS lead,
        LEAD(t2.pay_amount) OVER (PARTITION BY t2.full_name ) - t2.pay_amount AS lead_difference
  FROM  t2
 ORDER  BY 2, 1
