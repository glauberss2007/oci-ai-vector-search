-- Remove a tabela t1 se ela existir para evitar erros ao criar a tabela.
drop table if exists t1;

-- Cria uma nova tabela t1 com uma coluna v do tipo vetor se ela ainda não existir.
create table if not exists t1 (v vector);

-- Descreve a estrutura da tabela t1 (mostrando colunas e tipos).
desc t1;

-- Insere várias linhas na tabela t1 com valores de vetor.
insert into t1 values 
    ('[1.1, 2.7, 3.1415]'),  -- Insere um vetor com 3 números de ponto flutuante
    ('[9.34, 0.0, -6.923]'),  -- Insere um vetor com 3 números de ponto flutuante
    ('[-2.01, 5, -25.8]'),    -- Insere um vetor com 3 números de ponto flutuante
    ('[-8.2, -5, -1013.6]'),  -- Insere um vetor com 3 números de ponto flutuante
    ('[7.3]'),                -- Insere um vetor com um único número de ponto flutuante
    ('[2.9]'),                -- Insere um vetor com um único número de ponto flutuante
    ('[1, 2, 3, 4, 5]');      -- Insere um vetor com 5 números inteiros

-- Seleciona todas as linhas da tabela t1 para exibir os vetores inseridos.
select * from t1;