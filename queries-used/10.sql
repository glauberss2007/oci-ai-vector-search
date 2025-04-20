-- Elimina a tabela vt2 se ela já existir
drop table if exists vt2;

-- Cria a tabela vt2 a partir da tabela vt1
create table vt2 as select * from vt1;

-- Adiciona colunas para tamanho (vsize), forma (shape) e cor (color) à tabela vt2
alter table vt2 add (vsize varchar2(16), shape varchar2(16), color varchar2(16));

-- Exibe a estrutura da tabela vt2
desc vt2;

-- Atualiza a coluna vsize com o valor 'Small' para os ids especificados
update vt2 set vsize = 'Small' where id in (1,4,6,8,9,21,23,26,33,44,45,52);

-- Atualiza a coluna vsize com o valor 'Medium' para os ids especificados
update vt2 set vsize = 'Medium' where id in (5,22,25,32,34,42,43,53,54,55);

-- Atualiza a coluna vsize com o valor 'Large' para os ids especificados
update vt2 set vsize = 'Large' where id in (2,3,7,24,31,41,51);

-- Atualiza a coluna shape com o valor 'Square' para os ids especificados
update vt2 set shape = 'Square' where id in (1,3,6,42,43,54);

-- Atualiza a coluna shape com o valor 'Triangle' para os ids especificados
update vt2 set shape = 'Triangle' where id in (2,4,7,22,31,41,44,55);

-- Atualiza a coluna shape com o valor 'Oval' para os ids especificados
update vt2 set shape = 'Oval' where id in (5,8,9,21,23,24,25,26,32,33,34,45,51,52,53);

-- Atualiza a coluna color com o valor 'Red' para os ids especificados
update vt2 set color = 'Red' where id in (5,8,24,26,33,34,42,44,45,53,54,55);

-- Atualiza a coluna color com o valor 'Green' para os ids especificados
update vt2 set color = 'Green' where id in (1,4,6,21,31,52);

-- Atualiza a coluna color com o valor 'Blue' para os ids especificados
update vt2 set color = 'Blue' where id in (2,3,7,9,22,23,25,32,41,43,51);

-- Seleciona o id, vsize, shape, color e v da tabela vt2, ordenado por id
select id, vsize, shape, color, v from vt2 order by id;

-- Conta o número de ocorrências de cada vsize na tabela vt2
select vsize, count(vsize) from vt2 group by vsize;

-- Conta o número de ocorrências de cada color na tabela vt2
select color, count(color) from vt2 group by color;

-- Seleciona id, vsize, shape, color e a distância euclidiana a partir de um vetor, filtrando por id e limitando a 3 resultados
select id, vsize, shape, color, to_number(vector_distance(vector('[16,3]'),v,euclidean)) distance from vt2 where id > 30 and id < 40 order by vector_distance(vector('[16,3]'),v,euclidean) fetch first 3 rows only;

-- Seleciona id, vsize, shape, color e v da tabela vt2, ordenado pela distância euclidiana a partir de um vetor, limitando a 10 resultados
select id, vsize, shape, color, v from vt2 order by vector_distance(VECTOR('[6,8]'),v,euclidean) fetch first 10 rows only;

-- Seleciona id, vsize, shape, color e v da tabela vt2 onde a cor é 'Red', ordenado pela distância euclidiana
select id, vsize, shape, color, v from vt2 where color = 'Red' order by vector_distance(VECTOR('[6,8]'),v,euclidean) fetch first 10 rows only;

-- Seleciona id, vsize, shape, color e v da tabela vt2 onde a cor é 'Red' e a forma é 'Oval', ordenado pela distância euclidiana
select id, vsize, shape, color, v from vt2 where color = 'Red' and shape = 'Oval' order by vector_distance(VECTOR('[6,8]'),v,euclidean) fetch first