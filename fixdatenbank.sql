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

CREATE TABLE if not exists Rechnung (
    ID INT NOT NULL AUTO_INCREMENT,
    Verkauf_ID INT NOT NULL,
    Datum DATE NOT NULL,
    Summe DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (ID)
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
    FOREIGN KEY (Mitarbeiter_ID) REFERENCES Mitarbeiter(mitarbeiterNr)
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

CREATE TABLE if not exists Termine (
    ID INT NOT NULL AUTO_INCREMENT,
    kunde_ID INT NOT NULL,
    auto_ID INT NOT NULL,
    datum DATE NOT NULL,
    beschreibung VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (kunde_ID) REFERENCES Kunde(kundenNr),
    FOREIGN KEY (auto_ID) REFERENCES Auto(autoNr)
);

CREATE TABLE if not exists Rechnungsposition (
    ID INT NOT NULL AUTO_INCREMENT,
    Rechnung_ID INT NOT NULL,
    Position INT NOT NULL,
    Beschreibung VARCHAR(255) NOT NULL,
    Preis DECIMAL(10, 2) NOT NULL,
    Menge INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (Rechnung_ID) REFERENCES Rechnung(ID)
);

CREATE TABLE if not exists Fahrzeugbestand (
    autoNr INT(50) NOT NULL AUTO_INCREMENT,
    marke VARCHAR(50) NOT NULL,
    modell VARCHAR(50) NOT NULL,
    jahr INT(20) NOT NULL,
    kilometerstand INT(20),
    kaufdatum DATE NOT NULL,
    kaufpreis DECIMAL(10, 2) NOT NULL,
    verkaufsstatus VARCHAR(20) NOT NULL DEFAULT 'zum Verkauf',
    PRIMARY KEY (autoNr)
);

CREATE TABLE if not exists Lieferant (
    lieferantNr INT(50) AUTO_INCREMENT,
    name VARCHAR(99) NOT NULL,
    adresse VARCHAR(99) NOT NULL,
    telefon VARCHAR(99) NOT NULL,
    email VARCHAR(20) NOT NULL,
    PRIMARY KEY (lieferantNr)
);

CREATE TABLE if not exists Ersatzteil (
    teilNr INT(50) NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    beschreibung VARCHAR(255),
    preis DECIMAL(10, 2) NOT NULL,
    lagerbestand INT(20),
    lieferantNr INT(50) NOT NULL,
    PRIMARY KEY (teilNr),
    FOREIGN KEY (lieferantNr) REFERENCES Lieferant(lieferantNr)
);

CREATE TABLE if not exists Reparatur_Ersatzteil (
    reparaturID INT NOT NULL,
    ersatzteilID INT NOT NULL,
    anzahl INT NOT NULL,
    PRIMARY KEY (reparaturID, ersatzteilID)
);

CREATE TABLE if not exists Verkauf_Ersatzteil (
    verkaufID INT NOT NULL,
    ersatzteilID INT NOT NULL,
    anzahl INT NOT NULL,
    PRIMARY KEY (verkaufID)
);
