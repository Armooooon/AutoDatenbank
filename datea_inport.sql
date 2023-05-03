-- Mitarbeiter
INSERT INTO Mitarbeiter (vorname, nachname, telefon, email) 
VALUES 
    ('Max', 'Mustermann', '0123456789', 'max.mustermann@example.com'),
    ('Anna', 'Müller', '0987654321', 'anna.mueller@example.com'),
    ('Hans', 'Schmidt', '0151122334', 'hans.schmidt@example.com'),
    ('Maria', 'Meier', '0176345678', 'maria.meier@example.com'),
    ('Klaus', 'Fischer', '0198765432', 'klaus.fischer@example.com');

-- Kunde
INSERT INTO Kunde (vorname, nachname, adresse, plz, telefon, email) 
VALUES 
    ('Peter', 'Schneider', 'Hauptstraße 1', '12345', '0151123456', 'peter.schneider@example.com'),
    ('Susanne', 'Meyer', 'Bahnhofstraße 10', '54321', '0176123456', 'susanne.meyer@example.com'),
    ('Fritz', 'Schulz', 'Musterweg 5', '23456', '0162123456', 'fritz.schulz@example.com'),
    ('Tanja', 'Kramer', 'Lindenallee 20', '34567', '0153123456', 'tanja.kramer@example.com'),
    ('Markus', 'Hoffmann', 'Bachstraße 7', '45678', '0144123456', 'markus.hoffmann@example.com');

-- Auto
INSERT INTO Auto (kundenNr, marke, modell, jahr, kilometerstand) 
VALUES 
    (1, 'VW', 'Golf', 2018, 30000),
    (1, 'BMW', '3er', 2015, 50000),
    (2, 'Audi', 'A4', 2020, 10000),
    (3, 'Mercedes', 'C-Klasse', 2016, 70000),
    (4, 'VW', 'Polo', 2019, 20000);

-- Fahrzeugbestand
INSERT INTO Fahrzeugbestand (marke, modell, jahr, kilometerstand, kaufdatum, kaufpreis, verkaufsstatus) 
VALUES 
    ('Ford', 'Focus', 2017, 40000, '2022-01-01', 15000.00, 'zum Verkauf'),
    ('Opel', 'Astra', 2016, 60000, '2022-02-15', 12000.00, 'zum Verkauf'),
    ('Audi', 'Q3', 2019, 20000, '2022-03-21', 28000.00, 'verkauft'),
    ('BMW', '5er', 2014, 80000, '2022-04-10', 18000.00, 'zum Verkauf'),
    ('VW', 'Tiguan', 2015, 90000, '2022-05-05', 20000.00, 'verkauft');
