-- patients 테이블에 email 컬럼을 추가하고, phone 컬럼 타입을 변경해야 합니다.
-- 또한 status 값을 제한하는 CHECK 제약조건도 appointments에 추가해야 합니다.

-- email 컬럼 추가 (VARCHAR 100, UNIQUE)-- 
ALTER TABLE patients
    add column email VARCHAR(100) UNIQUE;

-- phone 컬럼 타입을 CHAR(11)로 변경
ALTER TABLE patients
    modify column phone VARCHAR(11);

-- CHECK 제약조건 추가
ALTER TABLE appointments
    ADD constraint chk_status
    CHECK (status in ('예약대기', '진료완료', '예약취소'));