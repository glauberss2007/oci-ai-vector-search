-- Cria a tabela vt1 se não existir, com coluna id (número não nulo) e coluna v (vetor 2D do tipo float32)
create table if not exists vt1 (
    id number not null,          -- coluna id que não pode ser nula
    v vector(2, float32),       -- coluna v que armazena vetores de 2 dimensões do tipo float32
    primary key (id)            -- define a coluna id como chave primária
);

-- Descreve a estrutura da tabela vt1
desc vt1;

-- Insere vários valores na tabela vt1
insert into vt1 values 
    (1, '[3,3]'),
    (2, '[5,3]'),
    (3, '[7,3]'),
    (4, '[3,5]'),
    (5, '[5,5]'),
    (6, '[7,5]'),
    (7, '[3,7]'),
    (8, '[5,7]'),
    (9, '[7,7]');

-- Confirma as alterações feitas na transação
commit;

-- Seleciona todos os registros da tabela vt1 e ordena pelo id
select * from vt1 order by id;

-- Seleciona os ids das linhas com a menor distância euclidiana do vetor (5,0) e retorna as 3 primeiras
select id from vt1 order by vector_distance(vector('[5,0]'), v, euclidean) fetch first 3 rows only;

-- Seleciona os ids com a menor distância do vetor (3,0) e retorna as 3 primeiras
select id from vt1 order by vector_distance(vector('[3,0]'), v, euclidean) fetch first 3 rows only;

-- Seleciona os ids com a menor distância do vetor (7,0) e retorna as 3 primeiras
select id from vt1 order by vector_distance(vector('[7,0]'), v, euclidean) fetch first 3 rows only;

-- Seleciona os ids com a menor distância do vetor (10,7) e retorna as 3 primeiras
select id from vt1 order by vector_distance(vector('[10,7]'), v, euclidean) fetch first 3 rows only;

-- Seleciona os ids com a menor distância do vetor (3,9) e retorna as 3 primeiras
select id from vt1 order by vector_distance(vector('[3,9]'), v, euclidean) fetch first 3 rows only;

-- Seleciona os ids com a menor distância do vetor (0,0) e retorna as 3 primeiras
select id from vt1 order by vector_distance(vector('[0,0]'), v, euclidean) fetch first 3 rows only;

-- Seleciona os ids com a menor distância do vetor (5,5) e retorna os 5 primeiros
select id from vt1 order by vector_distance(vector('[5,5]'), v, euclidean) fetch first 5 rows only;

-- Seleciona os ids com a menor distância do vetor (3.1,6.9) e retorna os 4 primeiros
select id from vt1 order by vector_distance(vector('[3.1,6.9]'), v, euclidean) fetch first 4 rows only;

-- Seleciona os ids com a menor distância do vetor (20,1) e retorna os 10 primeiros
select id from vt1 order by vector_distance(vector('[20,1]'), v, euclidean) fetch first 10 rows only;

-- Insere mais valores na tabela vt1
insert into vt1 values 
    (21, '[9,-1]'),
    (22, '[10,-1]'),
    (23, '[11,-1]'),
    (24, '[9,-3]'),
    (25, '[10,-4]'),
    (26, '[12,-3]');
    
-- Insere ainda mais valores na tabela vt1
insert into vt1 values 
    (31, '[13,6]'),
    (32, '[14,7]'),
    (33, '[14,4]'),
    (34, '[16,6]');
    
-- Insere valores adicionais na tabela vt1
insert into vt1 values 
    (41, '[0,7]'),
    (42, '[1,7]'),
    (43, '[1,6]'),
    (44, '[0,5]'),
    (45, '[1,5]'),
    (55, '[7,11]');  -- Insere o último conjunto de valores na tabela vt1

-- Confirma as alterações feitas nas inserções
COMMIT;

-- Seleciona todos os registros da tabela vt1 para visualizar os dados inseridos
select * from vt1;

-- Seleciona os ids das linhas com a menor distância euclidiana do vetor (16,4) e retorna as 3 primeiras
select id from vt1 order by vector_distance(vector('[16,4]'), v, euclidean) fetch first 3 rows only;

-- Seleciona os ids com a menor distância do vetor (7,-5) e retorna os 5 primeiros
select id from vt1 order by vector_distance(vector('[7,-5]'), v, euclidean) fetch first 5 rows only;

-- Seleciona os ids com a menor distância do vetor (6,10) e retorna os 5 primeiros
select id from vt1 order by vector_distance(vector('[6,10]'), v, euclidean) fetch first 5 rows only;

-- Seleciona os ids com a menor distância do vetor (-1,6) e retorna os 5 primeiros
select id from vt1 order by vector_distance(vector('[-1,6]'), v, euclidean) fetch first 5 rows only;

-- Seleciona os ids com a menor distância do vetor (6,8) e retorna os 4 primeiros
select id from vt1 order by vector_distance(vector('[6,8]'), v, euclidean) fetch first 4 rows only;

-- Seleciona os ids com a menor distância do vetor (2.5,8.5) e retorna os 4 primeiros
select id from vt1 order by vector_distance(vector('[2.5,8.5]'), v, euclidean) fetch first 4 rows only;