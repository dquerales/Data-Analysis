use sakila;

select fm.title, cat.name, dt.countofcategory
from film fm
inner join film_category fc on fc.film_id = fm.film_id
inner join category cat on cat.category_id = fc.category_id
inner join (
	select count(*) as countofcategory, fc.category_id
    from film_category fc
    group by fc.category_id) dt on dt.category_id = fc.category_id;