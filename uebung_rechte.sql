/* 
    1. Legen Sie in Ihrer Datenbank einen neuen Benutzer mit dem Namen umeyer und einem
    beliebigen Passwort an.
    2. Gewähren Sie diesem Benutzer für die Tabelle t_ma Rechte zum Lesen und Aktualisieren
    von Datensätzen.
    3. Melden Sie sich an der Datenbank mit dem neuen Benutzernamen an.
    4. Versuchen Sie, einen Datensatz in der Tabelle t_ma zu löschen.
    5. Entziehen Sie dem Benutzer alle Rechte für die Tabelle t_ma.
    6. Gewähren Sie dem Benutzer nun alle Rechte für die Tabelle t_proj, Leserechte für die
    Tabelle t_ma und das Recht zum Ändern der Abteilungsnummer in der Tabelle t_ma.
    7. Entziehen Sie dem Benutzer das Recht zum Löschen von Datensätzen in der Tabelle t_proj.
    Prüfen Sie danach, was jetzt mit den anderen Rechten des Benutzers an der Tabelle geschieht.
*/

CREATE USER 'umeyer'@'localhost' IDENTIFIED BY 'geheim';


USE uebungen;

GRANT SELECT, UPDATE ON t_ma TO umeyer;

REVOKE ALL ON t_ma FROM umeyer;

GRANT ALL ON t_proj TO umeyer;
GRANT SELECT ON t_ma TO umeyer;
GRANT UPDATE (abtnr) ON t_ma TO umeyer;

REVOKE DELETE ON t_proj FROM umeyer;

DROP USER 'umeyer'@'localhost'; 