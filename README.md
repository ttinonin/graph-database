# Graph Database (Neo4j)

## Coleções

Foram utilizadas as seguintes coleções se baseando no projeto anterior:

- Curso
- Disciplina
- Aluno
- Professor
- Departamento

**Relações**

- Disciplina PERTENCE A Curso
- Aluno CURSOU EM Disciplina
- Professor MINISTROU EM Disciplina
- Professor CHEFE DE Deparamento
- Professor PERTENCE A Departamento
- Professor ORIENTOU A Aluno

## Coleções

As queries para criação das tabelas necessarias encontram-se no arquivo `colecoes.cypher`, o mesmo já possui o código para extrair dados do banco relacional usado no projeto anterior, lendo arquivos `.csv` que estão dentro da pasta `import` que deve ser configurado dentro do ambiente Neo4j Desktop.

## Queries

As queries que resolvem os itens de busca, se encontram no arquivo `queries.cypher`.

## Integrantes do Grupo

| Nome  | RA |
| ------------- | ------------- |
| Angelo Gabriel Vasconcelos Baptista  | 22.122.081-7  |
| Thiago Monteiro Tinonin  | 22.122.044-5  |