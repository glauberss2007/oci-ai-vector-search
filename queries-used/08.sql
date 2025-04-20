-- Seleciona o vetor com coordenadas (0,0)
select vector('[0,0]');

-- Seleciona o vetor com coordenadas (10,0)
select vector('[10,0]');

-- Seleciona o vetor com coordenadas (0,5) e especifica que ele deve ser do tipo float32
select vector('[0,5]', 2, float32);

-- Seleciona o vetor com coordenadas (4,3)
select vector('[4,3]');

-- Seleciona o vetor com coordenadas (5,-2)
select vector('[5,-2]');

-- Seleciona o vetor com coordenadas (-3,-4)
select vector('[-3,-4]');

-- Seleciona o vetor com coordenadas (3.14, 2.718)
select vector('[3.14,2.718]');

-- Seleciona o vetor com coordenadas (-5.3,4.2)
select vector('[-5.3,4.2]');

-- Seleciona o vetor com coordenadas (-7,-9)
select vector('[-7,-9]');

-- Calcula a distância euclidiana entre os vetores (0,0) e (10,0) e a nomeia como 'distance'
select VECTOR_distance(vector('[0,0]'), vector('[10,0]'), euclidean) distance;

-- Calcula e converte a distância entre (0,0) e (10,0) para um número
select to_number(VECTOR_distance(vector('[0,0]'), vector('[10,0]'), euclidean)) distance;

-- Calcula a distância euclidiana entre os vetores (0,0) e (0,5) com tipo float32
select to_number(VECTOR_distance(vector('[0,0]', 2, float32), vector('[0,5]', 2, float32), euclidean)) distance;

-- Calcula a distância euclidiana entre os vetores (0,0) e (4,3) com tipo float32
select to_number(VECTOR_distance(vector('[0,0]', 2, float32), vector('[4,3]', 2, float32), euclidean)) distance;

-- Repete o cálculo da distância entre (0,0) e (4,3) com tipo float32
select to_number(VECTOR_distance(vector('[0,0]', 2, float32), vector('[4,3]', 2, float32), euclidean)) distance;