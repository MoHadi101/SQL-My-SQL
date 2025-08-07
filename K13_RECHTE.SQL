USE uebungen;
SELECT"Ein automatischer Scriptablauf ist nicht geeignet. Anwendung wird abgebrochen!" AS "INFORMATION";
exit


CREATE USER 'fmueller'@'%' IDENTIFIED BY 'geheim'; -- kreiert einen neuen Benutzer mit zugriff aus dem heimischen Netzwerk
GRANT ALL ON t_ma TO fmueller; -- Mit der GRANT-Anweisung und der Option ALL werden dem Benutzer an dieser Stelle alle Privilegien für die Tabelle t_ma erteilt. Durch die Option WITH GRANT OPTION wird ihm das Recht erteilt, diese Privilegien für die betreffende Tabelle auch an andere zu vergeben.

GRANT ALL ON t_lager TO fmueller;