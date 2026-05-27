create database hospital_db;
USE hospital_db;

-- 환자 테이블 생성
CREATE TABLE patients (
    patient_id  INT           primary key AUTO_INCREMENT,
    name        VARCHAR(50)   NOT NULL,
    phone       VARCHAR(20)   UNIQUE,
    birth_date  timestamp 	  default current_timestamp,
    primary key (patient_id)
);