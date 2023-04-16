# University-Database_Neo4j
A University Database is implmented in Neo4j via a graphic model. .cypher scripts are then created to study the database with different queries\

# Files
* ER diagram of the Database
* ImportData.cypher : The data is provided in csv files in data.zip. These csv files are loaded into Neo4J to create nodes and edges. 
*	QueryUniversity.cypher : This file consists of the queries to acces the following information 

1)	The student number and ssn of the student whose name is "Becky"
2)	The major name and major level of the student whose ssn is 123097834
3)	The names of all courses offered by the department of Computer Science
4)	All degree names and levels offered by the department Computer Science
5)	The names of all students who have a minor
6)	The count of students who have a minor
7)	The names and snums of all students enrolled in course “Algorithm”
8)	The name, snum and SSN of the students whose name contains letter “n” or “N”
9)	The name, snum and SSN of the students whose name does not contain letter “n” or “N”
10)	The course number, name and the number of students registered for each course
11)	The name of the students enrolled in Fall2020 semester.
12)	The course numbers and names of all courses offered by Department of Computer Science
13)	The course numbers and names of all courses offered by either Department of Computer Science or Department of Landscape Architect.
14)	The home department of all students (home department of a student is the department that manages the student’s major). Return the students’ names and their home departments’ names
15)	The counts of female and male students whose home department is Computer Science 

*	ModifyRecords.cypher : This file consists of queries to modify information in a Neo4j Database. For exaple purposed, the following changes are made via this script
1)	Change the name of the student with ssn = 746897816 to Scott
2)	Change the major of the student with ssn = 746897816 to Computer Science, Master. 
3)	Delete all registration records that were in “Spring2021”,

* DropAll.cypher : This script deletes all nodes and edges from the database





