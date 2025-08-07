SET @saved_cs_client = @@character_set_client;
SET character_set_client = utf8mb4;

use uebungen;

DROP VIEW IF EXISTS v_ma_abt1;

CREATE VIEW v_ma_abt1 AS SELECT abtnr, vname, name FROM t_ma WHERE abtnr = 1;
-- Eine Sicht (View) mit dem Namen v_ma_abt1 auf dem Server speichern

SELECT * FROM v_ma_abt1; -- Sicht v_ma_abt1 aufrufen (ausführen)

SELECT * FROM v_ma_abt1 WHERE name = 'Meyer';
# SELECT * FROM v_ma_abt1 WHERE ort = '60323'; -- geht nicht, da 'ort' nicht in der Sicht enthalten ist, oder die spalte plz nicht beeinthaltet ist 


DROP VIEW v_ma_abt1; -- Löscht die Sicht (View) v_ma_abt1 vom Server


-- Sicht über mehrere Tabellen
DROP VIEW IF EXISTS v_ma_proj;
CREATE VIEW v_ma_proj (MitarbeiterNr, Mitarbeitername, ProjektNr, Projektname) AS
SELECT m.id, m.name, p.id, p.name FROM t_ma_proj mp
    INNER JOIN t_ma m ON mp.ma_id = m.id
    INNER JOIN t_proj p ON mp.proj_id = p.id;


SHOW FULL TABLES IN uebungen WHERE TABLE_TYPE = 'view'; -- Zeigt alle Sichten (View's) der Datenbank an
SHOW FULL TABLES IN uebungen WHERE TABLE_TYPE LIKE 'view'; -- Zeigt alle Sichten (View's) der Datenbank an
SHOW FULL COLUMNS FROM v_ma_proj; -- Zeigt die Definition eines Views
SHOW TABLES;  -- Zeigt alle Tabellen und View's der Datenbank an
 
DROP VIEW v_ma_proj; -- Löscht die Sicht (View) v_ma_proj vom Server

DROP VIEW IF EXISTS v_ma_abt;
CREATE VIEW v_ma_abt AS SELECT id, vname, name, abtnr FROM t_ma; -- Eine Sicht (View) mit dem Namen v_ma_abt auf dem Server speichern
SELECT * FROM v_ma_abt WHERE id = 69;
 
UPDATE v_ma_abt SET abtnr = 1 WHERE id = 69; -- Update auf das VIEW
UPDATE v_ma_abt SET abtnr = 3 WHERE id = 69; -- Update auf das VIEW
 
INSERT INTO v_ma_abt (id, name, vname, abtnr) VALUES (102, 'Melzer', 'Martin', 1); -- Daten einfügen über ein View
INSERT INTO v_ma_abt (name, vname, abtnr) VALUES ('Melzer', 'Karin', 2); -- Daten einfügen über ein View
-- INSERT INTO t_ma (name, vname, abtnr) VALUES ('Melzer', 'Karin', 2); -- Daten direkt in die Tabelle schreiben
 
DELETE FROM v_ma_abt WHERE id = 103; -- Löscht einen Datensatz über das View
# DROP VIEW v_ma_abt;

DROP VIEW IF EXISTS v_ma_abt1;
CREATE VIEW v_ma_abt1 AS SELECT * FROM t_ma WHERE abtnr = 1 WITH CHECK OPTION;
-- Es wird eine Sicht erstellt, die entsprechend der Bedingung in der Abfrage prüft, ob bei Änderungsoperationen im Datenfeld abtnr der Wert 1 angegeben wurde
 
# INSERT INTO v_ma_abt1 (id, name, vname, abtnr) VALUES(103, 'Funke', 'Franziska', 2);
-- Ünmögliche Anweisung weil durch die CHECK OPTION nur Abfragen zugelassen werden die die abtnr 1 enthalten
 
INSERT INTO v_ma_abt1 (id, name, vname, abtnr) VALUES(103, 'Funke', 'Franziska', 1);
-- Mögliche Anweisung
 
DROP VIEW v_ma_abt1;
