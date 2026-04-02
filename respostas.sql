-- 1. Lista de Contatos
SELECT nome, telefone
FROM pacientes
ORDER BY nome;

-- 2. Faturamento Total
SELECT SUM(valor) AS faturamento_total
FROM consultas;

-- 3. Agenda do Dia
SELECT p.nome AS paciente, m.nome AS medico, c.data_hora
FROM consultas c
JOIN pacientes p ON c.paciente_id = p.id
JOIN medicos m ON c.medico_id = m.id;

-- 4. Pacientes Ausentes
SELECT p.nome
FROM pacientes p
LEFT JOIN consultas c ON p.id = c.paciente_id
WHERE c.id IS NULL;

-- 5. Especialidade Popular
SELECT m.especialidade, COUNT(*) AS total_consultas
FROM consultas c
JOIN medicos m ON c.medico_id = m.id
GROUP BY m.especialidade
ORDER BY total_consultas DESC
LIMIT 1;