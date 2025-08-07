SET @saved_cs_client     = @@character_set_client; 
SET character_set_client = utf8mb4; 

/* 
    1. Erstellen Sie in der Datenbank Uebungen einen neuen Trigger trig_summe_artikel_update.
    2. Der Trigger soll die Summe der Stückzahlen und Preise aller Artikel am Lager berechnen, wenn ein Daten-satz in der Tabelle t_lager aktualisiert wird.
    3. Berechnen Sie die Summen mithilfe einer Aggregatfunktion.
    4. Speichern Sie die Werte in der Tabelle t_summe_lager. Löschen Sie gegebenenfalls alte Einträge in der Tabelle.
    5. Prüfen Sie die Funktionsfähigkeit, indem Sie einige Stückzahlen und Preise in der Tabelle verändern.
    6. Berechnen Sie die Summen mit einer SELECT-Abfrage und vergleichen Sie das Ergebnis mit den Werten in der Tabelle t_summe_lager.
    7. Erstellen Sie den gleichen Trigger für die DELETE-Aktion.
*/


USE uebungen;

DELIMITER //
CREATE TRIGGER trig_summe_artikel_update AFTER UPDATE
  ON t_lager FOR EACH ROW BEGIN
    DECLARE summe_stueck INTEGER;
    DECLARE summe_preis FLOAT;
        
	SELECT SUM(stueck), SUM(preis) FROM t_lager 
    INTO summe_stueck, summe_preis;
    DELETE FROM t_summe_lager;
    INSERT INTO t_summe_lager VALUES(summe_stueck, summe_preis);
    END //
DELIMITER ;

SELECT * FROM t_summe_lager;
UPDATE t_lager SET stueck = 200, preis = 21 WHERE id = 51;
SELECT * FROM t_summe_lager;

-- Ueberpruefung mit SELECT-Anweisung:
SELECT SUM(stueck), SUM(preis) FROM t_lager;

DELIMITER //
CREATE TRIGGER trig_summe_artikel_delete  AFTER DELETE
  ON t_lager FOR EACH ROW BEGIN
    DECLARE summe_stueck INTEGER;
    DECLARE summe_preis FLOAT;
     SELECT SUM(stueck), SUM(preis) FROM t_lager 
       INTO summe_stueck, summe_preis;
     DELETE FROM t_summe_lager;
     INSERT INTO t_summe_lager VALUES(summe_stueck, summe_preis);
    END; //
DELIMITER ;

SELECT * FROM t_summe_lager;
UPDATE t_lager SET stueck = 0 WHERE id = 51;
DELETE FROM t_lager WHERE id = 51;
SELECT * FROM t_summe_lager;