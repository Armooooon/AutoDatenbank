-- Mitarbeiter
-- Insert data into Mitarbeiter table
INSERT INTO Mitarbeiter (vorname, nachname, telefon, email)
VALUES ('Max', 'Mustermann', '0123456789', 'max.mustermann@example.com'),
('Anna', 'Müller', '0987654321', 'anna.mueller@example.com'),
('Peter', 'Schulze', '015555555', 'peter.schulze@example.com'),
('Sarah', 'Krause', '017777777', 'sarah.krause@example.com'),
('Hans', 'Meier', '014444444', 'hans.meier@example.com');

-- Insert data into Kunde table
INSERT INTO Kunde (vorname, nachname, adresse, plz, telefon, email)
VALUES ('Johann', 'Schneider', 'Musterstraße 1', '12345', '0123456789', 'johann.schneider@example.com'),
('Lisa', 'Fischer', 'Hauptstraße 5', '54321', '0987654321', 'lisa.fischer@example.com'),
('Sebastian', 'Weber', 'Bahnhofstraße 3', '67890', '015555555', 'sebastian.weber@example.com'),
('Julia', 'Schmidt', 'Parkstraße 9', '09876', '017777777', 'julia.schmidt@example.com'),
('Markus', 'Bauer', 'Bergstraße 12', '45678', '014444444', 'markus.bauer@example.com');

-- Insert data into Auto table
INSERT INTO Auto (kundenNr, marke, modell, jahr, kilometerstand)
VALUES (1, 'BMW', '320i', 2019, 30000),
(2, 'Mercedes', 'C220', 2018, 40000),
(3, 'Volkswagen', 'Golf', 2020, 20000),
(4, 'Audi', 'A3', 2017, 50000),
(5, 'Ford', 'Fiesta', 2021, 10000);

-- Insert data into Rechnung table
INSERT INTO Rechnung (Verkauf_ID, Datum, Summe)
VALUES (1, '2022-04-01', 25000.00),
(2, '2022-04-02', 20000.00),
(3, '2022-04-03', 15000.00),
(4, '2022-04-04', 18000.00),
(5, '2022-04-05', 12000.00);

INSERT INTO Verkauf (Auto_ID, Kunde_ID, Datum, Preis, Zahlungsmethode, Mitarbeiter_ID, Rechnungs_ID)
VALUES (1, 2, '2022-03-14', 8000.00, 'Barzahlung', 1, 1),
(2, 1, '2022-04-05', 12000.00, 'Finanzierung', 2, 2),
(3, 2, '2022-05-07', 6500.00, 'Barzahlung', 1, 3),
(4, 3, '2022-06-21', 15000.00, 'Finanzierung', 3, 4),
(5, 4, '2022-07-18', 9000.00, 'Barzahlung', 4, 5);

INSERT INTO Reparatur (Auto_ID, Mitarbeiter_ID, Datum, Beschreibung, Kosten)
VALUES (1, 2, '2022-02-14', 'Ölwechsel', 150.00),
(2, 3, '2022-03-07', 'Austausch der Bremsbeläge', 350.00),
(3, 1, '2022-04-18', 'Reparatur des Kupplungssystems', 1200.00),
(4, 2, '2022-05-21', 'Reparatur des Motors', 3500.00),
(5, 4, '2022-06-14', 'Austausch des Kühlers', 800.00);

INSERT INTO Termine (kunde_ID, auto_ID, datum, beschreibung)
VALUES (2, 1, '2022-04-01', 'Ölwechsel und Inspektion'),
(3, 4, '2022-05-15', 'Reparatur der Bremsen'),
(1, 5, '2022-06-05', 'Inspektion und Reifenwechsel'),
(4, 2, '2022-07-12', 'Austausch der Batterie'),
(2, 3, '2022-08-01', 'Inspektion und Ölwechsel');

INSERT INTO Rechnungsposition (Rechnung_ID, Position, Beschreibung, Preis, Menge)
VALUES (1, 1, 'Gebrauchtwagen', 8000.00, 1),
(2, 1, 'Finanzierung', 12000.00, 1),
(3, 1, 'Gebrauchtwagen', 6500.00, 1),
(4, 1, 'Finanzierung', 15000.00, 1),
(5, 1, 'Gebrauchtwagen', 9000.00, 1);
