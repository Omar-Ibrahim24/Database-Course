
CREATE TABLE department (
  Dnumber int NOT NULL,
  Dname varchar(255) NOT NULL,
  mgr_ssn int NOT NULL,
  mgr_start_date date DEFAULT NULL
) 


CREATE TABLE employee (
  ssn int NOT NULL,
  fname varchar(255) NOT NULL,
  lname varchar(255) NOT NULL,
  bdate date DEFAULT NULL,
  address varchar(255) DEFAULT NULL,
  gender varchar(255) DEFAULT NULL,
  salary float DEFAULT NULL,
  Dno int NOT NULL
) 


CREATE TABLE project (
  Pnumber int NOT NULL,
  Pname varchar(255) NOT NULL,
  Plocation varchar(255) DEFAULT NULL,
  Dno int DEFAULT NULL
) 



ALTER TABLE department
  ADD PRIMARY KEY (Dnumber);


ALTER TABLE employee
  ADD PRIMARY KEY (ssn);


ALTER TABLE project
  ADD PRIMARY KEY (Pnumber);



ALTER TABLE department
  ADD  FOREIGN KEY (mgr_ssn) REFERENCES employee (ssn);

ALTER TABLE employee
  ADD  FOREIGN KEY (Dno) REFERENCES department (Dnumber);


ALTER TABLE project
  ADD  FOREIGN KEY (Dno) REFERENCES department (Dnumber);
