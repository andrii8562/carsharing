INSERT INTO Znacka (nazov, krajina)
VALUES
('BMW', 'Nemecko'),
('Mercedes-Benz', 'Nemecko'),
('Toyota', 'Japonsko'),
('Skoda', 'Cesko'),
('Volkswagen', 'Nemecko'),
('Audi', 'Nemecko');

INSERT INTO Trieda_vozidla (nazov_triedy, popis)
VALUES
('Mala trieda', 'Male a ekonomicke vozidla'),
('Stredna trieda', 'Pohodlne vozidla na kazdodenne jazdenie'),
('SUV', 'Vacsie vozidla vhodne aj na dlhsie cesty'),
('Luxusna trieda', 'Luxusne a komfortne vozidla'),
('Kombi', 'Vozidla s velkym batozinovym priestorom');

INSERT INTO Model_vozidla
(id_znacky, id_triedy, nazov_modelu)
VALUES
(1, 2, 'BMW 320d'),
(1, 3, 'BMW X5'),
(2, 4, 'Mercedes-Benz E-Class'),
(3, 1, 'Toyota Yaris'),
(4, 2, 'Skoda Octavia'),
(5, 5, 'Volkswagen Passat'),
(6, 3, 'Audi Q5'),
(3, 3, 'Toyota RAV4');


INSERT INTO Vozidlo
(id_modelu, rok_vyroby, evidencne_cislo, farba, cena_za_den, stav_vozidla)
VALUES
(1, 2022, 'KE123AB', 'Cierna', 65.00, 'Aktivne'),
(2, 2023, 'KE456CD', 'Biela', 110.00, 'Aktivne'),
(3, 2022, 'KE789EF', 'Siva', 120.00, 'Aktivne'),
(4, 2021, 'KE111GH', 'Cervena', 35.00, 'Aktivne'),
(5, 2023, 'KE222IJ', 'Modra', 55.00, 'Aktivne'),
(6, 2022, 'KE333KL', 'Strieborna', 60.00, 'Aktivne'),
(7, 2024, 'KE444MN', 'Cierna', 95.00, 'Aktivne'),
(8, 2023, 'KE555OP', 'Zelena', 75.00, 'Aktivne');


INSERT INTO Zakaznik
(meno, priezvisko, email, telefon,
 cislo_vodicskeho_preukazu, datum_narodenia, datum_registracie)
VALUES
('Peter', 'Novak', 'peter.novak@gmail.com', '+421901111111', 'SK100001', '1998-05-12', '2025-01-15'),
('Martin', 'Kovac', 'martin.kovac@gmail.com', '+421902222222', 'SK100002', '1995-08-21', '2025-03-20'),
('Anna', 'Horvathova', 'anna.horvathova@gmail.com', '+421903333333', 'SK100003', '2000-03-15', '2025-06-10'),
('Tomas', 'Svoboda', 'tomas.svoboda@gmail.com', '+421904444444', 'SK100004', '1992-11-09', '2025-07-05'),
('Lucia', 'Marekova', 'lucia.marekova@gmail.com', '+421905555555', 'SK100005', '1999-07-24', '2025-09-12'),
('Jakub', 'Polak', 'jakub.polak@gmail.com', '+421906666666', 'SK100006', '1997-01-18', '2025-11-03'),
('Michaela', 'Bielikova', 'michaela.bielikova@gmail.com', '+421907777777', 'SK100007', '2001-09-30', '2026-01-18'),
('Adam', 'Varga', 'adam.varga@gmail.com', '+421908888888', 'SK100008', '1994-04-05', '2026-03-25');

INSERT INTO Zamestnanec
(meno, priezvisko, email, telefon, pozicia, datum_nastupu)
VALUES
('Jan', 'Novotny', 'jan.novotny@carrental.sk', '+421911111111', 'Administrator', '2022-03-15'),
('Marek', 'Kral', 'marek.kral@carrental.sk', '+421912222222', 'Manager', '2023-06-01'),
('Peter', 'Urban', 'peter.urban@carrental.sk', '+421913333333', 'Employee', '2024-01-10'),
('Lucia', 'Svobodova', 'lucia.svobodova@carrental.sk', '+421914444444', 'Employee', '2024-05-20'),
('Tomas', 'Marek', 'tomas.marek@carrental.sk', '+421915555555', 'Employee', '2025-02-01');

INSERT INTO Rezervacia
(id_zakaznika, id_vozidla, datum_zaciatku, datum_konca, stav_rezervacie, datum_vytvorenia)
VALUES
(1, 1, '2026-10-01', '2026-10-04', 'Confirmed', '2026-09-25'),
(2, 2, '2026-10-05', '2026-10-09', 'Confirmed', '2026-09-28'),
(3, 4, '2026-10-10', '2026-10-13', 'Confirmed', '2026-10-01'),
(4, 3, '2026-10-15', '2026-10-19', 'Confirmed', '2026-10-05'),
(5, 5, '2026-10-20', '2026-10-24', 'Confirmed', '2026-10-08'),
(6, 6, '2026-10-25', '2026-10-28', 'Confirmed', '2026-10-10'),
(7, 7, '2026-11-25', '2026-11-29', 'Pending', '2026-11-09'),
(8, 8, '2026-12-01', '2026-12-05', 'Confirmed', '2026-11-10');

INSERT INTO Prenajom
(id_rezervacie, id_zakaznika, id_vozidla, id_zamestnanca,
 datum_zaciatku, datum_konca, skutocny_datum_vratenia,
 denny_poplatok, celkova_cena, stav_prenajmu)
VALUES
(1, 1, 1, 3, '2026-10-01', '2026-10-04', '2026-10-04', 65.00, 195.00, 'Completed'),
(2, 2, 2, 2, '2026-10-05', '2026-10-09', '2026-10-09', 110.00, 440.00, 'Completed'),
(3, 3, 4, 4, '2026-10-10', '2026-10-13', '2026-10-13', 35.00, 105.00, 'Completed'),
(4, 4, 3, 3, '2026-10-15', '2026-10-19', NULL, 120.00, 480.00, 'Active'),
(5, 5, 5, 5, '2026-10-20', '2026-10-24', NULL, 55.00, 220.00, 'Active'),
(6, 6, 6, 2, '2026-10-25', '2026-10-28', '2026-10-29', 60.00, 180.00, 'Completed');

INSERT INTO Platba
(id_prenajmu, suma, datum_platby, sposob_platby, stav_platby)
VALUES
(1, 195.00, '2026-10-01', 'Card', 'Completed'),
(2, 200.00, '2026-10-05', 'Cash', 'Completed'),
(2, 240.00, '2026-10-09', 'Card', 'Completed'),
(3, 105.00, '2026-10-10', 'Bank Transfer', 'Completed'),
(4, 480.00, '2026-10-15', 'Card', 'Completed'),
(5, 100.00, '2026-10-20', 'Cash', 'Completed'),
(6, 180.00, '2026-10-25', 'Card', 'Completed'),
(4, 50.00, '2026-10-16', 'Cash', 'Completed');





