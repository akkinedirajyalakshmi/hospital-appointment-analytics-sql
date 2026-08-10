EXEC sp_help Patients;
EXEC sp_columns Patients;
EXEC SP_COLUMNS  DOCTORS;
EXEC SP_COLUMNS appointments;
SELECT * FROM appointments;
select * from doctors;

SELECT * FROM appointments WHERE DEPARTMENT='Neurology';

select * from patients where age between 40 and 60  order by  age DESC;
 
 select * from appointments where status ='No-Show';

 select * from doctors where years_experience>=20 order by years_experience ;

 select * from appointments where lead_time_days=0;

 select * from patients where city='Gachibowli' order by patient_id;

select * from appointments where appointment_type not in('Emergency');

select * from patients where insurance_type in ('Private','Government');

select replace(doctor_name,'DR.','') SURNAME ,doctors.* from doctors;

SELECT year(appointment_date) Yearofjoining, MONTH(appointment_date),day(appointment_date) from appointments;

select count(*),year(appointment_date) years from appointments group by year(appointment_date);

select department,count(appointment_id) total_appointments from appointments 
group by department having count(appointment_id)>1000;

select  department,count(appointment_id) total_appointments, status from appointments 
group by department,status;

select department,count(appointment_id) total_appointments,count(case when status='No-Show' then 1 end) no_shows, 
count ( case 
when status = 'NO-Show'
then 1 end)*count(appointment_id)  as no_show_rate 
from appointments group by department;

select appointment_type,count(appointment_id) total_appointment,AVG(lead_time_days),avg( distance_km) from appointments join patients
on appointments.patient_id=patients.patient_id group by appointment_type;


select   doctor_id,count(appointment_id),count(
case when status='No-Show' then 1 end) no_shows,
count(case when status='Cancelled' then 1 end) total_cancelled
from  appointments GROUP BY doctor_id;

select count(patient_id),avg(age), count(distinct(insurance_type)) as insurance_segmnet,city
from patients group  by city;

select min(appointment_date) earlisetdate,max(appointment_date) oldestdatest,department
from appointments group by department;
 
select count(appointment_id)total_appoinments,count(distinct(patient_id)) patient,
year(appointment_date) appointment_year from appointments group by year(appointment_date);

select count(appointment_id) total_appointments, month(appointment_date)months  from appointments group by month(appointment_date) 
order by month(appointment_date);

select  (case  
                           when age>=45 then 'Senior'
                           when age>=15 then 'Adult'
                           else 'Child'
                           end) agebucket,
                           count(*) totalappointments,
count(case when status='No-Show' then 1 end) no_shows,count ( case 
when status = 'NO-Show'
then 1 end)*count(appointment_id)  as no_show_rate 
from appointments join patients on appointments.patient_id=patients.patient_id group by (case  
                           when age>=45 then 'Senior'
                           when age>=15 then 'Adult'
                           else 'Child'
                           end) ; 

select count(*) totalappointments, doctors.department from doctors join appointments 
on doctors.department=appointments.department group by doctors.department;

select round(count(case 
when status = 'NO-Show'
then 1 end)* 100 /count(appointment_id),2)as no_show_rate,doctors.department from doctors join appointments 
on doctors.department=appointments.department group by doctors.department;  

select doctors.doctor_id,doctors.avg_consult_minutes * count(appointments.appointment_id) revenue from doctors 
join appointments on doctors.doctor_id=appointments.doctor_id group by doctors.doctor_id,doctors.avg_consult_minutes order by 
doctors.doctor_id ;

select department,count( case 
when status='No-Show' then 1 end ) from appointments group by department order by count( case 
when status='No-Show' then 1 end ) desc;

select department,count(distinct(doctor_id))distinctdoctors,
count(distinct(appointment_type))distinctappointments from appointments 
group by department;

select appointments.* from appointments where lead_time_days>10 and appointment_type not in('Emergency')
and status ='Completed' order by appointment_id;

select patients.*  from patients where age between 30 and 60 and  
city in ('Gachibowli','Uppal','Secunderabad') order by age desc,distance_km asc; 

select doctors.* from doctors where doctor_name like '%Guptha%' or 
doctor_name like '%Mehta%'
order by doctor_name ;

select appointments.* from appointments where lead_time_days>5 and status='Cancelled'
order by lead_time_days desc;

select  appointments.* from appointments 
where year(appointment_date) in ('2025') and status in('Cancelled','No-Show')
order by  appointment_date desc;

select patients.* from patients where age >50 and 
insurance_type in ('Private','Government')
and distance_km>10 order by distance_km desc;

select count(appointment_id)total_appointments,count(
case when status='Completed' then 1 end) total_completed,
count(case when status='Cancelled' then 1 end) total_cancelled,
count(case when status='No-Show' then 1 end)total_noshow,department
from appointments  group by department having  count(*)>500;

select count(appointment_id) total_appointments,doctor_id from appointments
group by doctor_id having count(*)>100 order by count(appointment_id) desc;

select count(appointment_id) total_appoitments,department from appointments
group by department having count(appointment_id)>1850 
order by count(appointment_id) desc;

select patient_id ,count(appointment_id) total_appointment 
from appointments
group by patient_id having count(appointment_id)>3 
order by count(appointment_id)desc ;

select count(appointment_id) totalappointments,count(
case when status='No-Show' then 1 end)totalnoshows,department from appointments
group by department having count(
case when status='No-Show' then 1 end)>=50;


SELECT DISTINCT
    department,
    doctor_id,
    patient_id,
    appointment_type
FROM appointments
WHERE department IN (
    SELECT department
    FROM appointments
    GROUP BY department
    HAVING COUNT(DISTINCT appointment_type) > 3
);

select count(*) total_appointment,department,
count(case when status='No-Show' then 1 end) totalno_shows,
round(count(case when status='No-Show' then 1 end)*100/count(*),2) no_showrate
from appointments group by department 
having  round(count(case when status='No-Show' then 1 end)*100/count(*),2)>10
order by round(count(case when status='No-Show' then 1 end)*100/count(*),2) desc;


select count(*) total_appointments,department,
count(case when status='Completed' then 1 end)as completed_appointments,
round(count(case when status='Completed' then 1 end)*100/count(*),2) completed_percentage
from appointments group by department 
having round(count(case when status='Completed' then 1 end)*100/count(*),2) >70
order by round(count(case when status='Completed' then 1 end)*100/count(*),2) 
desc;


select count(*)total_appointments,department,
round(count(case when status='Completed' then 1 end)*100/count(*),2) completed,
round(count(case when status='Cancelled' then 1 end)*100/count(*),2) cancelled,
round(count(case when status='No-Show' then 1 end)*100/count(*),2) no_show
from appointments group by department;

select count(*)total_appointments,
case 
when lead_time_days>=35 then ' Very long'
when lead_time_days>=30 then 'Long'
when lead_time_days>=15 then 'Medium'
ELSE 'Short' end as category,
department
from appointments 
group by department,case 
when lead_time_days>=35 then ' Very long'
when lead_time_days>=30 then 'Long'
when lead_time_days>=15 then 'Medium'
ELSE 'Short'end;

select count(*) total_appointments,department,
avg(lead_time_days)as average_lead_time,
max(lead_time_days) as max_lead_time,
min(lead_time_days) as min_lead_time
from appointments
group by department
order by avg(lead_time_days) desc;

select doctor_id,count(*) total_appointments,
count(case when status='Completed' then 1 end) completed,
count(case when status='No-Show' then 1 end) No_shows,
round(count(case when status='No-show' then 1 end)*100/count(*),2) no_showrate
from appointments 
group by doctor_id 
having count(*)>100 and round(count(case when status='No-show' then 1 end)*100/count(*),2)>10
order by doctor_id;

 

 select department,total_appointments from(
 select count(*) total_appointments,
 department,
 dense_rank() over(order by count(*) desc) as rnk
 from appointments
 group by department)t
 where rnk=3;
 

 select department, count(*) total_appointments from  appointments group by department
  having count(*) >
 (select count(*) total_appointments from appointments 
 where department='Cardiology') order by total_appointments desc;


 select count( distinct department),patient_id from appointments
 group by patient_id 
 having count(distinct department)>3;
 

select doctor_id ,count(*) appointments from appointments
group by doctor_id having count(*)=
(select max(appointments) from
(select count(*) as appointments from appointments group by doctor_id
)t
);

select doctor_id,count(*) total_appointment from appointments
group by doctor_id having count(*) >
(select avg(total_appointment) from
(select count(*) total_appointment from appointments group by  doctor_id
)t
);

select department,avg(lead_time_days)averageleadtime
from appointments group by department
having avg(lead_time_days)=
(select avg(lead_time_days)avergeleadtime from appointments);


select * from (
select patient_id,
dense_rank()over(order by registration_date desc)rnk
from patients )t
where rnk in(1,2,3,4,5);

select * from patients
where age=
(select max(age) from patients);

select * from appointments
where lead_time_days=
(select max(lead_time_days) from appointments);

select * from patients where age >
(select avg(age)  from patients );

select department,count(*)total_appointments from appointments  group by department
having count(*) = 
(select min(total_appointments) from 
(select count(*) total_appointments from appointments
group by department)t
);

select appointment_type,count(*)total_appointments from appointments
group by appointment_type having count(*)=
(
select max(total_appointments) from
(select count(*)total_appointments from appointments
group by appointment_type)t
);


select doctor_id,department,count(*)total_appointment from appointments a
group by department,doctor_id having count(*)>
(select avg(total_appointments) from
(select doctor_id,count(*) total_appointments from appointments
where department=a.department
group by doctor_id )t);

SELECT
doctor_id,
department,
COUNT(*) total_appointments
FROM appointments a
GROUP BY doctor_id,department
HAVING COUNT(*)>
(
SELECT AVG(total_appointments)
FROM
(
SELECT doctor_id,
COUNT(*) total_appointments
FROM appointments
WHERE department=a.department
GROUP BY doctor_id
)t
);


SELECT
    d1.doctor_id,
    d1.doctor_name,
    d1.department,
    d1.avg_consult_minutes,

    (
        SELECT AVG(d2.avg_consult_minutes)
        FROM doctors d2
        WHERE d1.department = d2.department
    ) AS department_average,

    ROUND(
        (
            d1.avg_consult_minutes -
            (
                SELECT AVG(d2.avg_consult_minutes)
                FROM doctors d2
                WHERE d1.department = d2.department
            )
        ) * 100.0
        /
        (
            SELECT AVG(d2.avg_consult_minutes)
            FROM doctors d2
            WHERE d1.department = d2.department
        ),
        2
    ) AS percentage_above_average

FROM doctors d1

WHERE d1.avg_consult_minutes >
(
    SELECT AVG(d2.avg_consult_minutes)
    FROM doctors d2
    WHERE d1.department = d2.department
);

select * 
from
(
select doctor_id,count(*) total_appointment,
DENSE_RANK() over(order by  count(*) desc) rnk 
from appointments group by doctor_id) d
where rnk<=5;


SELECT TOP 1 department,  COUNT(*) TOTAL_APPOINTMENTS
FROM APPOINTMENTS GROUP BY department  ORDER BY COUNT(*) DESC;

select count(*)total_app, 
count(case when status='No-Show' then 1 end) noshowcount,
count(case when status='No-Show' then 1 end)*100 /count(*) no_showpercentage,
department 
from appointments group by department order by  
count(case when status='No-Show' then 1 end)*100 /count(*) desc ;


select  avg_consult_minutes,doctor_id from doctors where avg_consult_minutes >
(select avg(avg_consult_minutes) from doctors d1 
where doctors.department=d1.department); 

select top 3 city,count(*)total_patient  from patients group by city order by count(*) desc;

select avg(lead_time_days)avg_lead_time,department from appointments
group by department;

select  top 1 count(case when status='No-show' then 1 end)*100/count(*) no_show_rate,insurance_type
from appointments join patients on appointments.patient_id=patients.patient_id GROUP BY insurance_type 
order by  count(case when status='No-show' then 1 end)*100/count(*) desc;

select count(case when gender='M' then 1 end)total_male,
count(case when gender='F' then 1 end) total_female,department
from patients join appointments on
patients.patient_id=appointments.patient_id
group by department ;


select  avg(age)avg_age,department from patients join appointments
on patients.patient_id=appointments.patient_id group by department
having avg(age)>45;

select  patient_id, count(*) as total_appointments  from appointments
group by patient_id
having count(*) >
(
select avg(total_appointment) from
(
select count(*) as total_appointment,patient_id from appointments
group by patient_id) patient_count )
;


select doctor_id,count(*) totalappointments_handled  from appointments
group by doctor_id  having count(*) >
(
select avg(totalappointments_handled) from
(select count(*) totalappointments_handled,doctor_id from appointments
group by doctor_id)doc_co);

select department,count(*) deparcoun_appointment from appointments
group by department having count(*)>
(
select avg(deparcoun_appointment) from
(select count(*)deparcoun_appointment,department from appointments
group by department )t);

select patient_id,count( distinct department) department_visted  from appointments  group by patient_id
having count( distinct department)>1;

select doctor_id,
count(case when status='No-Show' then 1 end)  from appointments 
group by  doctor_id having  count(case when status='No-Show' then 1 end)=0;

select patient_id,distance_km from patients p2 
where distance_km >
(select avg(distance_km) from patients p1
where p1.city=p2.city);

select distinct  patient_name,age,department 
from  patients p  join appointments  a on 
p.patient_id=a.patient_id 
where age= 
(select min(age)youngest_patient from  patients p1 join appointments a1
on p1.patient_id=a1.patient_id where a.department=a.department);


select distinct patient_name,age,department
from patients p join appointments a on
p.patient_id=a.patient_id
where age =
(select max(age)oldest_patient from patients p1 join appointments a1
on p1.patient_id=a1.appointment_id where a.department=a1.department);

select department,count(*)total_appointments,
count(case when status='Completed' then 1 end) as attended 
from appointments a  group by department
having count(case when status='Completed' then 1 end) =
(select  count(*)total_appointments 
from appointments a1  where a.department=a1.department  );


select doctor_id,avg_consult_minutes from doctors d
 where avg_consult_minutes>
(select avg(avg_consult_minutes) from doctors d1
 where d.department=d1.department
) ;


select count(*)total_appointments,department,DENSE_RANK()over(
order by count(*) desc)rnk  from appointments group by department;


SELECT COUNT(CASE when status='No-Show' then 1 end)*100.0/count(*) count_rate,
doctor_id from appointments group by doctor_id;

select department,count(*)doctor_appointments,
count(*)*100.0/
(select count(*) from appointments) as contirbution
from appointments 
group by department 
--having count(*)*100.0/(select count(*) from appointments) >15;

select count(*) total_appointments,p.patient_id,p.city from patients p
join appointments a on p.patient_id=a.patient_id
group by p.patient_id ,p.city
having  count(*) >
(select avg(city_average) from 
(select count(*) city_average from patients p1 join appointments a1 on 
p1.patient_id =a1.patient_id
where p.city=p1.city)t);


select count(case when years_experience  between 0 and 5 then 'Junior' end)junior_doctors ,
count(case when years_experience between 6 and 15 then 'Mid' end) mid_doctors,
count(case when years_experience >15 then 'Senior' end)senior_docotor
from doctors;


select appointments.doctor_id,doctor_name,doctors.department,count(*)totalappointments,
row_number() over( order by count(*) desc) rnk
from appointments  join doctors on appointments.doctor_id=doctors.doctor_id
group by appointments.doctor_id,doctor_name,doctors.department;


select  * from
(
select  top 2 appointments.doctor_id,doctor_name,doctors.department,count(*)totalappointments,
row_number() over( order by count(*) desc) rnk
from appointments  join doctors on appointments.doctor_id=doctors.doctor_id 
group by appointments.doctor_id,doctor_name,doctors.department) t
where rnk=2;


select *  from
(
select count(*)total_appointments,doctor_id,
count(case when Status='Completed' then 1 end) attended,
count(case when Status='Completed' then 1 end)*1.000/count(*) attendance_rate 
from  appointments group by doctor_id)t 
where attendance_rate =
(select max(attendance_rate) from 
(select count(case when Status='Completed' then 1.000 end)*1/count(*) 
attendance_rate from appointments group by doctor_id)t
);

select * from
(
select department,
count(case when status='No-Show' then 1 end)no_showrate,
count(*) total_appointments,
count(case when status='No-Show' then 1 end)*1.0/count(*) no_showappoin
from appointments group by department)t
where no_showappoin =
(select max(no_showappoin)  from 
(select count(case when status='No-Show' then 1 end)*1.0/count(*) no_showappoin
 from appointments group by department)t);


 select count(*)total_appointments,patient_id,department
 from appointments group by patient_id,department
 having count(*)>=3;

 select * from (
 select appointment_date,department,count(*)total_appointment,
 dense_rank()over(order by count(*) desc)rnk
 from appointments group by appointment_date,department)t
 where rnk =1;

 select * from
 (
 select department, avg(lead_time_days)avg_lead_time from appointments
 group by department)t
 where avg_lead_time=
 (select max(avg_lead_time) from
 (select avg(lead_time_days)avg_lead_time 
 from appointments group by department)t);

 select * from(
 select  doctor_name,appointments.doctor_id, avg(distance_km) avg_distance
 from patients join appointments 
 on patients.patient_id=appointments.patient_id 
 join doctors 
 on appointments.doctor_id = doctors.doctor_id 
 group by doctor_name,appointments.doctor_id)t
 where avg_distance=
 (select max(avg_distance) from
 (select avg(distance_km) avg_distance from 
 patients join appointments 
 on patients.patient_id=appointments.patient_id 
 join doctors 
 on appointments.doctor_id = doctors.doctor_id 
 group by doctor_name,appointments.doctor_id)t)
 ;

select * from (
select p.insurance_type,count(*)total_appointments
from patients p join appointments a
on p.patient_id=a.patient_id group by p.insurance_type)t
where total_appointments=
(select max(total_appointments) from  
(select count(*) total_appointments from patients p join appointments a
on p.patient_id=a.patient_id group by p.insurance_type)t);

select top 1 count(distinct p.city ) city_count,
count(distinct p.gender)gender_count,
count(distinct p.insurance_type) insurance_count,
a.patient_id,a.doctor_id,d.department from
patients p  join appointments a on
p.patient_id=a.patient_id 
join
doctors d on
a.doctor_id=d.doctor_id
group by a.patient_id,a.doctor_id,d.department
order by  count(distinct p.city)+
count(distinct p.gender)+count(distinct p.insurance_type) desc;

SELECT
    t.doctor_id,
    t.department,
    t.total_appointments,
    t.attended,
    t.no_shows,
    t.attendance_percentage,

    ROUND(
        AVG(t.attendance_percentage)
        OVER(PARTITION BY t.department), 2
    ) AS department_average_attendance,

    ROUND(
        t.attendance_percentage -
        AVG(t.attendance_percentage)
        OVER(PARTITION BY t.department), 2
    ) AS difference_from_department_average

FROM
(
    SELECT
        d.doctor_id,
        d.department,

        COUNT(*) AS total_appointments,

        SUM(CASE
                WHEN a.status = 'Attended' THEN 1
                ELSE 0
            END) AS attended,

        SUM(CASE
                WHEN a.status = 'No-Show' THEN 1
                ELSE 0
            END) AS no_shows,

        ROUND(
            SUM(CASE
                    WHEN a.status = 'Attended' THEN 1
                    ELSE 0
                END) * 100.0 / COUNT(*), 2
        ) AS attendance_percentage

    FROM doctors d
    JOIN appointments a
        ON d.doctor_id = a.doctor_id

    GROUP BY d.doctor_id, d.department
) t;

select count(case when status='Completed' then 1 end)*1.0/count(*) doctor_attendance
from appointments;



select p.patient_name,
d.doctor_name,d.department,a.appointment_date 
from patients p join 
appointments a on p.patient_id= a.patient_id 
join doctors d on  d.doctor_id=a.doctor_id;

select d.doctor_name,count(*)total_appointments,d.doctor_id
from doctors d join appointments a 
on d.doctor_id=a.doctor_id 
group by d.doctor_name,d.doctor_id
order by count(*) desc;


select p.patient_name,p.patient_id,d.doctor_id,d.doctor_name,count( case when status='Completed' then 1 end)total_appointments
from patients p join appointments a on 
p.patient_id=a.patient_id join 
doctors d on 
d.doctor_id=a.doctor_id
group by p.patient_name,d.doctor_name,p.patient_id,d.doctor_id
order by count( case when status='Completed' then 1 end) desc ;


select count(case when gender='M' then 1 end)male_count,
count(case when gender='F' then 1 end)female_count,
d.department from 
patients p join appointments a 
on  p.patient_id=a.patient_id
join doctors d on 
a.department=d.department
group by d.department;


select avg(p.age)avg_age,d.department,count(*)total_appointments
from 
patients p join appointments a 
on p.patient_id=a.patient_id 
join doctors d on d.doctor_id=a.doctor_id
group by d.department
order by avg(age) desc;

select   top 5 count(*)total_appointments,
d.doctor_id from 
appointments a join doctors d 
on a.doctor_id=d.doctor_id
group by d.doctor_id
order by count(*) desc;

select top 1  count(case  when status='No-Show' then 1 end)no_no_shows,
d.doctor_id from 
appointments a join doctors d 
on a.doctor_id=d.doctor_id
group by d.doctor_id ;

select avg(avg_consult_minutes)avg_minutes,d.department
from appointments a join doctors d 
on a.doctor_id=d.doctor_id
group by d.department 
order by avg(avg_consult_minutes) desc;


select p.patient_id,p.patient_name,a.appointment_id 
from patients p   left join appointments a
on p.patient_id=a.patient_id
where p.patient_id is null;

select d.doctor_id,d.doctor_name,d.department,
a.appointment_id from 
doctors d  left join appointments a
on d.doctor_id=a.doctor_id
where a.appointment_id is null;

select d.doctor_id,d.doctor_name,count(a.appointment_id)total_appointments
from doctors d left join appointments a 
on d.doctor_id =a.doctor_id 
group by d.doctor_id,d.doctor_name
order by count(a.appointment_id) desc;

select count(a.appointment_id)total_appointments,
p.patient_id,p.patient_name from patients p 
join appointments a on p.patient_id=a.patient_id
group by  p.patient_id,p.patient_name 
having count(a.appointment_id)=1;


select 
count(case when status='No-show'  then 1 end) no_show,
d.doctor_id from 
appointments a  right join doctors d 
on a.doctor_id=d.doctor_id
group by d.doctor_id
having count(case when status='No-Count' then 1 end) =1;