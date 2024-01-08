/*--ho risposto in sequenza alle domande fatte a margine--*/
CREATE TABLE vendite(
    id_transazione VARCHAR (255) NOT NULL,
    categoria_del_prodotto VARCHAR (50) NOT NULL,
    costo DECIMAL (10, 2) NOT NULL,
    sconto DECIMAL (10, 2) NOT NULL
);
CREATE TABLE dettagli_vendite(
    id_transazione VARCHAR (255) NOT NULL,
    data_transazione DATE NOT NULL,
    quantità INTEGER (20) NOT NULL
);
INSERT INTO vendite(id_transazione,categoria_del_prodotto,costo,sconto) VALUES
    ('0001','elettronica','1700','25'),
    ('0002','sport','99','50'),
    ('0003','bellezza','39','50'),
    ('0004','elettronica','200','70'),
    ('0005','sport','20','30'),
    ('0006','sport','50','60'),
    ('0007','musica','1000','45'),
    ('0008','elettronica','100','60'),
    ('0009','bellezza','40','15'),
    ('0010','sport','35','45'),
    ('0011','bellezza','45','55'),
    ('0012','elettronica','550','65'),
    ('0013','sport','25','15'),
    ('0014','musica','250','25'),
    ('0015','sport','56','40'),
    ('0016','elettronica','300','25'),
    ('0017','sport','45','70'),
    ('0018','musica','250','55'),
    ('0019','elettronica','200','55'),
    ('0020','sport','150','60');

INSERT INTO dettagli_vendite (id_transazione,data_transazione,quantità) VALUES 
    ('0001','2023-12-06','8'),
    ('0002','2023-12-01','2'),
    ('0003','2023-11-16','1'),
    ('0004','2023-07-29','1'),
    ('0005','2023-09-15','6'),
    ('0006','2023-08-02','4'),
    ('0007','2023-04-01','4'),
    ('0008','2023-12-12','2'),
    ('0009','2023-08-03','7'),
    ('0010','2022-02-02','4'),
    ('0011','2023-02-06','8'),
    ('0012','2023-01-09','10'),
    ('0013','2023-06-06','2'),
    ('0014','2023-11-11','2'),
    ('0015','2023-06-10','3'),
    ('0016','2023-09-12','2'),
    ('0017','2022-12-12','6'),
    ('0018','2023-11-02','4'),
    ('0019','2023-10-20','3'),
    ('0020','2023-11-11','2');

SELECT *
    FROM vendite
    INNER JOIN dettagli_vendite
    ON vendite.id_transazione = dettagli_vendite.id_transazione
    WHERE dettagli_vendite.data_transazione > '2023-06-01';

SELECT CONCAT(sconto, '%') AS sconto_con_percentuale /*--non sono riuscito a metterlo di base in %--*/
    FROM vendite  
    INNER JOIN dettagli_vendite
    ON vendite.id_transazione = dettagli_vendite.id_transazione
    WHERE vendite.sconto > 50;

SELECT categoria_del_prodotto, SUM(costo) AS totale_vendite
    FROM vendite
    GROUP BY categoria_del_prodotto;

SELECT categoria_del_prodotto, SUM(quantità) AS totale_prodotti_venduti
    FROM vendite
    INNER JOIN dettagli_vendite ON vendite.id_transazione = dettagli_vendite.id_transazione
    GROUP BY categoria_del_prodotto;
SELECT *
    FROM vendite
    INNER JOIN dettagli_vendite ON vendite.id_transazione = dettagli_vendite.id_transazione
    WHERE data_transazione >= '2023-10-01';
SELECT YEAR(data_transazione) AS anno, MONTH(data_transazione) AS mese, SUM(costo) AS totale_vendite
    FROM vendite
    INNER JOIN dettagli_vendite ON vendite.id_transazione = dettagli_vendite.id_transazione
    WHERE data_transazione >= '2023-10-01'
    GROUP BY YEAR(data_transazione), MONTH(data_transazione);
SELECT categoria_del_prodotto, AVG(sconto) AS sconto_medio
    FROM vendite
    GROUP BY categoria_del_prodotto
    ORDER BY sconto_medio DESC
LIMIT 1;

SELECT MONTH(data_transazione) AS Mese, SUM(quantità) AS Quantità /*--per rispondere alla domanda 8/9 avevo in mente una cosa un po' più complessa ma non sono riuscito ad attuarla--*/
    FROM dettagli_vendite
    GROUP BY MONTH(data_transazione)
    ORDER BY SUM(quantità) DESC;

/* SELECT IDCliente, COUNT(IDVendita) AS NumeroAcquisti ----RISPOSTA 10
    FROM clienti
    GROUP BY IDCliente
    ORDER BY NumeroAcquisti DESC
    LIMIT 5;