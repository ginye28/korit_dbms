-- 📋 상황
-- 두 가지 조회가 필요합니다.
-- ① 단 한 번도 예약하지 않은 환자 명단 (LEFT JOIN 활용)
-- ② 예약이 없는 의사도 포함한 의사별 총 예약 건수

-- 💻 미완성 쿼리
-- sql-- ① 예약 이력 없는 환자

SELECT p.patient_id, p.name, p.phone
FROM patients p
left JOIN appointments a
    ON p.patient_id = a.patient_id
WHERE a.appt_id is NULL;

-- ② 예약 없는 의사도 포함한 의사별 예약 건수
SELECT d.name AS 의사명, d.specialty AS 진료과,
       COUNT(a.appt_id) AS 예약건수
FROM doctors d
left JOIN appointments a
    ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.name, d.specialty;