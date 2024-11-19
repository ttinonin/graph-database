LOAD CSV WITH HEADERS FROM 'file:///projeto_table_cursos.csv' AS linha
CREATE (:Curso {id: toInteger(linha.id), nome: linha.nome, semestres: linha.semestres});

LOAD CSV WITH HEADERS FROM 'file:///projeto_table_disciplinas.csv' AS linha
CREATE (:Disciplina {id: toInteger(linha.id), nome: linha.nome, curso_id: linha.curso_id});

LOAD CSV WITH HEADERS FROM 'file:///projeto_table_disciplinas.csv' AS linha
MATCH (c:Curso {id: toInteger(linha.curso_id)})
MATCH (d:Disciplina {id: toInteger(linha.id)})
CREATE (d)-[:PERTENCE_A]->(c);

LOAD CSV WITH HEADERS FROM 'file:///projeto_table_alunos.csv' AS linha
CREATE (:Aluno {id: toInteger(linha.id), nome: linha.nome, email: linha.email});

LOAD CSV WITH HEADERS FROM 'file:///projeto_table_alunos_cursou.csv' AS linha
MATCH (a:Aluno {id: toInteger(linha.aluno_id)})
MATCH (d:Disciplina {id: toInteger(linha.disciplina_id)})
CREATE (a)-[:CURSOU_EM {semestre: toInteger(linha.semestre), ano: toInteger(linha.ano), nota: toInteger(linha.nota)}]->(d);

LOAD CSV WITH HEADERS FROM 'file:///projeto_table_professores.csv' AS linha
CREATE (:Professor {id: toInteger(linha.id), nome: linha.nome, email: linha.email, salario: linha.salario, departamento_id: linha.departamento_id});

LOAD CSV WITH HEADERS FROM 'file:///projeto_table_disciplinas_ministradas.csv' AS linha
MATCH (p:Professor {id: toInteger(linha.professor_id)})
MATCH (d:Disciplina {id: toInteger(linha.disciplina_id)})
CREATE (p)-[:MINISTROU_EM {semestre: toInteger(linha.semestre), ano: toInteger(linha.ano)}]->(d);

LOAD CSV WITH HEADERS FROM 'file:///projeto_table_departamentos.csv' AS linha
CREATE (:Departamento {id: toInteger(linha.id), nome: linha.nome, chefe_id: linha.chefe_id});

LOAD CSV WITH HEADERS FROM 'file:///projeto_table_departamentos.csv' AS linha
MATCH (p:Professor {id: toInteger(linha.chefe_id)})
MATCH (d:Departamento {id: toInteger(linha.id)})
CREATE (p)-[:CHEFE_DE]->(d);

LOAD CSV WITH HEADERS FROM 'file:///projeto_table_professores.csv' AS linha
MATCH (p:Professor {id: toInteger(linha.id)})
MATCH (d:Departamento {id: toInteger(linha.departamento_id)})
CREATE (p)-[:PERTENCE_A]->(d);

LOAD CSV WITH HEADERS FROM 'file:///projeto_table_alunos_tcc.csv' AS linha
MATCH (a:Aluno {id: toInteger(linha.aluno_id)})
MATCH (p:Professor {id: toInteger(linha.orientador_id)})
CREATE (p)-[:ORIENTOU_A {grupo: toInteger(linha.grupo)}]->(a);