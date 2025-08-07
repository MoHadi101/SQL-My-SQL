SET @saved_cs_client = @@character_set_client;
SET character_set_client = utf8mb4;


exit 

USE uebungen; -- Selektieret alle datensätze der tabelle t_ma
SELECT vname, name FROM t_ma, -- selektiert alle vname und name aller datensätze der tabelle t_ma


/*
    Mit der folgenden Anweisung werden nur die Datenfelder name, vname, plz und ort aus der
    Tabelle t_ma ausgelesen. Gleichzeitig wird die Abfrage auf alle Datensätze begrenzt, bei
    denen der Wert im Feld plz mit der Ziffer 6 beginnt und bei denen der Wert im Feld gebdat ein
    Datum nach dem 01.01.1972 beinhaltet. Die Datensätze werden bei der Anzeige absteigend
    nach der Postleitzahl sortiert.
*/
SELECT name, vname, plz, ort, gebdat FROM t_ma
    WHERE plz LIKE '6%' -- Nur Datensätze bei denen die plz mit 6 beginnt
    AND gebdat > '1972-01-01' -- und das gebdat größer als 1972 ist
    ORDER BY plz -- Sortiert nach plz
    DESC -- Absteigend sortiert (ASC = aufsteigend und default)
;

/*
Es wird eine Abfrage ausgewählter Datensätze und Datenfelder mit neuen aussagekräftigen Feldnamen erzeugt. 
Die Festlegung eines anderen Spaltennamens entspricht der Operation Umbenennen der Relationenalgebra.
*/
SELECT name AS 'Familienname', vname AS Vorname, plz AS Postleitzahl, gebdat AS Geburtsdatum
    FROM t_ma
    WHERE
    name NOT LIKE 'Y%'
    AND name NOT LIKE 'S%'
    ORDER BY name DESC
;
SELECT 'Mitarbeiter' AS 'angestellt als', vname , name FROM t_ma WHERE id < 4;

SELECT id, vname, name FROM t_ma LIMIT 10; -- Begrenzt die Ausgabe auf 10 Datensätze
SELECT id, vname, name FROM t_ma LIMIT 5, 10; -- Begrenzt die Ausgabe auf 10 Datensätze


 