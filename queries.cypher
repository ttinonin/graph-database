MATCH (a:Aluno)-[r:CURSOU_EM]->(d:Disciplina)
WHERE a.id = 2
RETURN d.id AS disciplina_id, d.nome AS disciplina_nome, r.semestre AS semestre, r.ano AS ano, r.nota AS nota;

MATCH (p:Professor)-[r:MINISTROU_EM]->(d:Disciplina) 
WHERE p.id = 2 
RETURN p.nome AS nome_professor, r.semestre AS semestre, r.ano AS ano;

MATCH (p:Professor)-[r:CHEFE_DE]->(d:Departamento) 
RETURN p.nome AS nome_professor, d.nome AS nome_departamento;

MATCH (p:Professor)-[r:ORIENTOU_A]->(a:Aluno) 
RETURN p.nome AS nome_orientador, a.nome AS nome_aluno, r.grupo;

MATCH (a:Aluno)-[r:CURSOU_EM]->(d:Disciplina)
WHERE r.nota >= 5 AND r.ano = 2020 AND r.semestre = 2 
AND EXISTS {
    MATCH (p:Professor)-[:ORIENTOU_A]->(a)
    return p
}
RETURN a.nome AS formados;