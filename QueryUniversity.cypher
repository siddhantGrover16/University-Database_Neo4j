//
MATCH (s:students)
Where s.name="Becky"
Return s.name,s.ssn
//q2
MATCH (s:students {ssn : "123097834"})-[:major]->(z:degrees) RETURN z.name,z.level

//q3
MATCH (d:departments {name : "Computer Science"})-[:offers]->(c:courses) 
Return c.name

//q4
MATCH (d:departments {name : "Computer Science"})-[:administers]->(z:degrees) 
Return z.name,z.level

//q5
MATCH (s:students )-[:minor]->(z:degrees) RETURN s.name

//q6
MATCH (s:students )-[:minor]->(z:degrees) RETURN count(distinct s.name)

//q7
MATCH (s:students )-[:registers]->(c:courses {name:"Algorithm"}) RETURN s.name,s.snum

//q8
MATCH (s:students)
Where s.name contains 'n' or s.name contains 'N'
Return s.name,s.snum,s.ssn

//q9
MATCH (s:students)
Where not(s.name contains 'n') and not(s.name contains 'N')
Return s.name,s.snum,s.ssn

//q10
MATCH (s:students )-[:registers]->(c:courses) RETURN c.name,c.number,count(s.snum)

//q11
MATCH (s:students )-[r:registers]->(c:courses) where r.regtime="Fall2020"  RETURN  s.name

//q12
MATCH (d:departments{name:"Computer Science"} )-[:offers]->(c:courses)  RETURN c.number,c.name

//q13
MATCH (d:departments )-[:offers]->(c:courses) where d.name in['Computer Science','Landscape Architect'] RETURN c.number,c.name

//q14
MATCH (s:students)-[:major]->(z:degrees)<-[:administers]-(d:departments) RETURN s.name,d.name

//q15
MATCH (s:students)-[:major]->(z:degrees)<-[:administers]-(d:departments{name:"Computer Science"}) where s.gender='F' return count(s.name) as ct union Match (s:students)-[:major]->(z:degrees)<-[:administers]-(d:departments{name:"Computer Science"}) where s.gender='M' return count(s.name)as ct
