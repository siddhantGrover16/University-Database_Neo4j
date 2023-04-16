//q1
MATCH (s:students {ssn: '746897816'})
SET s.name = "Scott"
RETURN s

//q2
MATCH (s:students {ssn: '746897816'})-[:major]->(z:degrees)
SET z.name ='Computer Science',z.level='MS'

//q3
MATCH (s:students)-[x:registers]->(z:courses)
where x.regtime='Spring2021'
delete x