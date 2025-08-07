SET @saved_cs_client = @@character_set_client;
SET character_set_client = utf8mb4;

Use uebungen;


DROP TABLE IF EXISTS t_artikel;
CREATE TABLE t_artikel (
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(30) NOT NULL,
    lieferant INTEGER,
    bemerkung VARCHAR(100),
    PRIMARY KEY(id),
    UNIQUE namecodeindex (name, code)
);
INSERT INTO t_artikel VALUES
    (22,'Bleistift','3423',1,NULL),
    (23,'Bleistift','3123',1,NULL),
    (33,'Füllhalter P1','4346',1,NULL),
    (35,'Füllhalter P','4344',2,NULL),
    (38,'Füllhalter P2 Rechtshänder','4322',1,NULL),
    (43,'Kugelschreiber','5232',2,NULL),
    (44,'Kugelschreiber','5223',2,NULL),
    (45,'Bleistift HB (10 Stück)','4342',1,NULL),
    (46,'Füllhalter P2 Linkshänder','4323',1,NULL),
    (47,'Füllhalter','4333',2,NULL),
    (48,'Kugelschreiber','5222',2,NULL),
    (49,'Kugelschreiber','5233',3,NULL),
    (50,'Fineliner (10 Stück)','4444',2,NULL)
;

INSERT INTO t_artikel (name, code) VALUES ('Kugelschreiber KG1','5232'); -- führt zu einem fehler ( duplicate entry)

INSERT INTO t_artikel (name, code) VALUES ('Kugelschreiber','5232');



exit 

DROP TABLE IF EXISTS t_ma_proj;
CREATE TABLE t_ma_proj (
    ma_id INTEGER NOT NULL,
    proj_id INTEGER NOT NULL,
    FOREIGN KEY (ma_id) REFERENCES t_ma (id) ON DELETE CASCADE,
    FOREIGN KEY (proj_id) REFERENCES t_proj (id) ON DELETE CASCADE
);
INSERT INTO t_ma_proj VALUES (2,1),(5,1),(8,1),(11,1),(36,4),(48,4);

INSERT INTO t_proj (name, beginn, ende) VALUES ( 'EDV', '2025-06-01', '2025-08-01' );
INSERT INTO t_ma_proj VALUES (5,5);

INSERT INTO t_proj  VALUES (10, 'EDV', '2025-06-01', '2025-08-01' );



-- DELETE FROM t_proj WHERE id > 5; beispiel 

----------------------------------- Index ------------------------
CREATE INDEX i_ma_name ON t_ma (name);  -- Kreiert eine Index auf ein bestimmtes Datenfeld einer Tabelle
SHOW INDEX FROM t_ma; -- Zeigt die Indizes einer bestimmten Tabelle
 
DROP INDEX i_ma_name ON t_ma; -- Löscht einen Index einer bestimmten Tabelle
ALTER TABLE t_ma DROP INDEX i_ma_name; -- Löscht einen Index einer bestimmten Tabelle




