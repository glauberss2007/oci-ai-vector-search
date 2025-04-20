-- Elimina a tabela vt3 se ela já existir
drop table if exists vt3;

-- Cria a tabela vt3 a partir da tabela vt2
create table vt3 as select * from vt2;

-- Seleciona todos os registros da tabela vt3, ordenados pelo primeiro campo (id)
select * from vt3 order by 1;

-- Seleciona id, vsize, shape e color da tabela vt3, ordenados pela distância do vetor usando a métrica COSINE, limitando a 4 resultados
select id, vsize, shape, color from vt3 order by vector_distance(vector('[16,4]'),v,COSINE) fetch first 4 rows only;

-- Seleciona id, vsize, shape e color da tabela vt3, ordenados pela distância do vetor usando a métrica euclidiana, limitando a 4 resultados
select id, vsize, shape, color from vt3 order by vector_distance(vector('[16,4]'),v,euclidean) fetch first 4 rows only;

-- Seleciona id, vsize, shape e color da tabela vt3, ordenados pela distância do vetor usando a métrica dot, limitando a 4 resultados
select id, vsize, shape, color from vt3 order by vector_distance(vector('[16,4]'),v,dot) fetch first 4 rows only;

-- Seleciona id, vsize, shape e color da tabela vt3, ordenados pela distância do vetor usando a métrica manhattan, limitando a 4 resultados
select id, vsize, shape, color from vt3 order by vector_distance(vector('[16,4]'),v,manhattan) fetch first 4 rows only;

-- Seleciona id, vsize, shape e color da tabela vt3, ordenados pela distância do vetor usando a métrica hamming, limitando a 4 resultados
select id, vsize, shape, color from vt3 order by vector_distance(vector('[16,4]'),v,hamming) fetch first 4 rows only;

-- Seleciona id, vsize, shape e color da tabela vt3, ordenados pela distância l1 do vetor, limitando a 4 resultados
select id, vsize, shape, color from vt3 order by l1_distance(vector('[16,4]'),v) fetch first 4 rows only;

-- Seleciona id, vsize, shape e color da tabela vt3, ordenados pela distância l2 do vetor, limitando a 4 resultados
select id, vsize, shape, color from vt3 order by l2_distance(vector('[16,4]'),v) fetch first 4 rows only;

-- Seleciona id, vsize, shape e color da tabela vt3, ordenados pela distância do cosseno do vetor, limitando a 4 resultados
select id, vsize, shape, color from vt3 order by cosine_distance(vector('[16,4]'),v) fetch first 4 rows only;

-- Seleciona id, vsize, shape e color da tabela vt3, ordenados pelo produto interno do vetor, limitando a 4 resultados
select id, vsize, shape, color from vt3 order by inner_product(vector('[16,4]'),v) fetch first 4 rows only;

-- Seleciona id, vsize, shape e color da tabela vt3, ordenados pela distância bidirecional do vetor, limitando a 4 resultados
select id, vsize, shape, color from vt3 order by vector('[16,4]') <-> v fetch first 4 rows only;

-- Seleciona id, vsize, shape e color da tabela vt3, ordenados pela métrica de similaridade bidirecional do vetor, limitando a 4 resultados
select id, vsize, shape, color from vt3 order by vector('[16,4]') <=> v fetch first 4 rows only;

-- Seleciona id, vsize, shape e color da tabela vt3, ordenados pela técnica de comparação do vetor, limitando a 4 resultados
select id, vsize, shape, color from vt3 order by vector('[16,4]') <#> v fetch first 4 rows only;

-- Confirma as transações realizadas
commit;