-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/hHGMPi
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE Department (
    dept_no varchar NOT NULL,
    dept_name varchar NOT NULL,
    PRIMARY KEY (dept_no) 
);

CREATE TABLE Employee_Department (
    emp_no integer NOT NULL,
    dept_no varchar NOT NULL 
);

CREATE TABLE Department_Manager (
    dept_no varchar NOT NULL,
    emp_no integer NOT NULL
);

CREATE TABLE Employees (
    emp_no integer NOT NULL,
    emp_title_id varchar NOT NULL,
    birth_date date NOT NULL,
    first_name varchar NOT NULL,
	last_name varchar not null,
    sex varchar NOT NULL,
    hire_date date NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE Salaries (
    emp_no integer NOT NULL,
    salary integer NOT NULL
);

CREATE TABLE Titles (
    title_id varchar NOT NULL,
    title varchar NOT NULL,
    PRIMARY KEY (title_id)
);

ALTER TABLE Employee_Department 
ADD FOREIGN KEY(emp_no) REFERENCES Employees (emp_no);

ALTER TABLE Employee_Department
ADD FOREIGN KEY(dept_no) REFERENCES Department (dept_no);

ALTER TABLE Department_Manager 
ADD FOREIGN KEY(dept_no) REFERENCES Department (dept_no);

ALTER TABLE Department_Manager 
ADD FOREIGN KEY(emp_no) REFERENCES Employees (emp_no);

ALTER TABLE Employees 
ADD FOREIGN KEY(emp_title_id) REFERENCES Titles (title_id);

ALTER TABLE Salaries 
ADD FOREIGN KEY(emp_no) REFERENCES Employees (emp_no);

