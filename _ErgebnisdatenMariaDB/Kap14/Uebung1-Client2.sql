

USE Uebungen;

BEGIN;
SELECT * FROM t_lager;

SELECT * FROM t_lager;

-- Beachten Sie: der Aufruf der 2.SELECT-Anweisung wird erst ausgef�hrt,  
--               wenn im anderen Client die COMMIT-Anweisung ausgef�hrt wird. 
--               Der 2. Client bleibt solang in einem Wartezustand.
