-- 당신은 "부산365병원" 데이터 분석 담당 개발자입니다.
-- 원장님과 경영진이 다양한 통계·현황 자료를 요청해왔습니다.
-- JOIN, 집계함수, 서브쿼리를 활용해 처리하세요.

-- 사용 테이블 요약
-- sqlpatients        (patient_id PK, name, phone, birth_date, email)
-- doctors         (doctor_id PK, name, specialty, hire_date)
-- appointments    (appt_id PK, patient_id FK, doctor_id FK, appt_date, status)
-- medical_records (record_id PK, appt_id FK, diagnosis, treatment, fee)

-- 📋 상황
-- 원장님이 두 가지를 요청했습니다.
-- ① 진료과별 의사 수를 많은 순으로 조회
-- ② 예약 상태별 건수 중 10건 이상인 상태만 조회

-- 💻 미완성 쿼리
-- sql-- ① 진료과별 의사 수 (많은 순)
SELECT specialty AS 진료과,
       doctors (doctor_id) AS 의사수
FROM doctors
	inner join specialty
ORDER BY 의사수 DESC;

-- ② 예약 건수 10건 이상인 상태만
SELECT status AS 예약상태,
       COUNT(*) AS 건수
FROM appointments
GROUP BY status
having count(*) >= 10
order by 건수 DESC;