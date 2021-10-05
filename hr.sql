--employees테이블 전체 내용 조회 
select *from employees;

-- employees first_name ,last_name ,job_id  만 조회 
select first_name ,last_name ,job_id from employees;

--emloyee_id가 176인 사람의 LAST_NAME 과 DEPARTMENT_ID조회 
select Last_name ,DEPARTMENT_ID from employees where employee_id = 176;
-->,<,<=,>= 사용 
-- salary 가 12000이상 되는 직원들의 last_name , salary 조회 
select Last_name,salary from employees where salary >=12000 ;
--salary 가 5000~12000범위 이외인 사원들의 last_name , salary 조회 
select Last_name from  employees where   salary <5000 or salary > 12000; 

--20번 및 50번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 DEPARTMENT_ID를 오름차순 조회 
SELECT  LAST_NAME, DEPARTMENT_ID  FROM employees WHERE  DEPARTMENT_ID IN (20, 50) ;

-- COMMISSION_-PCT를 받는 모든 사원들의 LAST_NAME, SALARY, COMMISSION_PCT조회 
--단 , SALARY 내림 차순 ,COMMISSION_PCT내림차순 
select LAST_NAME, SALARY, COMMISSION_PCT from employees where  COMMISSION_PCT > 0 order by SALARY  desc ,
 COMMISSION_PCT desc; 
--SALARY 가 2500,3500,7000이 아니며 JOB_ID가 SA_REP , ST_CLERK인 사원 조회 
select *from employees where salary not in (2500 ,3500,7000) AND JOB_ID in( 'SA_REP' , 'ST_CLERK');

--2008/02/20 ~ 2008/05/01 사이에 고용된 사원들의 LAST_NAME , EMPLOYEE_ID , HIRE_DATE
--조회한다 HIRE_DATE 내림차순으로 조회 
SELECT LAST_NAME , EMPLOYEE_ID , HIRE_DATE FROM employees WHERE HIRE_DATE >='2008-02-20' and  HIRE_DATE <='2008-05-01' order by  HIRE_DATE DESc;

--2004년도에 고용된 모든 사람들의 LAST_NAME ,LAST_NAME ,HIRE_DATE  조회 
--HIRE_DATE 오름차순 정렬 
SELECT LAST_NAME ,HIRE_DATE  FROM employees WHERE  HIRE_DATE >= '2004-01-01'and HIRE_DATE <= '2004-12-31'  order by HIRE_DATE asc;

-------------------------BETWEEN 문제 

--salary 가 5000~12000범위 이외인 사원들의 last_name , salary 조회 
 select last_name , salary from employees where SALARY not between 5000 and 12000;
 
 
 --20번 및 50번 부서에서 근무하며 ,salary 가 5000~12000t사이인 사원들의 LAST_NAME 및 DEPARTMENT_ID를 조회 
 select LAST_NAME,DEPARTMENT_ID from  employees  where DEPARTMENT_ID IN (20,50) AND SALARY between 5000 AND 12000;
 
 --2008/02/20 ~ 2008/05/01 사이에 고용된 사원들의 LAST_NAME , EMPLOYEE_ID , HIRE_DATE
--조회한다 HIRE_DATE 내림차순으로 조회 
 SELECT  LAST_NAME , EMPLOYEE_ID , HIRE_DATE FROM  employees WHERE HIRE_DATE BETWEEN '2008-02-20' AND '2008-05-01'  ORDER BY HIRE_DATE DESC; 
 
 --2004년도에 고용된 모든 사람들의 LAST_NAME ,LAST_NAME ,HIRE_DATE  조회 
--HIRE_DATE 오름차순 정렬 
 SELECT LAST_NAME ,HIRE_DATE FROM  employees WHERE HIRE_DATE BETWEEN '2004-01-01' AND'2004-12-31';
 
 
 ------------------------like 문제
 
 
 
 --like 
 --2004년도에 고용된 모든 사람들의 LAST_NAME ,HIRE_DATE  조회 
--HIRE_DATE 오름차순 정렬 

select LAST_NAME ,HIRE_DATE from employees where hire_date like '04%' order by hire_date;

--last_name 에 u가 포함되는 사원들의 사번 및 last_name 조회(%u% = 앞뒤로 감싸면 어디든 상관없다)
select employee_id,last_name  from employees where last_name like '%u%'; 

--LAST_NAME 의 4번째 들자가 a인 사원들의 last_name 조회
select last_name from employees where last_name like '___a%';

--last_name 에 들자가 a 혹은 e 글자가 들어있는 사원들의 last_name 조회한 후 
--last_name 오름 차순 조회 
 select last_name from employees where last_name like '%a%'or  last_name like '%e%';
 
 --a와 e가 들어있는 글자 찾고 싶을때 
select last_name 
from employees
 where last_name
 like '%a%e%';
---------------------






-- manager_id가 없는 사원들의 last_name, job_id 조회
SELECT
    last_name,
    job_id
FROM
    employees
WHERE
    manager_id IS NULL;

-- job_id가 ST_CLERK 인 사원의 department_id 조회(단, 부서번호가 null인 것 제외)
SELECT DISTINCT
    department_id
FROM
    employees
WHERE
        job_id = 'ST_CLERK'
    AND department_id IS NOT NULL;


-- commission_pct가 null 이 아닌 사원들 중에서 commission = salary * commission_pct 를 구한 후
-- employee_id, first_name, job_id, commission 조회
SELECT
    employee_id,
    first_name,
    job_id,
    salary * commission_pct AS commission
FROM
    employees
WHERE
    commission_pct IS NOT NULL;
    












---------0923

-- first_name이 Curtis인 사람의 first_name,last_name,email,phone_number,job_id 조회
-- 단, job_id 결과는 소문자로 출력한다.

SELECT first_name,last_name,email,phone_number,lower(job_id)
FROM employees
WHERE first_name = 'Curtis';


-- job_id가 AD_PRES, PU_CUERK인 사원들의 EMPLOYEE_ID, FIRST_NAME, LAST_NAME,
-- DEPARTMENT_ID, JOB_ID 조회, 단, 사원명은 FIRST_NAME과 LAST_NAME을 연결하여 출력
SELECT EMPLOYEE_ID, CONCAT(FIRST_NAME, LAST_NAME),DEPARTMENT_ID, JOB_ID
FROM employees
WHERE job_id IN('AD_PRES', 'PU_CUERK');
    
    
SELECT EMPLOYEE_ID, CONCAT(FIRST_NAME,CONCAT(' ', LAST_NAME)),DEPARTMENT_ID, JOB_ID
FROM employees
WHERE job_id IN('AD_PRES', 'PU_CUERK');    
    
    
SELECT EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME,DEPARTMENT_ID, JOB_ID
FROM employees
WHERE job_id IN('AD_PRES', 'PU_CUERK');    



-------------0927

--오라클 문제 21번
-- [실습4] 부서 80의 각 사원에 대해 적용 가능한 세율을 표시하시오.

SELECT LAST_NAME, SALARY, DECODE(TRUNC(salary/2000,0),
                                0, 0.00,
                                1, 0.09,
                                2, 0.20,
                                3, 0.30,
                                4, 0.40,
                                5, 0.42,
                                6, 0.44,
                                0.45) AS TAX_RATE
FROM employees WHERE department_id=80;



---0928


-- 사원들의 최대급여와 최소 급여의 차이를 조회
SELECT MAX(salary) - MIN(salary) AS GAP FROM employees;

-- 매니저로 근무하는 사원들의 총 수 조회(단, MAMAGER_ID 중복 제거)
SELECT COUNT(DISTINCT MANAGER_ID) FROM employees;


-- 문1] 자신의 담당 매니저의 고용일보다 빠른 입사자 찾기(employees self join)
select *
from employees e1, employees e2
where e1.manager_id = e2.employee_id and e1.hire_date < e2.hire_date;


select *
from employees e1 join employees e2 on e1.manager_id = e2.employee_id
 and e1.hire_date < e2.hire_date;


-- 문2] 도시 이름이 T로 시작하는 지역에 사는 사원들의 사번,last_name,부서번호 조회
-- employees, departments 테이블 연결, locations 테이블 연결


select employee_id, last_name, e.department_id
from employees e, departments d,locations l
where e.department_id = d.department_id and d.location_id = l.location_id and city like 'T%';


-- 문3] 위치 id가 1700인 사원들의 last_name,부서번호, 연봉 조회
-- employees, departments 테이블 연결

select *from employees;
select *from departments;
select *from locations;



select last_name, e.department_id, e.salary
from employees e, departments d
where e.department_id = d.department_id and location_id = 1700;



-- 문4] Executive 부서에 근무하는 모든 사원들의 부서번호, last_name, job_id 조회
-- employees, department 테이블 연결

select last_name, e.department_id, e.job_id
from employees e, departments d
where e.department_id = d.department_id and d.department_name = 'Executive';


--LAST_NAME 에 u가 포함되는 사원들과동일 부서에 근무하는 사원들의 
--사번 및 LAST_NAME조회

 SELECT employee_id ,last_name 
 from employees
 where department_id in(select distinct department_id from employees where last_name like '%u%' );
 
 
 
 
 
 ---------1005
 
 CREATE TABLE INDEXTBL AS SELECT DISTINCT FIRST_NAME ,LAST_NAME ,HIRE_DATE FROM EMPLOYEES;
 
 SELECT *FROM INDEXTBL;
 
 --인덱스 생성 전 검색 방식 : full
 SELECT *FROM INDEXTBL where FIRST_NAME = 'Jack';
 
 --인덱스 생성
 create index idx_indextbl_firstname on indextbl(first_name);
 
 --인덱스 생성 후 검색 방식: index 검색(range scan)
  SELECT *FROM INDEXTBL where FIRST_NAME = 'Jack';
  
  
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 