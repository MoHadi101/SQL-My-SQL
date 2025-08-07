use uebungen;

exit

SELECT user FROM mysql.user; -- Zeigt alle Benutzer des DBMS.

CREATE USER 'fmueller'@'%' IDENTIFIED BY 'geheim'; -- Kreiert einen neuen Benutzer mit Zugriff aus dem heimischen Netzwerk.
CREATE USER 'pfunke'@'localhost' IDENTIFIED BY 'geheim';-- Kreiert einen neuen Benutzer mit Zugriff auf dem lokalen Computer

GRANT ALL ON t_ma TO fmueller;
/* Mögliche Rechtevergabe  
    GRANT rechte ON *.* TO ... -- Die betreffenden Rechte gelten für alle Datenbanken und Tabellen.
    GRANT rechte ON datenbank.* TO ... -- Die Rechte gelten für alle Tabellen der angegebenen Datenbank.
    GRANT rechte ON datenbank.tabelle TO ... -- Die Rechte gelten für die angegebene Tabelle der angegebenen Datenbank.
    GRANT rechte ON * TO ... -- Die Rechte gelten für alle Tabellen der aktuellen Datenbank.
    GRANT rechte ON tabelle TO ... -- Die Rechte gelten für die angegebene Tabelle der aktuellen Datenbank.
*/


SHOW GRANTS FOR fmueller;

/* Privilegien an andere Benutzer weitergeben */
GRANT ALL ON t_ma TO fmueller WITH GRANT OPTION; -- Mit der GRANT-Anweisung und der Option ALL werden dem Benutzer an dieser Stelle alle Privilegien für die Tabelle t_ma erteilt. Durch die Option WITH GRANT OPTION wird ihm das Recht erteilt, diese Privilegien für die betreffende Tabelle auch an andere zu vergeben.
