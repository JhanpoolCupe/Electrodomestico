create database dbElectrodomesticos 

use dbElectrodomesticos 
create table CLIENTE(
	CODCLI  CHAR(4) PRIMARY KEY,
	NOMCLI VARCHAR(60),
	APECLI VARCHAR(80),
	EMACLI VARCHAR(80),
	CELCLI CHAR(9),
	DIRCLI VARCHAR(70),
	ESTCLI CHAR(1)
);

CREATE TABLE VENDEDOR(
	CODVEND CHAR(4) PRIMARY KEY,
	NOMVEND VARCHAR(60),
	APEVEND VARCHAR(80),
	EMAVEND VARCHAR(80),
	CELVEND CHAR(9),
	DIRVEND VARCHAR(70),
	ESTVEND CHAR(1)
);

CREATE TABLE PRODUCTO(
	CODPRO VARCHAR(5) PRIMARY KEY,
	DESCPRO VARCHAR(80),
	CATPRO CHAR(1),
	PREPRO DECIMAL(8,2),
	STOCKPRO INT,
	ESTPRO CHAR(1)
);

CREATE TABLE PROVEEDOR(
	CODPROV CHAR(5) PRIMARY KEY,
	RAZSOCPROV VARCHAR(90),
	RUCPROV VARCHAR(11),
	EMAPROV VARCHAR(70),
	ESTPROV CHAR(1)
);

CREATE TABLE VENTA(
	CODVENT CHAR(5) PRIMARY KEY,
	FECVEN DATETIME,
	CODCLI CHAR(4),
	CODVEND CHAR(4),
	ESTVEN CHAR(1)
);

CREATE TABLE VENTADETALLE(
	IDVENDET INT PRIMARY KEY,
	CODVEN CHAR(5),
	CODPRO CHAR(5),
	CANTPRO INT
);

CREATE TABLE COMPRA(
	CODCOM VARCHAR(5) PRIMARY KEY,
	FECCOM DATETIME,
	CODVEND CHAR(4),
	CODPROV CHAR(5),
	ESTCOM CHAR(1)
);

CREATE TABLE COMPRADETALLE(
	IDCOMDET INT PRIMARY KEY,
	CODCOM CHAR(5),
	CODPRO CHAR(5),
	CANTPRO INT
);


INSERT INTO CLIENTE
(CODCLI,NOMCLI,APECLI,EMACLI,CELCLI,DIRCLI,ESTCLI)
VALUES
('CL01','Juana','Campos Ortiz','juana.campos@gmail.com','987485152','Av. Miraflores','A'),
('CL02','Sof?a','Barrios Salcedo','sofia.barrios@outlook.com','','Jr.Huallaga','A'),
('CL03','Claudio','P?rez Luna','claudio.perez@outlook.com','984512147','Av.Libertadores','A'),
('CL04','Marcos','?vila Manco','marcos.avila@yahoo.com','','Calle Huallaga','A'),
('CL05','Anastacio','Salomon Inti','anastasio.salomon@outlook.com','','Jr.San Martin','A');

SELECT * FROM CLIENTE

INSERT INTO VENDEDOR
(CODVEND,NOMVEND,APEVEND,EMAVEND,CELVEND,DIRVEND,ESTVEND)
VALUES
('VEN1','Gloria','Carrizales Paredes','gloria.carrizales@gmail.com','984574123','Calle Las Begonias','A'),
('VEN2','Gabriel','Lozada Lombardi','gabriel.lozada@gmail.com','974512368','Av. Los Girasoles','A'),
('VEN3','Gilberto','Martinez Guerra','gilberto.martinez@gmail.com','','Jr. Palomares','A');

INSERT INTO PROVEEDOR
(CODPROV,RAZSOCPROV,RUCPROV,EMAPROV,ESTPROV)
VALUES
('PRV01','LG Corportation','87542136951','informes@lg.com.pe','A'),
('PRV02','SONY','45213698741','informes@sony.com.pe','A'),
('PRV03','SAMSUNG','85321697661','informes@samsung.com.pe','A'),
('PRV04','OSTER SRL','55663214478','informes@oster.com.pe','A'),
('PRV05','ASUS','99663325478','informes@asus.com.pe','A');


INSERT INTO PRODUCTO
(CODPRO,DESCPRO,CATPRO,PREPRO,STOCKPRO,ESTPRO)
VALUES
('PRO01','Refrigeradora LG Side By Side','1','4149','15','A'),
('PRO02','Refrigeradora SBS 602L','1','3599','10','A'),
('PRO03','Refrigeradora Top Mount 500 L','1','2799','8','A'),
('PRO04','TV','1','4149','15','A'),
('PRO05','Refrigeradora LG Side By Side','1','4149','15','A'),
('PRO06','Refrigeradora LG Side By Side','1','4149','15','A'),
('PRO07','Refrigeradora LG Side By Side','1','4149','15','A'),
('PRO08','Refrigeradora LG Side By Side','1','4149','15','A'),
('PRO09','Refrigeradora LG Side By Side','1','4149','15','A'),
('PRO10','Refrigeradora LG Side By Side','1','4149','15','A'),
('PRO11','Refrigeradora LG Side By Side','1','4149','15','A'),
('PRO12','Refrigeradora LG Side By Side','1','4149','15','A');
GO



CREATE PROCEDURE InsertCLIENTE
(
@CODCLI CHAR(4),
@NOMCLI VARCHAR(60),
@APECLI VARCHAR(80),
@EMACLI VARCHAR(80),
@CELCLI CHAR(9),
@DIRCLI VARCHAR(70),
@ESTCLI CHAR(1)
)

 AS BEGIN
 
 INSERT INTO CLIENTE
 (CODCLI,NOMCLI,APECLI,EMACLI,CELCLI,DIRCLI,ESTCLI)
 VALUES
 (@CODCLI,@NOMCLI,@APECLI,@EMACLI,@CELCLI,@DIRCLI,@ESTCLI)
 COMMIT TRAN
 END 
 GO;

 @InsertCLIENTE



ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE
FOREIGN KEY (CODCLI) REFERENCES CLIENTE(CODCLI);

ALTER TABLE VENTA ADD CONSTRAINT VENTA_VENDEDOR
FOREIGN KEY (CODVEND) REFERENCES VENDEDOR(CODVEND);

ALTER TABLE COMPRA ADD CONSTRAINT COMPRA_VENDEDOR
FOREIGN KEY (CODVEND) REFERENCES VENDEDOR(CODVEND);

ALTER TABLE VENTADETALLE ADD CONSTRAINT VENTADETALLE_VENTA
FOREIGN KEY (CODVEN) REFERENCES VENTA(CODVEN);

ALTER TABLE COMPRADETALLE ADD CONSTRAINT COMPRADETALLE_COMPRA
FOREIGN KEY (CODCOM) REFERENCES COMPRA(CODCOM);

ALTER TABLE COMPRADETALLE ADD CONSTRAINT COMPRADETALLE_PRODUCTO
FOREIGN KEY (CODPRO) REFERENCES PRODUCTO(CODPRO);

ALTER TABLE COMPRA ADD CONSTRAINT COMPRA_PROVEEDOR
FOREIGN KEY (CODPROV) REFERENCES PROVEEDOR(CODPROV)
