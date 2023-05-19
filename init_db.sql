-- Завдання №1 - спроєктувати БД --

CREATE TABLE worker (
	id SERIAL PRIMARY KEY,
	name VARCHAR(1000) NOT NULL CHECK (LENGTH(name) > 1),
	birthday DATE CHECK (EXTRACT(YEAR FROM birthday) > 1900),
	level VARCHAR(10) NOT NULL CHECK(level IN('Trainee', 'Junior', 'Middle', 'Senior')),
	salary INT CHECK (salary >= 100 AND salary <= 100000)
);

COMMENT ON COLUMN worker.salary IS 'Salary for 1 month';

CREATE TABLE client (
	id SERIAL PRIMARY KEY,
	name VARCHAR(1000) NOT NULL CHECK (LENGTH(name) > 1)
);

CREATE TABLE project (
	id SERIAL PRIMARY KEY,
	client_id BIGINT,
	start_date DATE,
	finish_date DATE,
	FOREIGN KEY(client_id)
	REFERENCES client(id) ON DELETE CASCADE,
	CHECK (start_date < finish_date)
);

CREATE TABLE project_worker (
	project_id BIGINT,
	worker_id BIGINT,
	PRIMARY KEY(project_id, worker_id),
	FOREIGN KEY(project_id)
	REFERENCES project(id) ON DELETE CASCADE,
	FOREIGN KEY(worker_id)
	REFERENCES worker(id) ON DELETE CASCADE
);