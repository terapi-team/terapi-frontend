---------------------------
-- CONSULTAS INTERESANTES
---------------------------

---------------------------------------------------------------------
-- 📌 [01] Citas de cada paciente con nombre del terapeuta y estado
---------------------------------------------------------------------
SELECT
  p.id AS paciente_id,
  u_p.nombre AS nombre_paciente,
  t.id AS terapeuta_id,
  u_t.nombre AS nombre_terapeuta,
  c.fecha,
  c.hora,
  c.estado,
  c.modalidad,
  c.tipo
FROM Cita c
JOIN Paciente p ON c.paciente_id = p.id
JOIN Usuario u_p ON p.usuario_id = u_p.id
JOIN Terapeuta t ON c.terapeuta_id = t.id
JOIN Usuario u_t ON t.usuario_id = u_t.id
ORDER BY c.fecha, c.hora;

------------------------------------------------------------
-- 📌 [02] Promedio de puntaje recibido por cada terapeuta
------------------------------------------------------------
SELECT
  t.id AS terapeuta_id,
  u.nombre AS nombre_terapeuta,
  ROUND(AVG(r.puntaje), 2) AS promedio_puntaje,
  COUNT(r.id) AS cantidad_resenias
FROM Resenia r
JOIN Terapeuta t ON r.terapeuta_id = t.id
JOIN Usuario u ON t.usuario_id = u.id
GROUP BY t.id, u.nombre
ORDER BY promedio_puntaje DESC;

-----------------------------------------------------
-- 📌 [03] Pacientes con más de 2 citas registradas
-----------------------------------------------------
SELECT
  p.id AS paciente_id,
  u.nombre AS nombre_paciente,
  COUNT(c.id) AS total_citas
FROM Cita c
JOIN Paciente p ON c.paciente_id = p.id
JOIN Usuario u ON p.usuario_id = u.id
GROUP BY p.id
HAVING COUNT(c.id) > 2
ORDER BY total_citas DESC;

--------------------------------------------------------
-- 📌 [04] Terapeutas que atienden en modalidad Online
--------------------------------------------------------
SELECT DISTINCT
  t.id AS terapeuta_id,
  u.nombre AS nombre_terapeuta
FROM Cita c
JOIN Terapeuta t ON c.terapeuta_id = t.id
JOIN Usuario u ON t.usuario_id = u.id
WHERE c.modalidad = 'Video'
ORDER BY u.nombre;

-----------------------------------------------------
-- 📌 [05] Métodos de pago registrados por paciente
-----------------------------------------------------
SELECT
  p.id AS paciente_id,
  u.nombre AS nombre_paciente,
  COUNT(m.id) AS cantidad_tarjetas,
  GROUP_CONCAT(DISTINCT m.tipo) AS tipos_tarjeta
FROM MetodoPago m
JOIN Paciente p ON m.paciente_id = p.id
JOIN Usuario u ON p.usuario_id = u.id
GROUP BY p.id
ORDER BY cantidad_tarjetas DESC;
