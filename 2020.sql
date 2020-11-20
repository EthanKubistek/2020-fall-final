

CREATE DATABASE  IF NOT EXISTS 2020project;
USE 2020project;

/* dropping existing tables*/

DROP TABLE IF EXISTS Users;

DROP TABLE IF EXISTS Role;

DROP TABLE IF EXISTS Employess;

DROP TABLE IF EXISTS Patient;

DROP TABLE IF EXISTS Checklist;

DROP TABLE IF EXISTS Appointments;


CREATE TABLE Users (
    User_id int NOT NULL PRIMARY KEY,
    FirstName varchar(255) NOT NULL,
    LastName varchar(255) NOT NULL,
    email varchar(255),
    Address varchar(255),
    Phone varchar(255),
    Password varchar(255),
    DOB varchar(255),
    Role int NOT NULL,
    FOREIGN KEY (Role)
      REFERENCES Role(Role_id)
      ON DELETE CASCADE
);

/* Table of the user roles*/

CREATE TABLE Role (
    Role_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Role_name varchar(255) NOT NULL,
    access_lvl int NOT NULL,

    Unique(Role_name)
);
/* Table to list the Employess on staff*/

CREATE TABLE Employess (
    employee_id int NOT NULL PRIMARY KEY,
    salary int,
    group_id int NOT NULL,
    FOREIGN KEY (employee_id)
      REFERENCES Users(User_id)
      ON DELETE CASCADE


);

CREATE TABLE Patient (
    Patient_id int NOT NULL PRIMARY KEY,
    family_code int NOT NULL,
    emergency_contact varchar(255) NOT NULL,
    relation_to_ec varchar(255) NOT NULL,
    group_id varchar(255) NOT NULL,
    admit_date DATE,
    FOREIGN KEY (Patient_id)
      REFERENCES Users(User_id)
      ON DELETE CASCADE
);

CREATE TABLE Checklist (
    List_id int AUTO_INCREMENT PRIMARY KEY,
    list_date date NOT NULL,
    morn_med BOOLEAN NOT NULL,
    night_med BOOLEAN NOT NULL,
    afternoon_med BOOLEAN NOT NULL,
    night_med BOOLEAN NOT NULL,
    breakfast BOOLEAN NOT NULL,
    lunch BOOLEAN NOT NULL,
    dinner BOOLEAN NOT NULL,
    FOREIGN KEY (Patient_id)
    REFERENCES Users(User_id)
    ON DELETE CASCADE,
    FOREIGN KEY (employee_id)
      REFERENCES Users(User_id)
      ON DELETE CASCADE
);

CREATE TABLE Appointments (
    appt_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appt_date DATE NOT NULL,
    comment TEXT,
    morn_med VARCHAR(255),
    afternoon_med VARCHAR(255),
    night_med VARCHAR(255),
    FOREIGN KEY (Patient_id)
      REFERENCES Users(User_id)
      ON DELETE CASCADE,

    FOREIGN KEY (employee_id)
      REFERENCES Users(User_id)
      ON DELETE CASCADE
);

CREATE TABLE roster (
  roster_date DATE PRIMARY KEY,
  doctor_id int NOT NULL,
  supervisor_id int NOT NULL,
  care_one_id int NOT NULL,
  care_one_group smallint NOT NULL,
  care_two_id int NOT NULL,
  care_two_group smallint NOT NULL,
  care_three_id int NOT NULL,
  care_three_group smallint NOT NULL,
  care_four_id int NOT NULL,
  care_four_group smallint NOT NULL,

  FOREIGN KEY (supervisor_id)
    REFERENCES Users (user_id)
    ON DELETE CASCADE,

  FOREIGN KEY (doctor_id)
    REFERENCES Users (user_id)
    ON DELETE CASCADE,

  FOREIGN KEY (care_one_id)
    REFERENCES Users (user_id)
    ON DELETE CASCADE,

  FOREIGN KEY (care_two_id)
    REFERENCES Users (user_id)
    ON DELETE CASCADE,

  FOREIGN KEY (care_three_id)
    REFERENCES Users (user_id)
    ON DELETE CASCADE,

  FOREIGN KEY (care_four_id)
    REFERENCES Users (user_id)
    ON DELETE CASCADE
);
