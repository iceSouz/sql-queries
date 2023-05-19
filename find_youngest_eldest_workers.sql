-- Завдання №6 - знайти найстаршого та наймолодшого працівника --

SELECT 'ELDEST' AS type, name, birthday FROM worker
WHERE birthday = (
	SELECT MIN(birthday) FROM worker
)
UNION
SELECT 'YOUNGEST' AS type, name, birthday FROM worker
WHERE birthday = (
	SELECT MAX(birthday) FROM worker
)
ORDER BY type DESC;