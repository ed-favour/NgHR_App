-- Drop the department table
DROP TABLE IF EXISTS department CASCADE;
-- Create the department table
CREATE TABLE department (
  id SERIAL PRIMARY KEY,
  department_name VARCHAR(255)
);
-- Example department data
INSERT INTO department (department_name) VALUES
('Technolgy'),
('Customer care'),
('Network'),
('Accounting'),
('Human Resources'),
('Digital Marketing'),
('Busniess Development') ;

-- Drop the job_position table
DROP TABLE IF EXISTS job_position CASCADE;
-- Create the job_position table
CREATE TABLE job_position (
  id SERIAL PRIMARY KEY,
  position_name VARCHAR(255)
);
-- Example job_position data
INSERT INTO job_position (position_name) VALUES
('Manager'),
('Software Developer'),
('Accountant'),
('Analyst'),
('Intern'),
('Marketing Specialist');

-- Drop the payroll table
DROP TABLE IF EXISTS payroll CASCADE;
-- Create the payroll table
CREATE TABLE payroll (
  id SERIAL PRIMARY KEY,
  hourly BOOLEAN,
  monthly BOOLEAN
);
-- Example payroll data
INSERT INTO payroll (hourly, monthly) VALUES
(false, true),
(true, false),

-- Drop the leave table
DROP TABLE IF EXISTS leave CASCADE;
-- Create the leave table
CREATE TABLE leave (
  id SERIAL PRIMARY KEY
);
-- Example leave data
INSERT INTO leave DEFAULT VALUES;

-- Drop the training_session table
DROP TABLE IF EXISTS training_session CASCADE;
-- Create the training_session table
CREATE TABLE training_session (
  id SERIAL PRIMARY KEY
);
-- Example training_session data
INSERT INTO training_session DEFAULT VALUES;

-- Drop the attendance table
DROP TABLE IF EXISTS attendance CASCADE;
-- Create the attendance table
CREATE TABLE attendance (
  id SERIAL PRIMARY KEY,
  present BOOLEAN
);
-- Example attendance data
INSERT INTO attendance (present) VALUES
(true, false)

-- Drop the employee table
DROP TABLE IF EXISTS employee CASCADE;
-- Create the employee table
CREATE TABLE employee (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  part_time BOOLEAN,
  full_time BOOLEAN,
  department_id INTEGER,
  FOREIGN KEY (department_id) REFERENCES department (id)
);
-- Example employee data
INSERT INTO employee (first_name, last_name, part_time, full_time, department_id) VALUES
('Favour', 'John', false, true, 1),
('Mark', 'Mary', true, false, 2),
('Steve', 'Pat', false, true, 3),
('Solomon', 'Crown', false, true, 4),
('Peace', 'Matthew', false, true, 5),
('Matter', 'Eze', true, true, 6),
('Edith', 'Mike', true, false, 1),
('Tolu', 'Mary', true, false, 2),
('Steve', 'Oni', true, false, 3),
('Peter', 'Temi', true, false, 4),
('Isaac', 'Matthew', true, false, 5),
('Aliyu', 'Nuhu', true, true, 6);

-- Add foreign key relationships
-- Ref: department.id < employee.id
-- Ref: job_position.id < employee.id
-- Ref: employee.part_time - payroll.hourly
-- Ref: employee.full_time - payroll.monthly
-- Ref: employee.id > leave.id
-- Ref: employee.id <> training_session.id
-- Ref: employee.id > attendance.id

ALTER TABLE employee ADD CONSTRAINT fk_department_id FOREIGN KEY (department_id) REFERENCES department (id);
ALTER TABLE employee ADD CONSTRAINT fk_job_position_id FOREIGN KEY (job_position_id) REFERENCES job_position (id);
ALTER TABLE employee ADD CONSTRAINT fk_payroll_hourly FOREIGN KEY (part_time) REFERENCES payroll (hourly);
ALTER TABLE employee ADD CONSTRAINT fk_payroll_monthly FOREIGN KEY (full_time) REFERENCES payroll (monthly);
ALTER TABLE leave ADD CONSTRAINT fk_employee_id FOREIGN KEY (employee_id) REFERENCES employee (id);
ALTER TABLE training_session ADD CONSTRAINT fk_employee_id FOREIGN KEY (employee_id) REFERENCES employee (id);
ALTER TABLE attendance ADD CONSTRAINT fk_employee_id FOREIGN KEY (employee_id) REFERENCES employee (id);