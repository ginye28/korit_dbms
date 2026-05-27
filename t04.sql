-- 📋 상황
-- 자주 조회하는 appointments.patient_id 컬럼에 인덱스를 추가하고,
-- medical_records 테이블 구조를 데이터 없이 복사한 백업 테이블을 만들어야 합니다.
-- 불필요한 idx_old 인덱스도 삭제해야 합니다.


-- 💻 미완성 쿼리
-- sql-- 인덱스 생성

create INDEX idx_appt_patient
    ON appointments (patient_id);

-- 인덱스 삭제
drop INDEX idx_old ON appointments;

-- 구조만 복사 (데이터 제외)
CREATE TABLE medical_records_backup
    as SELECT * FROM medical_records
    WHERE 1=2;

-- 테이블 구조 확인
show index from medical_records_backup;