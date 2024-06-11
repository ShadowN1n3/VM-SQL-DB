CREATE DATABASE Aufgabe_04_06_2024;

USE Aufgabe_04_06_2024;

CREATE TABLE Person
(
    PersID INT NOT NULL,
    PRIMARY KEY (PersID),
    Nachname VARCHAR(255),
    Vorname VARCHAR(255),
    Strasse VARCHAR(255),
    PLZ INT(5),
    Ort VARCHAR(255)
);

CREATE TABLE Zugang
(
    RaumID INT NOT NULL,
    PRIMARY KEY (RaumID),
    PersID INT,
    FOREIGN KEY (PersID) REFERENCES Person (PersID),
    ZeitVon TIME,
    ZeitBis TIME
);

CREATE TABLE Gebaeude
(
    GebID INT NOT NULL,
    PRIMARY KEY (GebID),
    Bezeichnung VARCHAR(255),
    Strasse VARCHAR(255),
    PLZ INT(5),
    Ort VARCHAR(255)
);

CREATE TABLE Merkmal
(
    MerkID INT NOT NULL,
    PRIMARY KEY (MerkID),
    Merkmal VARCHAR(255)
);

CREATE TABLE Raum
(
    RaumID INT NOT NULL,
    FOREIGN KEY (RaumID) REFERENCES Zugang(RaumID),
    Typ VARCHAR(255),
    GebID INT NOT NULL,
    FOREIGN KEY (GebID) REFERENCES Gebaeude(GebID),
    MerkID INT NOT NULL,
    FOREIGN KEY (MerkID) REFERENCES Merkmal(MerkID)
);

INSERT INTO Person VALUES (101, 'Müller', 'Max', 'Müllerweg 1', 52553, 'Köln');
INSERT INTO Person VALUES (202, 'Meier', 'Willio', 'Testweg 12', 43333, 'Dortmund');
INSERT INTO Person VALUES (404, 'Wester', 'Klaus', 'Hauptstr. 13', 55667, 'Köln');

INSERT INTO Zugang VALUES (1, 101, '08:00', '18:00');
INSERT INTO Zugang VALUES (2, 101, '10:00', '14:00');
INSERT INTO Zugang VALUES (3, 101, '14:00', '18:00');
INSERT INTO Zugang VALUES (4, 202, '08:00', '18:00');
INSERT INTO Zugang VALUES (5, 404, '09:00', '17:00');
INSERT INTO Zugang VALUES (6, 404, '07:00', '15:00');
INSERT INTO Zugang VALUES (7, 202, '08:00', '18:00');
INSERT INTO Zugang VALUES (8, 101, '08:00', '18:00');

INSERT INTO Gebaeude VALUES (1, 'Forschung H', 'Heinrich-Hertz-Str 12', 50501, 'Köln');
INSERT INTO Gebaeude VALUES (2, 'Forschung U', 'Heinrich-Hertz-Str 14', 50501, 'Köln');
INSERT INTO Gebaeude VALUES (3, 'Forschung I', 'Heinrich-Hertz-Str 16', 50501, 'Köln');
INSERT INTO Gebaeude VALUES (4, 'Verwaltung', 'Transalee 22', 50501, 'Köln');

INSERT INTO Merkmal VALUES (1, 'Fingerabdruck');
INSERT INTO Merkmal VALUES (2, 'Iris');

INSERT INTO Raum VALUES (1, 'Besprechungsraum', 2, 1);
INSERT INTO Raum VALUES (2, 'Labor', 2, 2);
INSERT INTO Raum VALUES (3, 'Labor', 1, 2);
INSERT INTO Raum VALUES (4, 'Labor', 1, 2);
INSERT INTO Raum VALUES (5, 'Besprechungsraum', 1, 1);
INSERT INTO Raum VALUES (6, 'Labor', 3, 2);
INSERT INTO Raum VALUES (7, 'Labor', 3, 2);
INSERT INTO Raum VALUES (8, 'Labor', 3, 2);
