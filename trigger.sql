-- Trigger werden automatisch ausgeführt wenn ein INSERT, UPDATE oder DELETE Kommando auf die vom Trigger überwachte Tabelle abgesetzt wird
 
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
 
USE uebungen;
 
CREATE TABLE IF NOT EXISTS t_summe_lager (summe_stueck INTEGER, summe_preis FLOAT); -- Erstellt eine neue Tabelle t_summe_lager
 
DROP TRIGGER IF EXISTS trig_summe_artikel;

DELIMITER //
CREATE TRIGGER trig_summe_artikel AFTER INSERT ON t_lager FOR EACH ROW
-- Die Schlüsselwörter FOR EACH ROW bedeuten, dass der Trigger nicht nur ein einziges Mal auf die gesamte Tabelle angewendet wird, sondern jeden einzelnen Datensatz anspricht, der von der Anweisung betroffen ist.
BEGIN
    DECLARE summe_stueck INTEGER;
    DECLARE summe_preis FLOAT;
   
    SELECT SUM(stueck), SUM(preis) FROM t_lager INTO summe_stueck, summe_preis;
    DELETE FROM t_summe_lager;
    INSERT INTO t_summe_lager VALUES(summe_stueck, summe_preis);
END //
DELIMITER ;

SHOW TRIGGERS;  -- Zeigt Informationen über die gespeicherten Triger an

SELECT * FROM t_summe_lager;
INSERT INTO t_lager (stueck, preis) VALUES (10, 200);
SELECT * FROM t_summe_lager;



/* Trigger Beispiel 2  */
DROP TRIGGER IF EXISTS trig_liefer_nr;
DELIMITER //
CREATE TRIGGER trig_liefer_nr BEFORE INSERT ON t_liefer FOR EACH ROW
BEGIN
    DECLARE lid INTEGER;
 
    -- Wenn die id 0 ist wird eine neue id erzeugt
    -- Wenn die id nicht 0 ist wird die IF-Anweisung nicht ausgeführt
    IF (NEW.id = 0) THEN
      SELECT MAX(id)+1 FROM t_liefer INTO lid;
      SET NEW.id = lid;
    END IF;
END //
DELIMITER ;

-- NEW.datenfeldname - Liefert den neuen oder zu ändernden Wert eines Datenfeldes in einem Trigger für die INSERT- oder UPDATE-Aktion
-- OLD.datenfeldname - Liefert den bisherigen Wert eines Datenfeldes in einem Trigger für die UPDATE- und DELETE-Aktion

INSERT INTO t_liefer (name, str, hnr, plz, ort ) VALUES ( "Walter", "Hauptstr.", "6", "60320", "Frankfurt");
SELECT * FROM t_liefer;