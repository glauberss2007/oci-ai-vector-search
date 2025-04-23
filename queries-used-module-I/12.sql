-- Converte a string '[34.6,77.8]' em um vetor de dimensão 2 do tipo float32
select to_vector('[34.6,77.8]',2,float32) from dual;

-- Converte a string '[34.6,77.8,-89.34]' em um vetor de dimensão 3 do tipo float32
select to_vector('[34.6,77.8,-89.34]',3,float32);

-- Calcula a norma do vetor '[4,3]' usando a dimensão 2 e tipo float32
select vector_norm(vector('[4,3]',2,float32));

-- Calcula a norma do vetor '[4,3]' usando a dimensão 2 e tipo float64
select vector_norm(vector('[4,3]',2,float64));

-- Calcula a norma do vetor '[4,3]' usando a dimensão 2 e tipo int8
select vector_norm(vector('[4,3]',2,int8));

-- Conta o número de dimensões do vetor '[34.6,77.8]' usando a dimensão 2 e tipo float64
select vector_dimension_count(vector('[34.6,77.8]',2,float64));

-- Conta o número de dimensões do vetor '[34.6,77.8,9]' usando a dimensão 3 e tipo float32
select vector_dimension_count(vector('[34.6,77.8,9]',3,float32));

-- Conta o número de dimensões do vetor '[34.6,77.8,9,10]' usando a dimensão 3 e tipo int8
select vector_dimension_count(vector('[34.6,77.8,9,10]',3,int8));

-- Formata o vetor '[34.6,77.8]' usando a dimensão 2 e tipo float64
select vector_dimension_format(vector('[34.6,77.8]',2,float64));

-- Formata o vetor '[34.6,77.8,9]' usando a dimensão 3 e tipo float32
select vector_dimension_format(vector('[34.6,77.8,9]',3,float32));

-- Serializa o vetor '[1.1,2.2,3.3]' usando a dimensão 3 e tipo float32
select vector_serialize(vector('[1.1,2.2,3.3]',3,float32));

-- Serializa o vetor '[1.1,2.2,3.3]' retornando um varchar2 com tamanho máximo de 1000
select vector_serialize(vector('[1.1,2.2,3.3]',3,float32) returning varchar2(1000));

-- Serializa o vetor '[1.1,2.2,3.3]' retornando um clob
select vector_serialize(vector('[1.1,2.2,3.3]',3,float32) returning clob);

-- Converte o vetor '[1.1,2.2,3.3]' de volta para sua representação original
select from_vector(vector('[1.1,2.2,3.3]',3,float32));

-- Converte o vetor '[1.1,2.2,3.3]' de volta para sua representação original, retornando um varchar2 com tamanho máximo de 1000
select from_vector(vector('[1.1,2.2,3.3]',3,float32) returning varchar2(1000));

-- Converte o vetor '[1.1,2.2,3.3]' de volta para sua representação original, retornando um clob
select from_vector(vector('[1.1,2.2,3.3]',3,float32) returning clob);

commit;