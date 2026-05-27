-- 📋 상황
-- 자주 쓰는 예약 현황 조회 쿼리를 뷰(VIEW)로 저장하고,
-- 사용하지 않는 임시 테이블은 오류 없이 삭제해야 합니다.
-- 뷰는 같은 이름이 존재해도 덮어쓸 수 있어야 합니다.


-- 💻 미완성 쿼리
-- sql-- 뷰 생성 (기존 뷰가 있어도 덮어쓰기)

create OR replace VIEW vw_appt_summary AS
    SELECT
        p.name      AS 환자명,
        d.name      AS 의사명,
        a.appt_date AS 예약일시,
        a.status    AS 상태
    FROM appointments a
    INNER JOIN patients p ON a.patient_id = p.patient_id
    INNER JOIN doctors  d ON a.doctor_id  = d.doctor_id;

-- 임시 테이블 안전 삭제 (없어도 오류 미발생)
drop temporary TABLE if exists temp_schedule;

-- 뷰 목록 확인
show FULL TABLES IN hospital_db WHERE Table_type = 'VIEW';