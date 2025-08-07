SET @saved_cs_client     = @@character_set_client; 
SET character_set_client = utf8mb4; 

/* 
    1. Erstellen Sie in der Datenbank Uebungen eine Prozedur p_artikel_hinzufuegen, die dem Lagerbestand in der Tabelle t_lager neue Artikel hinzufügt.
    2. Die Prozedur soll als Parameter die Artikelnummer, die Stückzahl und den Preis erhalten. Verwenden Sie geeignete Namen und Datentypen.
    3. Deklarieren Sie eine lokale Variable aid mit dem Datentyp INTEGER.
    4. Prüfen Sie mit einer SELECT-Abfrage, ob der einzufügende Artikel bereits vorhanden ist, und speichern Sie das Abfrageergebnis auf der Variablen aid.
    5. Wenn der Artikel schon im Lagerbestand ist, sollen Preis und Stückzahl des vorhandenen Artikels mit den neuen Werten aktualisiert werden.
    6. Handelt es sich um einen neuen Artikel, soll er dem Lagerbestand hinzugefügt werden.
    7. Testen Sie die Prozedur mit geeigneten Werten.
*/

USE uebungen;

DELIMITER //
CREATE PROCEDURE p_artikel_hinzufuegen (
    artikelnummer INTEGER, 
    stueckzahl INTEGER, 
    preis FLOAT)


BEGIN



   DECLARE aid INTEGER;

        SELECT COUNT(id) FROM t_lager WHERE id=artikelnummer INTO aid; 

   IF (aid=1) THEN 

      UPDATE t_lager SET stueck = stueckzahl, preis = preis WHERE id = artikelnummer; 

   ELSE 

      INSERT INTO t_lager (id, stueck, preis) VALUES (artikelnummer, stueckzahl, preis);

   END IF;


END //

DELIMITER ;

CALL p_artikel_hinzufuegen(100,210,12.50);
CALL p_artikel_hinzufuegen(50,220,2.90);


# DROP PROCEDURE IF EXISTS p_artikel_hinzufuegen;