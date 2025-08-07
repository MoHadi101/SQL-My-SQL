SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;


USE Uebungen;
SELECT "Ein automatischer Scriptablauf ist nicht geeignet. Anwendung wird abgebrochen!" AS "INFORMATION";
exit

SELECT preis FROM t_lager WHERE stueck > 200;
 
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- Mit dieser Anweisung wird eine neue Transaktion gestartet.
BEGIN; -- Für das Starten einer Standard-Transaktion kann die Anweisung BEGIN ohne weitere Parameter verwendet werden.
    UPDATE t_lager SET preis = preis * 0.95 WHERE stueck > 200;
    UPDATE t_lager SET preis = preis * 0.98 WHERE stueck > 100 AND stueck <= 200;
 
    SELECT preis FROM t_lager WHERE stueck > 200;
 
-- Hier auch mit zweitem Benutzer [SELECT preis FROM t_lager WHERE stueck > 200;] aufrufen.
 
COMMIT; -- Schließt die Transaktion und übernimmt die Änderungen
# ROLLBACK; -- Schließt die Transaktion und macht die Änderungen rückgängig