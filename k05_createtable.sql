USE uebungen;

CREATE TABLE IF NOT EXISTS t_ma (
    id INTEGER NOT NULL,
    vname VARCHAR(100),
    name VARCHAR(100),
    adr TEXT 
);

DROP TABLE IF EXISTS t_produkte;
CREATE TABLE IF NOT EXISTS t_produkte (
    p_id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    ma_nr INTEGER,
    PRIMARY KEY (p_id)
);

CREATE TABLE IF NOT EXISTS t_ma_abt (
    id INTEGER NOT NULL AUTO_INCREMENT,
    abtname VARCHAR(25) DEFAULT 'Produktion',
    ma_nr INTEGER,
    CONSTRAINT mpruef CHECK (ma_nr > 1),
    PRIMARY KEY (id)

);
# INSERT INTO t_ma_abt (ma_nr) VALUE (1); -- Beispiel für einen Fehler, da ma_nr < 2
INSERT INTO t_ma_abt (ma_nr) VALUE (5); -- Beispiel für keinen Fehler


