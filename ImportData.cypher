//create students
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vROrskhgTXDn0YC0bMnn9pSZG0fguBT8qSemdN8iJyNqhhn9bQ6z5X-3Lw1I3lFBmNyfDVohA4ZfOHi/pub?gid=946458172&single=true&output=csv' AS line
CREATE (:students {snum: line.snum, ssn:line.ssn,name: line.name,gender: line.name,dob: line.dob,c_addr: line.c_addr,c_phone: line.c_phone,p_addr: line.p_addr,p_phone: line.p_phone})

//create departments
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vSZjB-njgyoNAS7hhgvyqPMKs7gSEAzRzj55XrDsS4Ly_Q5pS2XWIWe-Qnx_UsszAxs7GZDT8z9N6l6/pub?gid=1270533085&single=true&output=csv' AS line
CREATE (:departments {dcode: line.dcode, name:line.name,phone:line.phone,college:line.college})

//create degrees
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQmzlXmZkQbRaV4gcSaMRINRlEypaOZjMNBNutAHj2Eij4CgpfYni54oj5pFtNAb1k5vCu6pQlsuSBN/pub?gid=1817942933&single=true&output=csv' AS line
CREATE (:degrees {name:line.name,level:line.level,dcode:line.dcode})

//create courses
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQl4ewanefLXz_qsNa1FEYimkQoPWLighjsYtUicQ2ZAfje3BJNvIq2LHLMsTtNhSRq3bdDudFwSA47/pub?gid=1395040011&single=true&output=csv' AS line
CREATE (:courses {number:line.number,name:line.name,description:line.descripion,credithours:line.credithours,level:line.level,dcode:line.dcode})

//offers
MATCH (d:departments), (c:courses)
where d.dcode=c.dcode
CREATE (d)-[:offers]->(c)

//administers
MATCH (d:departments), (z:degrees)
where d.dcode=z.dcode 
CREATE (d)-[:administers]->(z)

//major
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vShYSEUl5j9HpV0GngP4AIk_3wlIfQXK-OF3zCxiL6TkDZ69ultb734LN5LPBq9oKAfcl-T1iqQkS1q/pub?gid=995703209&single=true&output=csv'
 AS line
MATCH (s:students {snum: line.snum}), (z:degrees {name:line.name,level:line.level})
CREATE (s)-[:major]->(z)

//minor
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQEhGIicNxhMTy6z0bpzPZIlSneFOorg0Sp6ApOFlHf0uz3aNuZAHB1KoXNssjqrGPksWXjEdBJeZ1j/pub?gid=1971279781&single=true&output=csv'
 AS line
MATCH (s:students {snum: line.snum}), (z:degrees {name:line.name,level:line.level})
CREATE (s)-[:minor]->(z)

//registers
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vT7DgJc6JrTXz0JI5QUy4Vf8EbUipytjzLBLTRYe9qCQai62-4wxQFAnW5VUzHI0YZcKzt3_aGZS_GD/pub?gid=147295713&single=true&output=csv' AS line
MATCH (s:students {snum: line.snum}), (c:courses {number:line.course_number})
CREATE (s)-[:registers {regtime:line.regtime,grade:line.grade}]->(c)


