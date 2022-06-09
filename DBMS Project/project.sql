create table department(Deptid number Primary Key, DeptName varchar2(40), HOD varchar2(30), facultyID number);
Insert INTO Department Values('1','ComputerScience','Rajdeep','111');
Insert INTO Department Values('2','Electronics','HimansuDas','222');
Insert INTO Department Values('3','Communications','Collins','333');
Insert INTO Department Values('4','Mechanical','Biswajit','444');
Insert INTO Department Values('5','Science','Williams','555');

-- select * from department;

create table program(ProgramID number Primary Key, ProgramName varchar2(30), TimePeriod number, StartYear number, 
DeptID number, RegulationID number);
Insert INTO Program Values('101','BtechCSE','4','2022','1','3');
Insert INTO Program Values('102','BtechECE','4','2022','2','3');
Insert INTO Program Values('103','BSc','3','2022','5','2');
Insert INTO Program Values('104','BCA','3','2022','3','2');
Insert INTO Program Values('105','MtechCSE','3','2022','1','5');

-- select * from program;

create table Regulation(RegulationID number Primary Key, Name varchar2(10), StartYear number, EndYear number, 
Duration number);
Insert Into Regulation Values('1','Y11','2018','2022','4');
Insert Into Regulation Values('2','Y12','2019','2022','3');
Insert Into Regulation Values('3','Y13','2020','2024','4');
Insert Into Regulation Values('4','Y14','2021','2026','5');
Insert Into Regulation Values('5','Y15','2022','2025','3');

-- select * from regulation;

create table course(CourseID varchar2(20) Primary Key, CourseName varchar2(20), LTP number, CourseType varchar2(20), 
DeptID number, ProgramID number, PreferenceID number);
Insert into course Values('CS1001','DSA','202','Core','1','101','10');
Insert Into course values('DB2002','DBMS','305','Core','1','101','20');
Insert Into course values('EC3003','AEC','204','Core','2','102','30');
Insert Into course values('MT4004','BMS','305','Elective','4','102','40');
Insert Into course values('BC5005','BComm','105','Elective','5','105','50');

-- select * from course;

create table Faculty(FacultyID number Primary Key, FacultyName varchar2(30), Specialization varchar2(30), Email varchar2(40), 
Address varchar2(50), PhoneNo varchar2(10),
DeptID number, PreferenceNo number, QualID number);
Insert Into Faculty Values('111','Kunal','DatabaseSystems','kunalfcs@kiit.ac.in','Delhi','9568391020','1','20','1');
Insert Into Faculty Values('222','Nikhil','DataStructures','nikhilfcs@kiit.ac.in','Dehradun','8273011131','1','10','1');
Insert Into Faculty Values('333','Jack','Electronics','jackfcs@kiit.ac.in','Odisha','9687248592','2','30','2');
Insert Into Faculty Values('444','Steve','Verbal','stevefcs@kiit.ac.in','Brooklyn','8739953247','3','50','3');
Insert Into Faculty Values('555','Tony','Mechanical','tonyfcs@kiit.ac.in','StarkTower','8219878345','4','40','2');

-- select * from faculty;

create table Qualification(QualID  number Primary Key, QualName varchar2(30));
Insert Into Qualification Values('1','Doctorate');
Insert Into Qualification Values('2','Masters');
Insert Into Qualification Values('3','Bachelores');
Insert Into Qualification Values('4','Associates');
Insert Into Qualification Values('5','HighSchool');

-- select * from qualification;


create table Student(RollNo number Primary Key, Name varchar2(30), DOB date, Address varchar2(30), Email varchar2(30), 
Phone number, FathersName varchar2(30), Score number, CourseID varchar2(30),ProgramID number, DeptID number, FacultyID number);

Insert Into Student Values('100','TomCruise',To_Date('30-04-2002','DD-MM-YYYY'),'NewYork','tom100@kiit.ac.in','9865136848','Thomas','92','CS1001','101','1','111');
Insert Into Student Values('101','MickeyTyler',To_Date('18-03-2002','DD-MM-YYYY'),'Brooklyn','mickey101@kiit.ac.in','9856793403','Nicole','87','CS1001','101','1','111');
Insert Into Student Values('102','RajeshPatel',To_Date('28-11-1999','DD-MM-YYYY'),'Vadodra','rajesh102@kiit.ac.in','8769024867','Marian','56','BC5005','105','3','444');
Insert Into Student Values('103','DeborahRickles',To_Date('21-06-2001','DD-MM-YYYY'),'Manhattan','deborah103@kiit.ac.in','7988462459','William','82','EC3003','102','4','333');
Insert Into Student Values('104','BrianLee',To_Date('26-05-2003','DD-MM-YYYY'),'Scottdale','brian104@kiit.ac.in','9023558766','Isabella','78','DB2002','101','1','222');

-- select * from student;

create table Room(RoomNo number, RoomName varchar2(30), Block varchar2(10), Floor number);
Insert INTO room Values('101','Laboratory','A','1');
Insert INTO room Values('201','Classroom','A','2');

-- select * from room;

create table CourseFaculty(CFID number Primary Key, FacultyID number, CourseID varchar2(30), RoomNo number, PreferenceID number, RegulationID number);
Insert Into CourseFaculty Values('1101','111','CS1001','101','10','1');
Insert Into CourseFaculty Values('1102','222','DB2002','101','20','2');
Insert Into CourseFaculty Values('1103','333','EC3003','201','30','3');
Insert Into CourseFaculty Values('1104','444','BC5005','201','50','4');
Insert Into CourseFaculty values('1105','555','MT5005','101','40','5');

-- select * from courseFaculty;

-- Ques 1:
select course.coursename, program.programname from course INNER JOIN program ON course.programid=program.programid where 
program.programName = 'BtechCSE';

-- Ques 2:
select program.programname, department.deptname from Program INNER JOIN Department ON program.deptID = department.deptID where 
department.deptname = 'ComputerScience';

-- Ques 3
select course.coursename, course.LTP, Regulation.name as "Regulation" from Course INNER JOIN courseFaculty ON 
course.courseID = courseFaculty.courseID INNER JOIN regulation ON coursefaculty.regulationID = regulation.regulationID where 
Regulation.name='Y15' and course.LTP ='305';

-- Ques 4
select student.name, course.coursename, program.programname from student INNER JOIN course ON 
course.courseID = student.courseID INNER Join program ON program.programID = student.ProgramID;

-- Ques 5
select student.name, faculty.facultyname from student INNER JOIN Faculty ON student.facultyID = faculty.facultyID  where 
Faculty.facultyname = 'Kunal';

-- drop table coursefaculty;
-- create table CourseFaculty(CFID number Primary Key, FacultyID number, CourseID varchar2(30), RoomNo number, 
-- PreferenceID number, RegulationID number, ProgramID number);
-- Insert Into CourseFaculty Values('1101','111','CS1001','101','10','1','101');
-- Insert Into CourseFaculty Values('1102','222','DB2002','101','20','2','101');
-- Insert Into CourseFaculty Values('1103','333','EC3003','201','30','3','102');
-- Insert Into CourseFaculty Values('1104','444','BC5005','201','50','4','104');
-- Insert Into CourseFaculty values('1105','555','MT5005','101','40','5','105');

-- select * from courseFaculty;

-- Ques 6
select faculty.facultyname, program.programname from faculty INNER JOIN courseFaculty on Faculty.facultyID=coursefaculty.facultyID 
INNER JOIN program ON program.programID = coursefaculty.programID where program.programname='MtechCSE';

-- Ques 7

select course.coursename, course.coursetype,department.deptname,regulation.name as "Regulation" from Course INNER JOIN Department ON course.deptid = department.deptID
INNER JOIN coursefaculty ON  course.programID = coursefaculty.programID INNER JOIN regulation ON regulation.regulationID = coursefaculty.regulationID where regulation.name='Y15';

-- Ques 8
select faculty.facultyName, course.coursename, faculty.preferenceNO as "Preference Given", coursefaculty.preferenceID as 
"Alloted Course Preference ID" from faculty INNER JOIN courseFaculty ON faculty.facultyID = coursefaculty.facultyID INNER JOIN 
course ON course.courseID = coursefaculty.courseID where faculty.preferenceNO = coursefaculty.preferenceID;


-- Ques 9
select faculty.facultyName, course.coursename, faculty.preferenceNO as "Preference Given", coursefaculty.preferenceID as 
"Alloted Course Preference ID" from faculty INNER JOIN courseFaculty ON faculty.facultyID = coursefaculty.facultyID INNER JOIN 
course ON course.courseID = coursefaculty.courseID where faculty.preferenceNO != coursefaculty.preferenceID;

-- update coursefaculty set courseid='MT4004' where cfid='1105';
-- update course set coursetype = 'Elective' where courseid = 'EC3003';

-- Ques 10
select course.coursename, course.courseType, program.programName, regulation.name as "Regulation" from course INNER JOIN 
coursefaculty ON coursefaculty.courseID = course.courseID INNER JOIN program ON coursefaculty.programID = program.programID 
INNER JOIN regulation ON coursefaculty.regulationID = regulation.regulationID where program.programname='BtechECE' and 
regulation.name='Y13' and course.courseType='Elective';