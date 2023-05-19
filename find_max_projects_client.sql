-- Завдання №4 - знайти клієнта з найбільшою кількістю проєктів --

SELECT c.name, count(p.id) AS project_count FROM project p
JOIN client c ON c.id = client_id
GROUP BY client_id, c.name
HAVING count(p.id) = (
	SELECT count(p.id) FROM project p
	GROUP BY client_id
	ORDER BY count(p.id) DESC
	LIMIT 1
);