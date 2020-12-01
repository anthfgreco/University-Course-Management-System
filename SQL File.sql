DROP TABLE department CASCADE CONSTRAINTS;
DROP TABLE teacher CASCADE CONSTRAINTS;
DROP TABLE course CASCADE CONSTRAINTS;
DROP TABLE student CASCADE CONSTRAINTS;
DROP TABLE undergraduate CASCADE CONSTRAINTS;
DROP TABLE graduate CASCADE CONSTRAINTS;
DROP TABLE tuition CASCADE CONSTRAINTS;
DROP TABLE assignment CASCADE CONSTRAINTS;
DROP TABLE owes CASCADE CONSTRAINTS;
DROP TABLE offers CASCADE CONSTRAINTS;
DROP TABLE manages CASCADE CONSTRAINTS;
DROP TABLE teaching CASCADE CONSTRAINTS;
DROP TABLE assigns CASCADE CONSTRAINTS;
DROP TABLE receives_mark CASCADE CONSTRAINTS;
DROP TABLE enrollments CASCADE CONSTRAINTS;
DROP TABLE faculty CASCADE CONSTRAINTS;

CREATE TABLE department (
    dep_ID              VARCHAR2(10) PRIMARY KEY,
    dep_name            VARCHAR2(30) DEFAULT 'GENERAL',
    office_location     VARCHAR2(30)
);
   
CREATE TABLE faculty (
    fac_name            VARCHAR2(30)  PRIMARY KEY,
    fac_budget          NUMBER,
    fac_address         VARCHAR2(30),
    fac_year_founded    VARCHAR2(30) DEFAULT '1980'
);

CREATE TABLE advises (
    fac_name    VARCHAR2(30) REFERENCES faculty(fac_name),
    dep_ID      VARCHAR2(10) REFERENCES department(dep_ID)
);

CREATE TABLE teacher (
    teacher_ID      VARCHAR2(10) PRIMARY KEY,
    teacher_name    VARCHAR2(40) NOT NULL,
    email           VARCHAR2(30) NOT NULL UNIQUE,
    office_location VARCHAR2(30) DEFAULT 'HUB 101'
);

CREATE TABLE course (
    course_ID       VARCHAR2(30) PRIMARY KEY,
    course_name     VARCHAR2(30) NOT NULL UNIQUE,
    course_location VARCHAR2(30),
    office_day      VARCHAR2(10),
    office_hours    VARCHAR2(30),
    class_day       VARCHAR2(10),
    class_time      VARCHAR2(30)
);
     
CREATE TABLE student (
    student_ID      VARCHAR2(10) PRIMARY KEY,
    birth_date      DATE NOT NULL,
    email           VARCHAR2(30) NOT NULL UNIQUE,
    student_name    VARCHAR2(40) NOT NULL,
    gpa             NUMBER
);
    
CREATE TABLE undergraduate (
    student_ID      VARCHAR2(10) PRIMARY KEY REFERENCES student(student_ID),
    birth_date      DATE NOT NULL,
    email           VARCHAR2(30) NOT NULL UNIQUE,
    student_name       VARCHAR2(40) NOT NULL,
    gpa             NUMBER,
    ug_degree       VARCHAR2(30)
);

CREATE TABLE graduate (
    student_ID      VARCHAR2(10) PRIMARY KEY REFERENCES student(student_ID),
    birth_date      DATE NOT NULL,
    email           VARCHAR2(30) NOT NULL UNIQUE,
    student_name       VARCHAR2(40) NOT NULL,
    gpa             NUMBER,
    g_degree        VARCHAR2(30)
);

CREATE TABLE tuition (
    student_ID      VARCHAR2(10) REFERENCES student(student_ID),
    tuition_ID      VARCHAR2(10) PRIMARY KEY,
    item_name       VARCHAR2(30),
    due_date        DATE,
    item_amount     NUMBER NOT NULL
);

CREATE TABLE owes (
    student_ID  VARCHAR2(10) REFERENCES student(student_ID),
    tuition_ID   VARCHAR2(30) REFERENCES tuition(tuition_ID)
);

CREATE TABLE assignment (
    assignment_name     VARCHAR2(50) PRIMARY KEY,
    assignment_weight   NUMBER NOT NULL,
    assignment_due_date DATE
);

CREATE TABLE assigns (
    course_ID       VARCHAR2(30) REFERENCES course(course_ID),
    assignment_name VARCHAR2(50) REFERENCES assignment(assignment_name)
);

CREATE TABLE receives_mark (
    student_ID      VARCHAR2(10) REFERENCES student(student_ID),
    assignment_name VARCHAR2(50) REFERENCES assignment(assignment_name),
    mark_received   NUMBER NOT NULL
);

CREATE TABLE manages (
    dep_ID      VARCHAR2(10) REFERENCES department(dep_ID),
    teacher_ID  VARCHAR2(10) REFERENCES teacher(teacher_ID),
    PRIMARY KEY (dep_ID, teacher_ID)
);

CREATE TABLE offers (
    dep_ID      VARCHAR2(10) REFERENCES department(dep_ID),
    course_ID   VARCHAR2(30) REFERENCES course(course_ID),
    PRIMARY KEY (dep_ID, course_ID)
);

CREATE TABLE teaching (
    teaching_ID VARCHAR2(10) PRIMARY KEY,
    teacher_ID  VARCHAR2(10) REFERENCES teacher(teacher_ID),
    course_ID   VARCHAR2(30) REFERENCES course(course_ID)
);

CREATE TABLE enrollments (
    enrollment_ID   VARCHAR2(10) PRIMARY KEY,
    student_ID      VARCHAR2(10) REFERENCES student(student_ID),
    course_ID       VARCHAR2(30) REFERENCES course(course_ID),
    year            VARCHAR(10),
    semester        CHAR(2)
);

INSERT INTO course VALUES ('CPS510', 'Data Structures', 'SCI 513', 'MONDAY', '10:30', 'FRIDAY', '10:00');
INSERT INTO course VALUES ('ART101', 'Art History I', 'ART 256', 'MONDAY', '5:30', 'FRIDAY', '11:00');
INSERT INTO course VALUES ('CPS101', 'Computer Science I', 'SCI 309', 'TUESDAY', '9:30', 'MONDAY', '12:00');
INSERT INTO course VALUES ('LAW107', 'Intro. to Law and Order', 'LAW 341', 'TUESDAY', '11:30', 'MONDAY', '13:00');
INSERT INTO course VALUES ('MTH101', 'Discrete Mathematics', 'ENG 146', 'WEDNESDAY', '12:30', 'TUESDAY', '15:00');
INSERT INTO course VALUES ('CHM410', 'Advanced Chemistry', 'SCI 217', 'WEDNESDAY', '3:30', 'TUESDAY', '17:00');
INSERT INTO course VALUES ('PHY255', 'Newtonian Physics', 'SCI 310', 'THURSDAY', '1:30', 'WEDNESDAY', '08:00');
INSERT INTO course VALUES ('ART201', 'Art History II', 'ART 136', 'THURSDAY', '2:30', 'WEDNESDAY', '18:00');
INSERT INTO course VALUES ('MGT810', 'Commerical Business Management', 'BUS 410', 'FRIDAY', '4:30', 'THURSDAY', '09:00');
INSERT INTO course VALUES ('LAW204', 'Advanced Federal Law', 'LAW 305', 'FRIDAY', '2:30', 'TUESDAY', '14:00');

INSERT INTO teacher VALUES ('396768763', 'Bertha Roberts', 'berthar@victoria.ca', 'SCI 493');
INSERT INTO teaching VALUES ('12', '396768763', 'CPS510');
INSERT INTO teaching VALUES ('15', '396768763', 'CPS101');
INSERT INTO teacher VALUES ('375182362', 'Andrew Smith', 'andrews@victoria.ca', 'SCI 289');
INSERT INTO teaching VALUES ('5', '375182362', 'CPS101');
INSERT INTO teacher VALUES ('375839204', 'Arthur Brown', 'arthurb@victoria.ca', 'SCI 167');
INSERT INTO teaching VALUES ('25', '375839204', 'PHY255');
INSERT INTO teacher VALUES ('382043246', 'James Sullivan', 'jamess@victoria.ca', 'ART 713');
INSERT INTO teaching VALUES ('32', '382043246', 'ART201');
INSERT INTO teacher VALUES ('376812310', 'Susan Baker', 'susanb@victoria.ca', 'ART 736');
INSERT INTO teaching VALUES ('45', '376812310', 'ART101');
INSERT INTO teacher VALUES ('312314123', 'Elizabeth Andrews', 'elizabetha@victoria.ca', 'LAW 256');
INSERT INTO teacher VALUES ('398612073', 'Sebastian Perez', 'sebastianp@victoria.ca', 'LAW 241');
INSERT INTO teaching VALUES ('51', '398612073', 'LAW107');
INSERT INTO teacher VALUES ('381038723', 'Beatriz Castaneda', 'beatrizc@victoria.ca', 'ENG 135');
INSERT INTO teaching VALUES ('65', '381038723', 'MTH101');
INSERT INTO teacher VALUES ('392837492', 'Henry Ye', 'henryy@victoria.ca', 'BUS 469');
INSERT INTO teaching VALUES ('87', '392837492', 'MGT810');
INSERT INTO teacher VALUES ('319763197', 'Isabel Trastamara', 'isabelt@victoria.ca', 'BUS 367');
INSERT INTO teaching VALUES ('98', '319763197', 'LAW204');
INSERT INTO teaching VALUES ('99', '319763197', 'PHY255');

INSERT INTO student VALUES ('500903364', to_date('15/08/2000', 'dd/mm/yyyy'), 'anthg@victoria.ca', 'Anthony Greco', 3.2);
INSERT INTO enrollments VALUES ('1', '500903364', 'CPS510', 2014, 4);
INSERT INTO enrollments VALUES ('4', '500903364', 'ART101', 2014, 5);
INSERT INTO enrollments VALUES ('6', '500903364', 'CPS101', 2014, 5);

INSERT INTO student VALUES ('500905530', to_date('04/02/1995', 'dd/mm/yyyy'), 'serenag@victoria.ca', 'Serena Gregor', 4.3);
INSERT INTO enrollments VALUES ('12', '500905530', 'LAW107', 2015, 2);
INSERT INTO enrollments VALUES ('14', '500905530', 'MTH101', 2015, 2);
INSERT INTO enrollments VALUES ('17', '500905530', 'CHM410', 2016, 3);

INSERT INTO student VALUES ('500922910', to_date('11/01/2000', 'dd/mm/yyyy'), 'nicoles@victoria.ca', 'Nicole Smyth', 4.0);
INSERT INTO enrollments VALUES ('21', '500922910', 'PHY255', 2016, 3);
INSERT INTO enrollments VALUES ('32', '500922910', 'ART201', 2016, 3);
INSERT INTO enrollments VALUES ('33', '500922910', 'MGT810', 2016, 3);

INSERT INTO student VALUES ('500819310', to_date('11/01/2000', 'dd/mm/yyyy'), 'matthews@victoria.ca', 'Matthew Smyth', 3.0);
INSERT INTO enrollments VALUES ('41', '500819310', 'LAW204', 2017, 1);
INSERT INTO enrollments VALUES ('42', '500819310', 'MTH101', 2018, 1);
INSERT INTO enrollments VALUES ('44', '500819310', 'ART201', 2018, 2);

INSERT INTO student VALUES ('500998515', to_date('21/02/1998', 'dd/mm/yyyy'), 'sebasts@victoria.ca', 'Sebastian Spano', 3.5);
INSERT INTO enrollments VALUES ('51', '500998515', 'CPS510', 2018, 3);
INSERT INTO enrollments VALUES ('52', '500998515', 'ART201', 2019, 4);
INSERT INTO enrollments VALUES ('55', '500998515', 'CHM410', 2019, 4);

INSERT INTO tuition VALUES ('500903364', '10050521', 'Tuition UGrad', to_date('01/02/2021', 'dd/mm/yyyy'), 4289);
INSERT INTO tuition VALUES ('500903364', '10051333', 'Coop Education', to_date('01/02/2021', 'dd/mm/yyyy'), 750);
INSERT INTO tuition VALUES ('500903364', '10071412', 'Academic Support', to_date('01/02/2021', 'dd/mm/yyyy'), 56);
INSERT INTO owes VALUES ('500903364', '10050521');
INSERT INTO owes VALUES ('500903364', '10051333');
INSERT INTO owes VALUES ('500903364', '10071412');

INSERT INTO tuition VALUES ('500905530', '10050128', 'Tuition UGrad', to_date('01/02/2021', 'dd/mm/yyyy'), 4582);
INSERT INTO tuition VALUES ('500905530', '10050129', 'Coop Education', to_date('01/02/2021', 'dd/mm/yyyy'), 750);
INSERT INTO tuition VALUES ('500905530', '10051214', 'Academic Support', to_date('01/02/2021', 'dd/mm/yyyy'), 56);
INSERT INTO tuition VALUES ('500905530', '10021214', 'Athletics and Recreation', to_date('01/02/2021', 'dd/mm/yyyy'), 113);
INSERT INTO owes VALUES ('500905530', '10050128');
INSERT INTO owes VALUES ('500905530', '10050129');
INSERT INTO owes VALUES ('500905530', '10051214');
INSERT INTO owes VALUES ('500905530', '10021214');

INSERT INTO tuition VALUES ('500922910', '10050333', 'Tuition UGrad', to_date('01/02/2021', 'dd/mm/yyyy'), 4785);
INSERT INTO tuition VALUES ('500922910', '10040999', 'Coop Education', to_date('01/02/2021', 'dd/mm/yyyy'), 750);
INSERT INTO tuition VALUES ('500922910', '10014814', 'Academic Support', to_date('01/02/2021', 'dd/mm/yyyy'), 56);
INSERT INTO tuition VALUES ('500922910', '10078113', 'Athletics and Recreation', to_date('01/02/2021', 'dd/mm/yyyy'), 113);
INSERT INTO owes VALUES ('500922910', '10050333');
INSERT INTO owes VALUES ('500922910', '10040999');
INSERT INTO owes VALUES ('500922910', '10014814');
INSERT INTO owes VALUES ('500922910', '10078113');

INSERT INTO tuition VALUES ('500819310', '10059511', 'Tuition UGrad', to_date('01/02/2021', 'dd/mm/yyyy'), 4281);
INSERT INTO tuition VALUES ('500819310', '10091601', 'Academic Support', to_date('01/02/2021', 'dd/mm/yyyy'), 56);
INSERT INTO tuition VALUES ('500819310', '10000912', 'Athletics and Recreation', to_date('01/02/2021', 'dd/mm/yyyy'), 113);
INSERT INTO owes VALUES ('500819310', '10059511');
INSERT INTO owes VALUES ('500819310', '10091601');
INSERT INTO owes VALUES ('500819310', '10000912');

INSERT INTO tuition VALUES ('500998515', '10050123', 'Tuition UGrad', to_date('01/02/2021', 'dd/mm/yyyy'), 4781);
INSERT INTO tuition VALUES ('500998515', '10050909', 'Academic Support', to_date('01/02/2021', 'dd/mm/yyyy'), 56);
INSERT INTO tuition VALUES ('500998515', '10551121', 'Athletics and Recreation', to_date('01/02/2021', 'dd/mm/yyyy'), 113);
INSERT INTO owes VALUES ('500998515', '10050123');
INSERT INTO owes VALUES ('500998515', '10050909');
INSERT INTO owes VALUES ('500998515', '10551121');

INSERT INTO department VALUES ('740937523', 'Science', '137 Oak St.');
INSERT INTO manages VALUES ('740937523', '396768763');
INSERT INTO manages VALUES ('740937523', '375182362');
INSERT INTO manages VALUES ('740937523', '375839204');
INSERT INTO offers VALUES ('740937523', 'CPS510');
INSERT INTO offers VALUES ('740937523', 'CPS101');
INSERT INTO offers VALUES ('740937523', 'CHM410');
INSERT INTO offers VALUES ('740937523', 'PHY255');

INSERT INTO department VALUES ('724792732', 'Arts', '213 Willow St.');
INSERT INTO manages VALUES ('724792732', '382043246');
INSERT INTO manages VALUES ('724792732', '376812310');
INSERT INTO offers VALUES ('724792732', 'ART101');
INSERT INTO offers VALUES ('724792732', 'ART201');

INSERT INTO department VALUES ('762898632', 'Law', '209 James St.');
INSERT INTO manages VALUES ('762898632', '312314123');
INSERT INTO manages VALUES ('762898632', '398612073');
INSERT INTO offers VALUES ('762898632', 'LAW107');
INSERT INTO offers VALUES ('762898632', 'LAW204');

INSERT INTO department VALUES ('712387621', 'Engineering', '496 Queen St.');
INSERT INTO manages VALUES ('712387621', '381038723');
INSERT INTO offers VALUES ('712387621', 'MTH101');

INSERT INTO department VALUES ('792897236', 'Business', '507 Elizabeth St.');
INSERT INTO manages VALUES ('792897236', '392837492');
INSERT INTO manages VALUES ('792897236', '319763197');
INSERT INTO offers VALUES ('792897236', 'MGT810');

INSERT INTO assignment VALUES ('Animated Robot Assignment', 25, to_date('01/11/2020', 'dd/mm/yyyy'));
INSERT INTO assigns VALUES ('CPS510', 'Animated Robot Assignment');
INSERT INTO receives_mark VALUES (500903364, 'Animated Robot Assignment', 90);
INSERT INTO receives_mark VALUES (500998515, 'Animated Robot Assignment', 81);

INSERT INTO assignment VALUES ('Virtual Reality Custom Shader', 10, to_date('05/12/2020', 'dd/mm/yyyy'));
INSERT INTO assigns VALUES ('CPS510', 'Virtual Reality Custom Shader');
INSERT INTO receives_mark VALUES (500903364, 'Virtual Reality Custom Shader', 83);
INSERT INTO receives_mark VALUES (500998515, 'Virtual Reality Custom Shader', 76);

INSERT INTO assignment VALUES ('Northern Lights Painting', 20, to_date('05/12/2020', 'dd/mm/yyyy'));
INSERT INTO assigns VALUES ('ART101', 'Northern Lights Painting');
INSERT INTO receives_mark VALUES (500903364, 'Northern Lights Painting', 79);

INSERT INTO assignment VALUES ('Binary Tree Algorithm', 10, to_date('18/12/2020', 'dd/mm/yyyy'));
INSERT INTO assigns VALUES ('CPS101', 'Binary Tree Algorithm');
INSERT INTO receives_mark VALUES (500903364, 'Binary Tree Algorithm', 95);

INSERT INTO assignment VALUES ('Depth First Search Algorithm', 5, to_date('18/12/2020', 'dd/mm/yyyy'));
INSERT INTO assigns VALUES ('CPS101', 'Depth First Search Algorithm');
INSERT INTO receives_mark VALUES (500903364, 'Depth First Search Algorithm', 98);

INSERT INTO assignment VALUES ('Analysis of the Canadian Federal Government', 30, to_date('12/12/2020', 'dd/mm/yyyy'));
INSERT INTO assigns VALUES ('LAW107', 'Analysis of the Canadian Federal Government');
INSERT INTO receives_mark VALUES (500905530, 'Analysis of the Canadian Federal Government', 88);

INSERT INTO assignment VALUES ('Integral Quiz', 5, to_date('26/11/2020', 'dd/mm/yyyy'));
INSERT INTO assigns VALUES ('MTH101', 'Integral Quiz');
INSERT INTO receives_mark VALUES (500905530, 'Integral Quiz', 76);
INSERT INTO receives_mark VALUES (500819310, 'Integral Quiz', 81);

INSERT INTO assignment VALUES ('Derivative Assignment', 15, to_date('20/12/2020', 'dd/mm/yyyy'));
INSERT INTO assigns VALUES ('MTH101', 'Derivative Assignment');
INSERT INTO receives_mark VALUES (500905530, 'Derivative Assignment', 85);
INSERT INTO receives_mark VALUES (500819310, 'Derivative Assignment', 87);

INSERT INTO assignment VALUES ('Oxygen Molecule Analysis', 18, to_date('20/11/2020', 'dd/mm/yyyy'));
INSERT INTO assigns VALUES ('CHM410', 'Oxygen Molecule Analysis');
INSERT INTO receives_mark VALUES (500905530, 'Oxygen Molecule Analysis', 93);
INSERT INTO receives_mark VALUES (500998515, 'Oxygen Molecule Analysis', 68);

INSERT INTO assignment VALUES ('Light Physics Around Black Hole', 40, to_date('27/12/2020', 'dd/mm/yyyy'));
INSERT INTO assigns VALUES ('PHY255', 'Light Physics Around Black Hole');
INSERT INTO receives_mark VALUES (500922910, 'Light Physics Around Black Hole', 76);

INSERT INTO assignment VALUES ('Picasso Analysis Essay', 35, to_date('26/12/2020', 'dd/mm/yyyy'));
INSERT INTO assigns VALUES ('ART201', 'Picasso Analysis Essay');
INSERT INTO receives_mark VALUES (500922910, 'Picasso Analysis Essay', 97);
INSERT INTO receives_mark VALUES (500819310, 'Picasso Analysis Essay', 93);
INSERT INTO receives_mark VALUES (500998515, 'Picasso Analysis Essay', 87);
INSERT INTO assignment VALUES ('Color and Emotion Project', 12, to_date('15/12/2020', 'dd/mm/yyyy'));
INSERT INTO assigns VALUES ('ART201', 'Color and Emotion Project');
INSERT INTO receives_mark VALUES (500922910, 'Color and Emotion Project', 93);
INSERT INTO receives_mark VALUES (500819310, 'Color and Emotion Project', 75);
INSERT INTO receives_mark VALUES (500998515, 'Color and Emotion Project', 83);

INSERT INTO assignment VALUES ('Business Organizational Essay', 15, to_date('11/11/2020', 'dd/mm/yyyy'));
INSERT INTO assigns VALUES ('MGT810', 'Business Organizational Essay');
INSERT INTO receives_mark VALUES (500922910, 'Business Organizational Essay', 65);

INSERT INTO assignment VALUES ('Ethics of Drug Decriminalization', 40, to_date('25/12/2020', 'dd/mm/yyyy'));
INSERT INTO assigns VALUES ('LAW204', 'Ethics of Drug Decriminalization');
INSERT INTO receives_mark VALUES (500819310, 'Ethics of Drug Decriminalization', 74);

/* 1. List all the students that qualify for the Deans List */
SELECT student_name AS Deans_List, gpa
FROM student
WHERE gpa >= 3.8
ORDER BY gpa;

/* 2. List all the students (student name and student ID) that are enrolled in ART201 */
SELECT student_name AS ART201_Students, s.student_id
FROM student s, enrollments e
WHERE course_id = 'ART201'
      AND s.student_id = e.student_id
ORDER BY student_name;
      
/* 3. Show the average GPA of all students */
SELECT 'The average GPA of all students is: ' AS Average_GPA, AVG(gpa) AS GPA
FROM student;

/* 4. For each course, list the course ID, course name, number of students in the course, and the number of teachers in the course */
SELECT e.course_id, c.course_name, COUNT(DISTINCT e.student_id) AS Number_of_Students, COUNT(DISTINCT t.teacher_id) AS Number_of_Teachers
FROM enrollments e, teaching t, course c
WHERE e.course_id = t.course_id
      AND e.course_id = c.course_id
      AND t.course_id = c.course_id
GROUP BY e.course_id, c.course_name
ORDER BY c.course_name;

/* 5. List the average mark, minimum mark, and maximum mark for each assignment in ART201 */
SELECT a.assignment_name, AVG(mark_received) AS Average_Mark, MIN(mark_received) AS Lowest_Mark, MAX(mark_received) AS Highest_Mark
FROM assigns a, receives_mark r
WHERE course_id = 'ART201'
      AND a.assignment_name = r.assignment_name
GROUP BY a.assignment_name; 

/* 6. For each course, list the course ID and course name, and list all the assignments in that course and list the average mark, minimum mark, and maximum mark for each assignment */
SELECT a.course_id, course_name, a.assignment_name, AVG(mark_received) AS Average_Mark, MIN(mark_received) AS Lowest_Mark, MAX(mark_received) AS Highest_Mark
FROM assigns a, course c, receives_mark r
WHERE a.course_id = c.course_id
      AND a.assignment_name = r.assignment_name 
GROUP BY a.course_id, course_name, a.assignment_name
ORDER BY course_name;

/* 7. List all the teacher ID's, teacher names, teacher emails, and list all the classes they teach and the number of students in those classes */
SELECT tr.teacher_id, tr.teacher_name, tr.email, ts.course_id, COUNT(DISTINCT e.student_id) AS Number_of_Students
FROM teacher tr, teaching ts, enrollments e
WHERE tr.teacher_id = ts.teacher_id 
      AND ts.course_id = e.course_id 
GROUP BY tr.teacher_id, tr.teacher_name, tr.email, ts.course_id
ORDER BY tr.teacher_name;

/* 8. For every department, list the department id, department name, office location, number of teachers, number of courses, and number of students in each department */
SELECT d.dep_id, dep_name, office_location, COUNT(DISTINCT teacher_id) AS Number_of_Teachers, COUNT(DISTINCT o.course_id) AS Number_of_Courses, COUNT(DISTINCT e.student_id) AS Number_of_Students
FROM department d, manages m, offers o, enrollments e
WHERE d.dep_id = m.dep_id
      AND d.dep_id = o.dep_id
      AND o.course_id = e.course_id
GROUP BY d.dep_id, dep_name, office_location
ORDER BY dep_name;

/* 9. Display all teachers that teach a computer science course (starts with CPS) OR an art course (starts with ART) */
DROP VIEW cs_teachers;

CREATE VIEW cs_teachers AS
(SELECT ts.teacher_ID, teacher_name, course_ID
 FROM teaching ts, teacher tr
 WHERE course_ID LIKE 'CPS%' AND
       ts.teacher_ID = tr.teacher_ID)
UNION
(SELECT ts.teacher_ID, teacher_name, course_ID
 FROM teaching ts, teacher tr
 WHERE course_ID LIKE 'ART%' AND
       ts.teacher_ID = tr.teacher_ID)
ORDER BY course_ID;
 
SELECT * FROM cs_teachers;

/* 10. Display count of students, courses, teachers, departments, and assignments */
DROP VIEW table_counts;

CREATE VIEW table_counts AS
SELECT COUNT(DISTINCT student_id) AS Number_of_Students, COUNT(DISTINCT course_id) AS Number_of_Courses, COUNT(DISTINCT teacher_id) AS Number_of_Teachers, 
        COUNT(DISTINCT dep_ID) AS Number_of_Departments, COUNT(DISTINCT assignment_name) AS Number_of_Assignments
 FROM student, teacher, course, department, assignment
 WITH READ ONLY;
 
SELECT * FROM table_counts;

/* 11. For each student, list their student ID, student name, email, and calculate the total amount of their tuition */
DROP VIEW total_tuitions;

CREATE VIEW total_tuitions AS
SELECT s.student_id, student_name, email, SUM(item_amount) AS Total_Tuition
FROM student s, tuition t
WHERE s.student_id = t.student_id 
GROUP BY s.student_id, student_name, email
ORDER BY student_name
WITH READ ONLY;

SELECT * FROM total_tuitions;

/* 12. Displays all teachers that are teaching a course, alongside the course that they are teaching. */
SELECT Teacher.teacher_name, Course.course_name
FROM ((teaching
JOIN Teacher ON teaching.teacher_id = Teacher.teacher_id)
JOIN Course ON teaching.course_id = Course.course_id)
ORDER BY Teacher.teacher_name;

/* 13. List all teachers that are not from the science department */
SELECT teacher_id, teacher_name, email, office_location FROM teacher
MINUS
(SELECT m.teacher_id, t.teacher_name, t.email, t.office_location FROM manages m, teacher t WHERE dep_id = '740937523');

 

