CREATE DATABASE Azienda; #db nuovo creato
USE Azienda;#uso il nuovo db

#tabella store da creare
#id_store ,nome_store ,data_apertura ,indirizzo .cap ,telefono,email ,
#id_region → riferimento all’area geografica (chiave esterna verso Region)
#responsabile → 

#tabella region:,id_region .città .regione .area_geografica ,nazione

CREATE TABLE Region (
	id_region INT auto_increment PRIMARY KEY,
    città VARCHAR (50) NOT NULL,
    regione  VARCHAR (50) NOT NULL,
    area_geografica  VARCHAR (50) NOT NULL,
    nazione VARCHAR (50) NOT NULL
    );	
    
CREATE TABLE Store (
	id_store INT auto_increment PRIMARY KEY,
    nome_store VARCHAR (50) NOT NULL,
    data_apertura DATE NOT NULL,
    indirizzo VARCHAR (50) NOT NULL,
    cap VARCHAR (50) NOT NULL,
    telefono VARCHAR (50) NOT NULL,
    emai VARCHAR (50) NOT NULL,
    id_region INT,
    responsabile VARCHAR (50) NOT NULL,
    FOREIGN KEY (id_region) REFERENCES Region (id_region)
    );
    
    describe Region;
    
INSERT INTO Region ( città,regione,area_geografica,nazione)
VALUES ('Milano','Lombardia','Nord Italia','Italia'),
		('Torino','Piemonte','Nord Italia','Italia'),
        ('Firenze','Toscana','Centro Italia','Italia'),
        ('Roma','Lazio','Centro Italia','Italia'),
		('Napoli','Campania','Sud Italia','Italia');
        
Select * from Region;

describe Store;

INSERT INTO Store (nome_store,data_apertura,indirizzo,cap,telefono,emai,id_region,responsabile)
VALUES ('Store Milano Duomo','2017-04-10','Via Torino 15','20123','028765432','milano@azienda.it',1,'Marco Rossi'),
		('Store Milano Nord','2021-02-05','Corso Sempione 45','20145','023456789','milanonord@azienda.it',1,'Chiara Fontana'),
        ('Store Torino Centro','2018-07-22','Via Roma 98','10121','011334455','torino@azienda.it',2,'Luca Bianchi'),
        ('Store Firenze Ponte Vecchio','2019-09-12','Piazza della Signoria 3','50122','055667788','firenze@azienda.it',3,'Elisa Conti'),
        ('Store Roma Centro', '2020-01-15', 'Via del Corso, 120', '00186', '066778899', 'roma@azienda.it', 4, 'Davide Neri'),
		('Store Roma Nord', '2022-05-01', 'Viale Parioli, 87', '00197', '061234567', 'romanord@azienda.it', 4, 'Giulia Ferri'),
		('Store Napoli Centro', '2019-06-09', 'Via Toledo, 55', '80134', '081556677', 'napoli@azienda.it', 5, 'Francesco Russo'),
		('Store Napoli Vomero', '2023-03-30', 'Via Scarlatti, 22', '80129', '081998877', 'napolivomero@azienda.it', 5, 'Alessia Esposito'),
		('Store Torino Sud', '2021-08-25', 'Corso Unione Sovietica, 200', '10135', '011998822', 'torinosud@azienda.it', 2, 'Matteo Greco'),
		('Store Firenze Sud', '2020-11-11', 'Via Senese,90', '50124', '055778899', 'firenzesud@azienda.it', 3, 'Serena Martini');
        
	Select * from Store;
    
#aggiorno  un record nella colonna region
UPDATE Region
SET area_geografica = 'Nord'
WHERE id_region IN (1,2);

#eliminiamo un record dalla tabella store
DELETE FROM Store
WHERE id_store=8;

#modifico il telefono del record 1 in store
UPDATE store
SET telefono= '064175755'
WHERE id_store=1;

START TRANSACTION;
UPDATE Region SET città='bergamo' WHERE id_region=1;
SELECT * FROM Region
COMMIT;

START TRANSACTION;
UPDATE Store SET nome_store='store_bergamo' WHERE id_store=1;
UPDATE Store SET nome_store='store bergamo Nord' WHERE id_store=2;
COMMIT;

SELECT * FROM Store;


    

        

        

    

    
    
    
	
