-- 📋 상황
-- 두 가지 분석이 필요합니다.
-- ① 평균 진료비보다 높은 진료 기록의 환자명과 진료비 조회 (WHERE절 서브쿼리)
-- ② 내과 의사가 담당한 예약 건만 조회 (IN 서브쿼리)

-- 💻 미완성 쿼리
-- sql-- ① 평균 진료비 초과 환자 조회

SELECT p.name AS 환자명, mr.fee AS 진료비
FROM medical_records mr
INNER JOIN appointments a ON mr.appt_id    = a.appt_id
INNER JOIN patients     p ON a.patient_id  = p.patient_id
WHERE mr.fee > (
    select max(fee)
    FROM medical_records
)
ORDER BY mr.fee desc;

-- ② 내과 의사 담당 예약 조회
SELECT appt_id, patient_id, doctor_id, appt_date
FROM appointments
WHERE doctor_id in (
    SELECT doctor_id FROM doctors
    WHERE specialty = medical_records
);