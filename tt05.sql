-- 📋 상황
-- 원장님의 최종 요청입니다.
-- ① 월별 예약 건수 추이 조회 (날짜 함수 활용)
-- ② 진료과별 평균 진료비 TOP 3 조회 (FROM절 서브쿼리 활용)

-- 💻 미완성 쿼리
-- sql-- ① 월별 예약 건수

SELECT
    date_format(appt_date, '&Y-%m') AS 연월,
    COUNT(*) AS 예약건수
FROM appointments
group by 연월
ORDER BY 연월 ASC;

-- ② 진료과별 평균 진료비 TOP 3
SELECT 진료과, 평균진료비
FROM (
    SELECT
        d.specialty        AS 진료과,
        count(mr.fee) AS 평균진료비
    FROM medical_records mr
    INNER JOIN appointments a ON mr.appt_id  = a.appt_id
    INNER JOIN doctors      d ON a.doctor_id = d.doctor_id
    GROUP BY d.specialty
) as 집계결과
ORDER BY 평균진료비 DESC
LIMIT 3;

from은 실제 테이블이 아니라 이름 없는 임시 테이블이기 때문에 sql이 참조하기 위해서 식별할 수 있는 이름이 필요하기 때문