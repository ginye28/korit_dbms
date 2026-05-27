-- 📋 상황
-- 경영팀이 "예약 목록에서 환자 이름과 담당 의사 이름을 함께 보고 싶다"고 했습니다.
-- 3개 테이블을 JOIN하여 예약일시 최신순으로 조회하세요.

-- 💻 미완성 쿼리
-- sql
SELECT
    a.appt_id   AS 예약번호,
    p.name      AS 환자명,
    d.name      AS 의사명,
    a.appt_date AS 예약일시,
    a.status    AS 상태
FROM appointments as a
inner JOIN patients as p
    ON a.patient_id = p.patient_id
inner JOIN doctors d
    ON a.doctor_id = d.doctor_id
ORDER BY a.appt_date desc;