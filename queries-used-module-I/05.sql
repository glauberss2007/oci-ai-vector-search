-- Cria a tabela t2 se não existir, com colunas ID, nome e v1
-- ID é uma chave primária e não pode ser nulo, nome é uma string com um comprimento máximo de 32 caracteres,
-- e v1 é um tipo de vetor (tipo de dado para operações matemáticas vetoriais).
create table if not exists t2 ( 
    ID number not null, 
    name varchar2(32), 
    v1 vector, 
    primary key (id)
);

-- Descreve a estrutura da tabela t2
desc t2;

-- Insere várias linhas na tabela t2
-- Cada linha consiste em um ID, um nome e um vetor v1
insert into t2 values 
    (1, 'A', '[1.1]'),
    (2, 'B', '[2.2]'),
    (3, 'C', '[3.3]'),
    (4, 'D', '[4.4]'),
    (5, 'E', '[5.5]');

-- Seleciona todos os registros da tabela t2 para verificar as inserções
select * from t2;

-- Atualiza o valor de v1 para o registro com ID 2
update T2 set v1 = '[2.9]' where id = 2;

-- Seleciona o registro com ID 2 para verificar a atualização
select * from t2 where id = 2;

-- Deleta registros da tabela t2 onde os IDs são 1 e 3
delete from t2 where id in (1, 3);

-- Seleciona todos os registros da tabela t2 para verificar as exclusões
select * from t2;

-- Cria a tabela t3 se não existir, com várias colunas de vetor
-- Esta tabela inclui ID, nome e três colunas de vetor (v1, v2, v3)
create table if not exists t3 ( 
    id number not null, 
    name varchar2(32), 
    v1 vector, 
    v2 vector, 
    v3 vector, 
    primary key (id)
);

-- Descreve a estrutura da tabela t3
desc t3;

-- Insere um registro na tabela t3 com ID, nome e três valores vetoriais
insert into t3 values 
    (1, 'One', '[2.3,4.5,0.1]', '[1.3]', '[4.981, -6.3]');

-- Seleciona todos os registros da tabela t3 para verificar a inserção
select * from t3;

-- Cria a tabela t4 se não existir, com uma única coluna de vetor contendo 3 elementos float32
create table if not exists t4 ( 
    v vector(3, float32) 
);

-- Descreve a estrutura da tabela t4
desc t4;

-- Insere vários registros na tabela t4
-- Os valores são vetores; no entanto, alguns deles não atendem aos requisitos do vetor
insert into t4 values ('[1.1,2.2,3.3]');
insert into t4 values ('[1.2,2.3,3.4]');
insert into t4 values ('[1.2,2.3,3.4]');
insert into t4 values ('[1.3]');
insert into t4 values ('[1.3, 2.4,3.5,4.1]'); -- Isso pode causar um erro devido ao número incorreto de elementos
insert into t4 values ('[1.4,2.5,a]'); -- Isso pode causar um erro devido ao valor não numérico 'a'
