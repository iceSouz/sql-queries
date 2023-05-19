-- Завдання №3 - знайти працівника з найбільшою заробітною платою --

SELECT name, salary FROM worker
WHERE salary = (
	SELECT MAX(salary) FROM worker
);