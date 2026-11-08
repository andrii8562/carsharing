SELECT * FROM Znacka;
SELECT * FROM Trieda_vozidla;
SELECT * FROM Model_vozidla;
SELECT * FROM Vozidlo;
SELECT * FROM Zakaznik;
SELECT * FROM Zamestnanec;
SELECT * FROM Rezervacia;
SELECT * FROM Prenajom;
SELECT * FROM Platba;


/*
Úloha 1: Vyhľadajte aktívne vozidlá značiek BMW a Audi vyrobené po roku 2021,
ktorých cena prenájmu je minimálne 50 EUR na deň. Zobrazte značku, model,
rok výroby, evidenčné číslo vozidla a cenu. Zoraďte podľa ceny,
od najdrahšieho po najlacnejšie.
*/

SELECT
    z.nazov AS znacka,
    m.nazov_modelu,
    v.rok_vyroby,
    v.evidencne_cislo,
    v.cena_za_den
FROM Vozidlo v
JOIN Model_vozidla m
    ON v.id_modelu = m.id_modelu
JOIN Znacka z
    ON m.id_znacky = z.id_znacky
WHERE
    v.stav_vozidla = 'Aktivne'
    AND v.rok_vyroby > 2021
    AND v.cena_za_den >= 50
    AND z.nazov REGEXP 'BMW|Audi'
ORDER BY v.cena_za_den DESC;


/*
Úloha 2: Vyhľadajte aktívne vozidlá, ktorých evidenčné číslo sa začína
na „KE“ a cena prenájmu presahuje 50 EUR na deň. Zobrazte evidenčné číslo,
rok výroby, farbu a cenu prenájmu. Zoraďte podľa ceny zostupne.
*/

SELECT
    evidencne_cislo,
    rok_vyroby,
    farba,
    cena_za_den
FROM Vozidlo
WHERE
    evidencne_cislo REGEXP '^KE'
    AND stav_vozidla = 'Aktivne'
    AND cena_za_den > 50
ORDER BY cena_za_den DESC;


/*
Úloha 3: Zobrazte krstné meno, priezvisko, celé meno, dátum narodenia
a aktuálny vek všetkých zákazníkov. Zoraďte zákazníkov podľa veku
od najstaršieho po najmladšieho.
*/

SELECT
    meno,
    priezvisko,
    CONCAT(meno, ' ', priezvisko) AS cele_meno,
    datum_narodenia,
    TIMESTAMPDIFF(YEAR, datum_narodenia, CURDATE()) AS vek
FROM Zakaznik
ORDER BY vek DESC;


/*
Úloha 4: Určte počet vozidiel každej značky a vypočítajte priemernú
dennú cenu prenájmu vozidiel danej značky. Zobrazte značku, počet vozidiel
a priemernú cenu. Zoraďte podľa počtu vozidiel zostupne.
*/

SELECT
    z.nazov AS znacka,
    COUNT(v.id_vozidla) AS pocet_vozidiel,
    ROUND(AVG(v.cena_za_den), 2) AS priemerna_cena
FROM Znacka z
JOIN Model_vozidla m
    ON z.id_znacky = m.id_znacky
JOIN Vozidlo v
    ON m.id_modelu = v.id_modelu
GROUP BY z.nazov
ORDER BY pocet_vozidiel DESC;


/*
Úloha 5: Vyhľadajte zákazníkov, ktorí uskutočnili dokončené platby.
Zobrazte ID zákazníka, celé meno, počet prenájmov a celkovú sumu platieb.
Zobrazte iba zákazníkov, ktorých celková suma platieb presahuje 100 EUR.
Zoraďte podľa celkovej sumy platieb zostupne.
*/

SELECT
    z.id_zakaznika,
    CONCAT(z.meno, ' ', z.priezvisko) AS zakaznik,
    COUNT(DISTINCT pr.id_prenajmu) AS pocet_prenajmov,
    SUM(pl.suma) AS celkova_suma_platieb
FROM Zakaznik z
JOIN Prenajom pr
    ON z.id_zakaznika = pr.id_zakaznika
JOIN Platba pl
    ON pr.id_prenajmu = pl.id_prenajmu
WHERE pl.stav_platby = 'Completed'
GROUP BY
    z.id_zakaznika,
    z.meno,
    z.priezvisko
HAVING SUM(pl.suma) > 100
ORDER BY celkova_suma_platieb DESC;