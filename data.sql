-- Crear la tabla de instritos

CREATE TABLE IF NOT EXISTS INSCRITOS(
	cantidad INT, 
	fecha DATE, 
	fuente VARCHAR);
	
-- Insertar datos en la tabla

INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );

-- Mostrar los registros de la tabla

SELECT * FROM inscritos;

-- ¿Cuántos registros hay?

SELECT COUNT(*) AS total_registros FROM inscritos;

-- ¿Cuántos inscritos hay en total?

SELECT SUM(cantidad) AS total_inscritos FROM inscritos;

-- ¿Cuál o cuáles son los registros de mayor antigüedad?

SELECT * FROM inscritos
ORDER BY fecha DESC LIMIT 5;

SELECT *
FROM inscritos
WHERE fecha = (
SELECT MAX(fecha)
FROM inscritos
);

-- ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante)

SELECT fecha, SUM(cantidad) AS inscritos_por_dia
FROM inscritos
GROUP BY fecha
ORDER BY fecha DESC;

-- ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?

SELECT fecha, SUM(cantidad) AS cantidad_personas
FROM inscritos
GROUP BY fecha
HAVING SUM(cantidad) = (
SELECT MAX(total_inscritos)
FROM (
SELECT SUM(cantidad) AS total_inscritos
FROM inscritos
GROUP BY fecha
) AS inscritos_totales
);
