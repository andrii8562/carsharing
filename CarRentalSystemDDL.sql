CREATE DATABASE IF NOT EXISTS CarRentalSystem;
USE CarRentalSystem;

CREATE TABLE IF NOT EXISTS Znacka (
    id_znacky INT AUTO_INCREMENT PRIMARY KEY,
    nazov VARCHAR(100) NOT NULL,
    krajina VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Trieda_vozidla (
    id_triedy INT AUTO_INCREMENT PRIMARY KEY,
    nazov_triedy VARCHAR(50) NOT NULL,
    popis TEXT
);

CREATE TABLE IF NOT EXISTS Model_vozidla (
    id_modelu INT AUTO_INCREMENT PRIMARY KEY,
    id_znacky INT NOT NULL,
    id_triedy INT NOT NULL,
    nazov_modelu VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_znacky) REFERENCES Znacka(id_znacky),
    FOREIGN KEY (id_triedy) REFERENCES Trieda_vozidla(id_triedy)
);

CREATE TABLE IF NOT EXISTS Vozidlo (
    id_vozidla INT AUTO_INCREMENT PRIMARY KEY,
    id_modelu INT NOT NULL,
    rok_vyroby YEAR NOT NULL,
    evidencne_cislo VARCHAR(20) NOT NULL,
    farba VARCHAR(30),
    cena_za_den DECIMAL(10,2) NOT NULL,
    stav_vozidla VARCHAR(20),
    FOREIGN KEY (id_modelu) REFERENCES Model_vozidla(id_modelu)
);

CREATE TABLE IF NOT EXISTS Zakaznik (
    id_zakaznika INT AUTO_INCREMENT PRIMARY KEY,
    meno VARCHAR(50) NOT NULL,
    priezvisko VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefon VARCHAR(20),
    cislo_vodicskeho_preukazu VARCHAR(50) NOT NULL,
    datum_narodenia DATE NOT NULL,
    datum_registracie DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Zamestnanec (
    id_zamestnanca INT AUTO_INCREMENT PRIMARY KEY,
    meno VARCHAR(50) NOT NULL,
    priezvisko VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefon VARCHAR(20),
    pozicia VARCHAR(50) NOT NULL,
    datum_nastupu DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Rezervacia (
    id_rezervacie INT AUTO_INCREMENT PRIMARY KEY,
    id_zakaznika INT NOT NULL,
    id_vozidla INT NOT NULL,
    datum_zaciatku DATE NOT NULL,
    datum_konca DATE NOT NULL,
    stav_rezervacie VARCHAR(20) NOT NULL,
    datum_vytvorenia DATE NOT NULL,
    FOREIGN KEY (id_zakaznika) REFERENCES Zakaznik(id_zakaznika),
    FOREIGN KEY (id_vozidla) REFERENCES Vozidlo(id_vozidla)
);

CREATE TABLE IF NOT EXISTS Prenajom (
    id_prenajmu INT AUTO_INCREMENT PRIMARY KEY,
    id_rezervacie INT,
    id_zakaznika INT NOT NULL,
    id_vozidla INT NOT NULL,
    id_zamestnanca INT NOT NULL,
    datum_zaciatku DATE NOT NULL,
    datum_konca DATE NOT NULL,
    skutocny_datum_vratenia DATE,
    denny_poplatok DECIMAL(10,2) NOT NULL,
    celkova_cena DECIMAL(10,2) NOT NULL,
    stav_prenajmu VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_rezervacie) REFERENCES Rezervacia(id_rezervacie),
    FOREIGN KEY (id_zakaznika) REFERENCES Zakaznik(id_zakaznika),
    FOREIGN KEY (id_vozidla) REFERENCES Vozidlo(id_vozidla),
    FOREIGN KEY (id_zamestnanca) REFERENCES Zamestnanec(id_zamestnanca)
);

CREATE TABLE IF NOT EXISTS Platba (
    id_platby INT AUTO_INCREMENT PRIMARY KEY,
    id_prenajmu INT NOT NULL,
    suma DECIMAL(10,2) NOT NULL,
    datum_platby DATE,
    sposob_platby VARCHAR(30),
    stav_platby VARCHAR(20),
    FOREIGN KEY (id_prenajmu) REFERENCES Prenajom(id_prenajmu)
);