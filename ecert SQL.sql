select name, second_name, COALESCE(since,'1900-01-00') from users; 
#answers'BEATRIZ ELENA', 'Manrique Loaiza', '2007-01-15'

select id, username, profile_id, password_txt, manager_id from users where id = 2111;
select profile_id from users where id = 1220;
select * from users where profile_id = 2 and status = 1;
select * from users where username = 11348766;
select * from users;

select name,second_name, (cast((DATEDIFF(curdate(),COALESCE(since,'1900-01-00'))/30)as unsigned)) as 'meses de antiguedad' from users 
where ((cast((DATEDIFF(curdate(),since)/30)as unsigned)) > 0) and status = 1;

SET SQL_SAFE_UPDATES = 0;
update users
set encrypted_password = '$2a$10$/3xVti95HmnX/hx.GTwqmOyZZH7h8moXRMc5nc9RHjZ6H4V6DyUJK'
where id >0;


SELECT (cast((DATEDIFF(curdate(),since)/30)as unsigned)) as 'ss' FROM users WHERE (id = 122) LIMIT 1;
#demoadmin
# $2a$10$/3xVti95HmnX/hx.GTwqmOyZZH7h8moXRMc5nc9RHjZ6H4V6DyUJK

select * from tenrollments;
select * from tenrollments where tevaluation_id = 18;
select * from tenrollment_statuses;
select * from tenrollments where user_id = 600;
select * from tenrollments where id = 13;
select * from tenrollments where id = 804;

select * from attempts;
select * from attempts where tenrollment_id = 804;


select * from thistoric_evaluations;
select * from thistoric_evaluations where id =1;

select * from thistoric_evaluations where tenrollment_id = 804; 



SELECT `thistoric_evaluations`.* FROM `thistoric_evaluations` WHERE (user_id = 1576 and tenrollment_id = '6843' and attempt_id = 10309) LIMIT 1;

select * from tevaluations;

select * from thistoric_questions;
select * from thistoric_questions where thistoric_evaluation_id = 10246;


select * from thistoric_answers;
select * from thistoric_answers 
where thistoric_question_id IN (select id from thistoric_questions where thistoric_evaluation_id = 10246);

# Desde aui comienza el histrial dde 49 a 59
select * from thistoric_answers where thistoric_question_id = 124349;

select * from thistoric_answers where thistoric_question_id = 124350;

select * from thistoric_answers where id = 124350;
select * from thistoric_answers where answer_id = 26;

select * from answers;
select * from answers WHERE (question_id = 124349);


select * from questions;


select * from question_types;
ALTER DATABASE elearning_levapan CHARACTER SET utf8 COLLATE utf8_general_ci;
#55

#| Planes de desarrollo 

select id from users;
select id, name, project_id from dev_plans where user_id not in (select id from users) and project_id = 5;
select * from follows;

select id, name from users where id in (select user_id from dev_plans where project_id = 5);

select * from dev_plans;
select * from dev_plans where project_id = 5;
select * from periods;
select * from competence_feedbacks where user_id = 3836;

# Carlos centuriuo 
#id 2253



select * from courses;

select name,course_type_id, course_clasification_id, library_value_id, course_status_id from courses;


select * from image_certificates;


select te.id as 'thieva-id',te.attempt_id as 'Intento No.', concat(u.name,' ',u.second_name) as 'Nombre', u.identity as 'Identificacion',
teval.nombre as 'Nombre Evaluacion', thq.question_id as 'qiestioiD'
from thistoric_evaluations te
inner join users u ON u.id = te.user_id and u.profile_id != 1
left join tenrollments ten ON ten.id = te.tenrollment_id
inner join tevaluations teval ON teval.id = ten.tevaluation_id
left join thistoric_questions thq ON thq.thistoric_evaluation_id = te.id;

select q.id, q.titulo, q.enunciado, concat('perro, demo,', a.respuesta) as 'Listado' from questions q
inner join answers a ON a.question_id = q.id;


SELECT COUNT(a.id) as 'NO. RTA', a.question_id, q.enunciado, 
GROUP_CONCAT('\n\n',a.respuesta,' (',a.correcta,')')  as 'lista'
FROM answers a
inner join questions q ON q.id = a.question_id
GROUP BY a.question_id
ORDER BY COUNT(a.id) DESC;


select * from thistoric_answers;

#1468 replace(trim(q.enunciado),',',' ')    replace(prta.RTA,',',' ')
create or replace view gabrica2 as (
select u.identity 'Identificacion',
 concat(u.name, ' ', u.second_name) 'Nombre_Usuario', 
 c.name 'Compañia', 
 p.name 'Cargo',
 a.name 'Area',
 l.name 'Localizacion',
 g.name 'Grupo',
 the.attempt_id,
 te.nombre 'Nombre_Evaluacion', 
 'enun' 'Enunciado', 
 'eraevalu' as 'rta_evaluacion', 
 prta.status,
 if(tha.user_answer = 0, ' -- ','SELECCIONADA') 'RTA_USER_ANSWER'
from thistoric_evaluations the
inner join users u ON u.id = the.user_id and u.profile_id != 1
inner join companies c ON c.id = u.company_id 
inner join positions p ON p.id = u.position_id
inner join areas a ON a.id = u.area_id
inner join localizations l ON l.id = u.localization_id
inner join groups g ON g.id = u.group_id
inner join thistoric_questions thq ON thq.thistoric_evaluation_id = the.id
inner join questions q ON q.id = thq.question_id
inner join preguntas_rta prta ON prta.idqueansw = q.id
inner join tenrollments ten ON ten.id= the.tenrollment_id
inner join tevaluations te ON te.id= ten.tevaluation_id
inner join thistoric_answers tha ON tha.thistoric_question_id = thq.id);



select distinct Nombre_Evaluacion from gabrica2;
 
create or replace view preguntas_rta as(
select q.id 'idqueansw',a.respuesta 'RTA', if(a.correcta = 0, 'Incorrecta','Correcta') as 'status', a.id as 'id_answer'
from questions q
right join answers a ON a.question_id = q.id);

select count(*) from tevaluations;

select distinct te.nombre from tevaluations te
inner join tenrollments ten ON ten.tevaluation_id = te.id;

select replace(enunciado,',','****') from questions;


select q.id, q.enunciado, a.respuesta, if(a.correcta = 0, 'Incorrecta','Correcta') as 'status'
from questions q
right join answers a ON a.question_id = q.id;

select q.id, q.enunciado from questions q
LIMIT 10;

create or replace view preguntas_rta_1 as(
select 
	q.id 'id_question',
    REPLACE(REPLACE(a.respuesta , CHAR(13), ''), CHAR(10), '') 'name_anser',
    a.id as 'id_answer',
    REPLACE(REPLACE(q.enunciado, CHAR(13), ''), CHAR(10), '') 'name_question',
    if(a.correcta = 0, 'Incorrecta','Correcta') as 'status'
from questions q
right join answers a ON a.question_id = q.id);

create or replace view users_data as (
	select
		u.id 'id_user',
        u.identity 'identity',
		concat(u.name, ' ', u.second_name) 'full_name',
        u.status 'state',
        u.manager_id 'boss',
		c.name 'company',
        p.name 'cargo',
        a.name 'area',
        l.name 'localization',
        g.name 'group'
    from users u
	inner join companies c ON c.id = u.company_id 
	inner join positions p ON p.id = u.position_id
	inner join areas a ON a.id = u.area_id
	inner join localizations l ON l.id = u.localization_id
	inner join groups g ON g.id = u.group_id
   
);

create or replace view preguntas_rta_1 as(
select 
	q.id 'id_question',
    REPLACE(REPLACE(a.respuesta , CHAR(13), ''), CHAR(10), '') 'name_anser',
    a.id as 'id_answer',
    REPLACE(REPLACE(q.enunciado, CHAR(13), ''), CHAR(10), '') 'name_question',
    if(a.correcta = 0, 'Incorrecta','Correcta') as 'status'
from questions q
right join answers a ON a.question_id = q.id);

create or replace view users_data2 as (
	select
		u.id 'id_user',
        u.identity 'identity',
		concat(u.name, ' ', u.second_name) 'full_name',
        u.status 'state',
        u.manager_id 'boss_id',
        concat(man.name, ' ', man.second_name) 'full_name_boss',
		c.name 'company',
        p.name 'cargo',
        a.name 'area',
        l.name 'localization',
        g.name 'group'
    from users u
	left join users man ON u.id = man.manager_id
	inner join companies c ON c.id = u.company_id 
	inner join positions p ON p.id = u.position_id
	inner join areas a ON a.id = u.area_id
	inner join localizations l ON l.id = u.localization_id
	inner join groups g ON g.id = u.group_id
    where u.id <> man.id
);

##############################################################################
### REPORTE HISTORICO DE CAPACITACION
create or replace view users_data as (
	select
		u.id 'id_user',
        u.identity 'identity',
		concat(u.name, ' ', u.second_name) 'full_name',
        u.email 'email',
        u.status 'state',
        u.manager_id 'boss',
		c.name 'company',
        l.name 'level_cargo',
        p.name 'cargo',
        a.name 'area',
        l.name 'localization',
        g.name 'group'
    from users u
	inner join companies c ON c.id = u.company_id 
	inner join positions p ON p.id = u.position_id
	inner join areas a ON a.id = u.area_id
	inner join localizations l ON l.id = u.localization_id
	inner join groups g ON g.id = u.group_id
   
);
select count(*) from users_data;
select * from users_data;
# where u.profile_id != 1

create or replace view courses_data as (
select  
	c.id 'id_course',
	c.name 'name_course', 
    ct.name 'name_course_type',
    cc.name 'name_course_clasification',
    c.starting 'date_start_course',
    c.ending 'date_end_course',
    c.total_hours 'horas',
    p.id 'id_pro',
    p.name 'name_provider'
from courses c
left join course_types ct on c.course_type_id = ct.id
left join course_clasifications cc on c.course_clasification_id = cc.id 
left join course_providers p on p.id = c.course_provider_id
);
select * from courses_data;
select * from courses;
select count(*) from courses_data; 
# right join course_schedules cs ON cs.course_id = c.id_course
 #COALESCE(since,'1900-01-00')
 #if(tha.user_answer = 0, ' -- ','SELECCIONADA') 'RTA_USER_ANSWER'
create or replace view historic_capcitacion as (
select
	u.identity, 
    u.full_name,
    u.email,
    if(u.state = 0, 'Inactivo','Vigente') 'state_user',
    u.company,
    e.position_level,
    u.cargo,
    u.area,
    u.localization,
    u.group,
    u.boss,
    c.name_course,
    c.name_course_type,
    c.name_course_clasification,
    c.name_provider,
    cs.starts 'date_realizacion',
    cs.ends 'date_FINAlizacion',
    e.enroll 'date_matricula',
    (1+7) 'date_ultimo_estudio',
    e.limite, 
    e.percentage, 
    c.horas, 
    e.grade
from enrollments e
inner join users_data u ON e.user_id = u.id_user
inner join courses_data c ON c.id_course = e.course_id
left join course_schedules cs ON cs.id = e.course_schedule_id
order by u.identity desc);

select count(*) from historic_capcitacion;

select * from historic_capcitacion;

### REPORTE HISTORICO DE CAPACITACION
##############################################################################

select * from courses;
select * from course_schedules;
select count(*) from courses_data;
select * from courses_data;
select * from course_providers;

select * from courses;
select * from enrollments;
select count(*) from courses;
select * from users_data;

# prta.name_question 'name_questions',
# prta.name_anser 'name_answer',

# prta.id_question 'id_questions',
# prta.id_answer 'id_answer',

create or replace view gabrica2 as (
select 
	u.identity 'identificacion',
	u.full_name,
    u.company,
	u.cargo,
	u.area,
	u.localization,
	u.group,
	te.nombre as 'nombre_evaluacion',
    REPLACE(prta.name_question,',',';') 'name_questions',
	REPLACE(prta.name_anser,',',';' ) 'name_answer',
    prta.status 'status',
    if(tha.user_answer = 0, '--','SELECCIONADA') 'rta_user'
from thistoric_evaluations the
inner join users_data u ON u.id_uuser = the.user_id 
inner join tenrollments ten ON ten.id = the.tenrollment_id
inner join thistoric_questions thq ON thq.thistoric_evaluation_id = the.id
inner join tevaluations te ON te.id = ten.tevaluation_id
inner join preguntas_rta_1 prta ON prta.id_question = thq.question_id
inner join thistoric_answers tha ON tha.thistoric_question_id = thq.id 
order by ten.id);

select  * from gabrica2;
select name_answer from gabrica2;
select  count(*) from gabrica2;
select distinct  nombre_evaluacion from gabrica2;

select  id, enunciado from questions;
select  id,  REPLACE(REPLACE(enunciado, CHAR(13), ''), CHAR(10), '') from questions;
select  id, respuesta from answers;

## Mejorando comentarios evaluator relations

create or replace view torails as (
select 
	er.assignment_id as 'assignment_id',
	a.evaluator_id as 'evaluator_id',
	u.id as 'user_id',
	er.relation_id as 'relation_id',
	s.project_id as 'project_id',
	s.id as 'survey_id',
	er.family_competence_id as 'family_competence_id',
	er.competence_id as 'competence_id',
	er.behavior_id as 'behavior_id',
	er.score as 'score', 
	er.ideal as 'ideal'
from evaluator_relations er
join assignments a ON er.assignment_id = a.id and a.status = 3
join surveys s ON a.survey_id = s.id and s.project_id = 5
inner join users u ON u.id = a.evaluated_id and u.status = 1 );

        


select 
concat(u_ev.second_name,' ',u_ev.name) as 'nombre Evaluador',
u_ev.identity,
concat(u.second_name,' ',u.name) as 'nombre Evaluado',
u.identity as 'identify eval',
p.name as 'Cargo',
l.name as 'Nivel',
a.name as 'Area',
g.name as 'Grupo',
loc.name as 'Localizacion',
com.name as 'Compañia',
pro.name as 'Proyecto',
s.name as 'Encuesta',
re.name as 'Relacion',
COALESCE(c.name, 'SIN COMPETENCIA' ) as 'Compencia',
sq.statement as 'Pregunta',
r1.score,
r1.ideal,
((r1.score*100)/r1.ideal) as '%'
from report_1 r1
left join users u ON u.id = r1.user_id
left join users u_ev ON u_ev.id = r1.evaluator_id
left join relations re ON re.id = r1.relation_id
left join competences c ON c.id = r1.competence_id
left join surveys s ON s.id = r1.survey_id
left join positions p ON p.id = u.position_id
left join survey_questions sq ON sq.id = r1.behavior_id
left join levels l ON l.id = p.level_id
left join areas a ON a.id = u.area_id
left join groups g ON g.id = u.group_id
left join localizations loc ON loc.id = u.localization_id
left join companies com ON com.id = u.company_id
left join projects pro ON pro.id = s.project_id
order by r1.evaluator_id,r1.user_id, r1.family_competence_id;
