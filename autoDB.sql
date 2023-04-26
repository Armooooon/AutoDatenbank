create schema if not exists auto_DB;
use auto_DB;

CREATE TABLE if not exists Mitarbeiter (
    mitarbeiterNr INT(255) AUTO_INCREMENT,
    vorname VARCHAR(99) NOT NULL,
    nachname VARCHAR(99) NOT NULL,
    telefon VARCHAR(99) NOT NULL,
    email VARCHAR(20) NOT NULL,
    PRIMARY KEY (mitarbeiterNr)
);

CREATE TABLE if not exists Kunde (
    kundenNr INT(255) AUTO_INCREMENT,
    vorname VARCHAR(99) NOT NULL,
    nachname VARCHAR(99) NOT NULL,
    adresse VARCHAR(99) NOT NULL,
    plz VARCHAR(99) NOT NULL,
    telefon VARCHAR(99) NOT NULL,
    email VARCHAR(20) NOT NULL,
    PRIMARY KEY (kundenNr)
); 

CREATE TABLE if not exists Auto (
    autoNr INT(50) NOT NULL AUTO_INCREMENT,
    kundenNr INT(50) NOT NULL,
    marke VARCHAR(50) NOT NULL,
    modell VARCHAR(50) NOT NULL,
    jahr INT(20) NOT NULL,
    kilometerstand INT(20),
    PRIMARY KEY (autoNr), 
    FOREIGN KEY (kundenNr) REFERENCES Kunde(kundenNr)
);

CREATE TABLE if not exists Verkauf (
    ID INT NOT NULL AUTO_INCREMENT,
    Auto_ID INT NOT NULL,
    Kunde_ID INT NOT NULL,
    Datum DATE NOT NULL,
    Preis DECIMAL(10, 2) NOT NULL,
    Zahlungsmethode VARCHAR(20) NOT NULL,
    Finanzierung BOOLEAN NOT NULL DEFAULT 0,
    Anzahlung DECIMAL(10, 2),
    Restbetrag DECIMAL(10, 2),
    Rechnungs_ID INT NOT NULL,
    Mitarbeiter_ID INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (Auto_ID) REFERENCES Auto(autoNr),
    FOREIGN KEY (Kunde_ID) REFERENCES Kunde(kundenNr),
    FOREIGN KEY (Rechnungs_ID) REFERENCES Rechnung(ID),
    FOREIGN KEY (Mitarbeiter_ID) REFERENCES Mitarbeiter(mitarbeiterNr)
);

CREATE TABLE if not exists Rechnung (
    ID INT NOT NULL AUTO_INCREMENT,
    Verkauf_ID INT NOT NULL,
    Datum DATE NOT NULL,
    Summe DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (Verkauf_ID) REFERENCES Verkauf(ID)
);

CREATE TABLE if not exists Reparatur (
    ID INT NOT NULL AUTO_INCREMENT,
    Auto_ID INT NOT NULL,
    Mitarbeiter_ID INT NOT NULL,
    Datum DATE NOT NULL,
    Beschreibung VARCHAR(255) NOT NULL,
    Kosten DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (Auto_ID) REFERENCES Auto(autoNr),
    FOREIGN KEY (Mitarbeiter_ID) REFERENCES Mitarbeiter(mitarbeiterNr)
);