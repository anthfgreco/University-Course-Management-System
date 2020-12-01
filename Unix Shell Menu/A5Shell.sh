#!/bin/sh
SET LINESIZE 200

MainMenu()
{
 while [ "$CHOICE" != "START" ]
 do
 clear
 echo "================================================================="
 echo "| Oracle DB University Course Management Application"
 echo "|"
 echo "| Main Menu - Select Desired Operations:"
 echo "================================================================="
 echo " $IS_SELECTED1 1) Drop Tables"
 echo " $IS_SELECTED2 2) Create Tables"
 echo " $IS_SELECTED3 3) Populate Tables"
 echo " "
 echo " $IS_SELECTED4 4) Choose query"
 echo " "
 echo " $IS_SELECTED4 5) Drop Views"
 echo " $IS_SELECTED4 6) Create Views"
 echo " "
 echo " $IS_SELECTEDE E) Exit"
 echo " "
 echo "Choose: "
 read CHOICE
 echo " "
 if [ "$CHOICE" == "0" ]
 then
 echo "Nothing Here"
 elif [ "$CHOICE" == "1" ]
 then
 sqlplus64 "afgreco/08153364@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" < drop_tables.txt
 Pause
 elif [ "$CHOICE" == "2" ]
 then
 sqlplus64 "afgreco/08153364@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" < create_tables.txt
 Pause
 elif [ "$CHOICE" == "3" ]
 then
 sqlplus64 "afgreco/08153364@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" < populate_tables.txt
 Pause
 elif [ "$CHOICE" == "4" ]
 then
 while [ "$CHOICE" != "E" ]
    clear
    QueryText
    do
    QueryLoop
    done 
Pause
 elif [ "$CHOICE" == "5" ]
 then
 sqlplus64 "afgreco/08153364@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" < drop_views.txt
 Pause
 elif [ "$CHOICE" == "6" ]
 then
 sqlplus64 "afgreco/08153364@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" < create_views.txt
 Pause
 elif [ "$CHOICE" == "E" ]
 then
 exit
 fi
 done
}

QueryText()
{
 echo "================================================================="
 echo "| Query Selection Tool"
 echo "|"
 echo "| Query Selection - Select Desired Operation(s):"
 echo "|"
 echo "-----------------------------------------------------------------"
 echo " $IS_SELECTEDM C) Clear output and show list of queries"
 echo " "
 echo " $IS_SELECTED1 1) List all the students that qualify for the Deans List"
 echo " $IS_SELECTED2 2) List all the students that are enrolled in ART201"
 echo " $IS_SELECTED3 3) Show the average GPA of all students"
 echo " $IS_SELECTED4 4) For each course, list the course ID, course name, number of students in the course, and the number of teachers in the course"
 echo " $IS_SELECTED5 5) List the average mark, minimum mark, and maximum mark for each assignment in ART201"
 echo " $IS_SELECTED6 6) For each course, list the course ID and course name, and list all the assignments in that course and list the average mark, minimum mark, and maximum mark for each assignment"
 echo " $IS_SELECTED7 7) List all the teacher ID's, teacher names, teacher emails, and list all the classes they teach and the number of students in those classes"
 echo " $IS_SELECTED8 8) For every department, list the department id, department name, office location, number of teachers, number of courses, and number of students in each department"
 echo " $IS_SELECTED9 9) Show the cs_teachers View. Display all teachers that teach a computer science course or an art course"
 echo " $IS_SELECTED10 10) Show the table_counts View. Display count of students, courses, teachers, departments, and assignments"
 echo " $IS_SELECTED11 11) Show the total_tuitons View. For each student, list their student ID, student name, email, and calculate the total amount of their tuition"
 echo " $IS_SELECTED12 12) Displays all teachers that are teaching a course, alongside the course that they are teaching" 
 echo " $IS_SELECTED13 13) List all teachers that are not from the science department"
echo " "
 echo " $IS_SELECTEDE E) Go back to main loop"
}

QueryLoop()
{
 while [ "$CHOICE" != "START" ]
 do
 echo " "
 echo "Choose: "
 read CHOICE
 echo " "
 if [ "$CHOICE" == "C" ]
 then
 clear
 QueryText
 elif [ "$CHOICE" == "1" ]
 then
 sqlplus64 "afgreco/08153364@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" < 1.txt | sed -e '1,11d' | head -n-3
 
 elif [ "$CHOICE" == "2" ]
 then
 sqlplus64 "afgreco/08153364@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" < 2.txt | sed -e '1,11d' | head -n-3
 
 elif [ "$CHOICE" == "3" ]
 then
 sqlplus64 "afgreco/08153364@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" < 3.txt | sed -e '1,11d' | head -n-3
 
 elif [ "$CHOICE" == "4" ]
 then
 sqlplus64 "afgreco/08153364@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" < 4.txt | sed -e '1,11d' | head -n-3

 elif [ "$CHOICE" == "5" ]
 then
 sqlplus64 "afgreco/08153364@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" < 5.txt | sed -e '1,11d' | head -n-3
 
 elif [ "$CHOICE" == "6" ]
 then
 sqlplus64 "afgreco/08153364@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" < 6.txt | sed -e '1,11d' | head -n-3
 
 elif [ "$CHOICE" == "7" ]
 then
 sqlplus64 "afgreco/08153364@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" < 7.txt | sed -e '1,11d' | head -n-3
 
 elif [ "$CHOICE" == "8" ]
 then
 sqlplus64 "afgreco/08153364@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" < 8.txt | sed -e '1,11d' | head -n-3
 
 elif [ "$CHOICE" == "9" ]
 then
 sqlplus64 "afgreco/08153364@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" < 9.txt | sed -e '1,11d' | head -n-3
 
 elif [ "$CHOICE" == "10" ]
 then
 sqlplus64 "afgreco/08153364@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" < 10.txt | sed -e '1,11d' | head -n-3
 
 elif [ "$CHOICE" == "11" ]
 then
 sqlplus64 "afgreco/08153364@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" < 11.txt | sed -e '1,11d' | head -n-3
 elif [ "$CHOICE" == "12" ]
 then
 sqlplus64 "afgreco/08153364@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" < 12.txt | sed -e '1,11d' | head -n-3
 elif [ "$CHOICE" == "13" ]
 then
 sqlplus64 "afgreco/08153364@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" < 13.txt | sed -e '1,11d' | head -n-3


 elif [ "$CHOICE" == "E" ]
 then
 MainMenu
 fi
 echo " "
 done
}

#--COMMENTS BLOCK--
# Main Program
#--COMMENTS BLOCK--
ProgramStart()
{
 StartMessage
 while [ 1 ]
 do
 MainMenu

 done
}

ProgramStart

