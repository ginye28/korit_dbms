-- 의사 테이블 doctors와 예약 테이블 appointments를 만들어야 합니다.
-- appointments의 patient_id, doctor_id는 각각 부모 테이블을 참조하며,
-- 부모 레코드 삭제 시 예약도 함께 삭제되어야 합니다.

CREATE TABLE doctors (
    doctor_id  INT          PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(50)  NOT NULL,
    specialty  VARCHAR(50)  NOT NULL,
    hire_date  DATE         DEFAULT (CURDATE())
);

CREATE TABLE appointments (
    appt_id    INT      PRIMARY KEY AUTO_INCREMENT,
    patient_id INT      NOT NULL,
    doctor_id  INT      NOT NULL,
    appt_date  DATETIME NOT NULL,
    status     VARCHAR(20) DEFAULT '예약대기',
    constraint fk_patient FOREIGN KEY (patient_id)
        references patients(patient_id)
        ON DELETE cascade,
    CONSTRAINT fk_doctor FOREIGN KEY (doctor_id)
        REFERENCES doctors(doctor_id)
        ON DELETE cascade
);