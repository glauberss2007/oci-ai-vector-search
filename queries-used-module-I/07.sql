-- Cria a tabela t5 se não existir, com diferentes tipos de vetores
create table if not exists t5 (
    v1 vector(3, float32),  -- vetor de 3 elementos do tipo float32
    v2 vector(2, float64),  -- vetor de 2 elementos do tipo float64
    v3 vector(1, int8),     -- vetor de 1 elemento do tipo int8
    v4 vector(1,*),         -- vetor de 1 elemento com tipo indefinido
    v5 vector(*, float32),  -- vetor de tamanho variável com tipo float32
    v6 vector(*,*),         -- vetor de tamanho totalmente variável
    v7 vector               -- vetor com tipo indefinido
);

-- Descreve a estrutura da tabela t5
desc t5;

-- Insere um registro na tabela t5 com valores para cada coluna
insert into t5 values (
    '[1.1,2.2,3.3]',          -- v1
    '[1.1,2.2]',              -- v2
    '[7]',                    -- v3
    '[9]',                    -- v4
    '[1.1,2.2,3.3,4.4,5.5]',  -- v5
    '[1.1,2.2]',              -- v6
    '[1.1,2.2,3.3,4.4,5.5,6.6]' -- v7
);

-- Seleciona todos os registros da tabela t5
select * from t5;

-- Cria a tabela t6 se não existir, com id e nome
create table if not exists t6 (
    id number not null,              -- coluna id que não pode ser nula
    name varchar(32),                -- coluna name do tipo varchar com tamanho 32
    primary key (id)                 -- define a coluna id como chave primária
);

-- Adiciona uma coluna v1 do tipo vetor à tabela t6
alter table t6 add v1 vector;

-- Adiciona uma coluna v2 do tipo vetor(2, float32) à tabela t6
alter table t6 add v2 vector(2, float32);

-- Descreve a estrutura da tabela t6
desc t6;

-- Remove a coluna v2 da tabela t6
alter table t6 drop column v2;

-- Descreve a estrutura da tabela t6 após a remoção da coluna v2
desc t6;

-- Remove a tabela t6 se existir
drop table if exists t6;

-- Remove a tabela t7 se existir
drop table if exists t7;

-- Cria a tabela t7 como uma cópia da tabela t3
create table if not exists t7 as select * from t3;

-- Descreve a estrutura da tabela t7
desc t7;

-- Descreve a estrutura da tabela t3
desc t3;

-- Seleciona todos os registros da tabela t7
select * from t7;