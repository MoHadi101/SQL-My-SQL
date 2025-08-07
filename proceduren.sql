SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;


use uebungen;

-- Stored Procedures sind gespeicherte Funktionen mit vordefinierten Abläufen die durch Aufruf des Anwenders ausgeführt werden

-- Innerhalb der Prozedur werden SQL-Anweisungen wie üblich mit einem Semikolon abgeschlossen. Damit die Eingabe an dieser Stelle aber nicht fälschlicherweise abgebrochen wird, muss mit dem Befehl DELIMITER ein neues Endekennzeichen für SQL-Anweisungen definiert werden. Hier ist es das Zeichen //.

DROP PROCEDURE IF EXISTS p_tma;-- Löscht die Procedure p_tma falls sie existiert

DELIMITER // 
CREATE PROCEDURE p_tma()
BEGIN
    SELECT id, name FROM t_ma;


END //
DELIMITER ;

SHOW PROCEDURE STATUS;-- Gibt eine Aufzählung der gespeicherten Proceduren zurück

SHOW CREATE PROCEDURE p_tma; -- Zeigt den Code einer bestimmten Prozedur

CALL p_tma; -- Aufruf der Procedure (Ausführung)

DROP PROCEDURE p_tma; -- Löscht eine vorhandene Prozedur vom Server

/* Eine komplexere Procedure */
 
DROP PROCEDURE IF EXISTS p_neuer_ma;
DELIMITER //
CREATE PROCEDURE p_neuer_ma (name VARCHAR(50), vorname VARCHAR(50), strasse VARCHAR(150), hausnr VARCHAR(5), plz VARCHAR(5), ort VARCHAR(50),
land VARCHAR(4), projektname VARCHAR(50) )
BEGIN
    DECLARE mid INTEGER; -- Erzeugt eine Variable
    DECLARE pid INTEGER; -- Erzeugt eine Variable
   
    SELECT MAX(id) + 1 FROM t_ma INTO mid; -- Ermittelt eine neue ID aus der Tabelle t_ma und schreibt das Resultat in die Variable mid
 
    INSERT INTO t_ma (id, name, vname, str, hnr, plz, ort, land) VALUES(mid, name, vorname, strasse, hausnr, plz, ort, land);
    -- Schreibt den neuen Datensatz in die Tabelle t_ma mit der id aus der Variable mid
   
    SELECT COUNT(id) FROM t_proj WHERE t_proj.name = projektname INTO pid;
    -- Ermittelt ob das gewünschte Projet bereits existiert und schreibt in die Variable pid 0 für nein oder 1 für ja
   
    -- IF, THEN, ELSE, END IF ist eine Wenn, dann, andernfalls Abfrage
    IF (pid = 0) THEN
        -- Wenn des Projekt nicht existiert, also der Wert von pid 0 ist wird das Projekt neu angelegt
       SELECT MAX(id) + 1 FROM t_proj INTO pid;
       INSERT INTO t_proj (id, name) VALUES(pid, projektname);
    ELSE
        -- Andernfalls wird Die Variable pid mit der id des gefundenen Projekts überschrieben
      SELECT id FROM t_proj WHERE t_proj.name = projektname INTO pid;
    END IF;
 
    INSERT INTO t_ma_proj (ma_id, proj_id) VALUES(mid, pid); -- Schreibt die Daten in die Datenbank
END //
DELIMITER ;

-- Aufrufen der Prozedur p_neuer_ma
CALL p_neuer_ma ('Herold', 'Frank', 'Waldstr.', '24', '10115', 'Berlin', 'D', 'Kundenumfrage');
CALL p_neuer_ma ('Teschau', 'Ines', '', '','1210', 'Wien', 'AT', 'Softwareentwicklung');

-- Zeigt den Status der Proceduren einer Datenbank an
SHOW PROCEDURE STATUS WHERE db = 'uebungen';

# DROP PROCEDURE IF EXISTS p_neuer_ma;
--Bestätigung der Löschung
SHOW PROCEDURE STATUS WHERE db = 'uebungen';