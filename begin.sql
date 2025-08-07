/* 
   Ich bin
   ein Blockkommentar
*/

-- Ich bin ein Zeilenkommentar


# Ich bin ein Kommentar, der mit einem Hash beginnt




-- Zeigt alle Datenbanken im DBS
SHOW DATABASES;

-- Löscht die Datenbank testdb wenn sie existiert
DROP DATABASE IF EXISTS testdb;

-- Kreiert die Datenbank testdb
CREATE DATABASE IF NOT EXISTS testdb;

-- Wechselt in die Datenbank testdb
USE testdb;

-- Löscht die Tabelle testtable wenn sie existiert
# DROP TABLE IF EXISTS testtable;

-- Erzeugt die Tabelle testtable mit zwei Spalten 
CREATE TABLE testtable (
    vorname VARCHAR(20),
    mail VARCHAR(255),
    buch TEXT
);

-- Zeigt alle Tabellen in der benutzten Datenbank testdb
SHOW TABLES;

-- Zeigt alle Spalten in der Tabelle testtable
SHOW COLUMNS FROM testtable;

--Daten in die Tabelle schreiben 
INSERT INTO testtable (vorname, mail) VALUES ('Max', 'max@max.de');
INSERT INTO testtable (vorname, mail) VALUES ('Hugo', 'hugo@max.de'); 

-- Auslesen der Tabelle testtable
SELECT * FROM testtable; 

-- Daten aus einer Tabelle löschen
# DELETE FROM testtable;
Delete FROM testtable WHERE vorname = 'Hugo';
Delete FROM testtable WHERE vorname = 'Max';
-- Aufruf um das Script auszuführen
-- source begin.sql; 