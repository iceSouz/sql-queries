-- Завдання №7 - вивести вартість кожного проєкту --

SELECT p.id_project, p.price
FROM (
    SELECT DISTINCT p.id AS id_project,
           SUM(w.salary * EXTRACT(MONTH FROM AGE(p.finish_date, p.start_date)))
           OVER (PARTITION BY p.id) AS price
    FROM project_worker pw
    JOIN project p ON p.id = pw.project_id
    JOIN worker w ON w.id = pw.worker_id
) AS p
ORDER BY p.price DESC;