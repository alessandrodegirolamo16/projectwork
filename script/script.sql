CREATE DATABASE  IF NOT EXISTS `nis2_prod` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nis2_prod`;
-- MySQL dump 10.13  Distrib 8.0.45, for macos15 (arm64)
--
-- Host: localhost    Database: nis2_prod_def
-- ------------------------------------------------------
-- Server version	9.6.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--

--
-- Table structure for table `asset`
--

DROP TABLE IF EXISTS `asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset` (
  `idAsset` int NOT NULL AUTO_INCREMENT,
  `nomeAsset` varchar(100) NOT NULL,
  `idTipoAsset` int NOT NULL COMMENT 'FK',
  `descrizioneAsset` varchar(255) DEFAULT NULL,
  `livelloCriticita` enum('Bassa','Media','Alta','Critica') NOT NULL DEFAULT 'Bassa',
  `versionAsset` varchar(10) NOT NULL,
  `archivio` tinyint(1) NOT NULL DEFAULT '0',
  `idFornitore` int DEFAULT NULL,
  `idResponsabile` int NOT NULL,
  PRIMARY KEY (`idAsset`),
  KEY `fk_asset_fornitore_idx` (`idFornitore`),
  KEY `fk_asset_tipoasset_idx` (`idTipoAsset`),
  KEY `fk_asset_responsabile_idx` (`idResponsabile`),
  CONSTRAINT `fk_asset_fornitore` FOREIGN KEY (`idFornitore`) REFERENCES `fornitore` (`idFornitore`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_asset_responsabile` FOREIGN KEY (`idResponsabile`) REFERENCES `responsabile` (`idResponsabile`),
  CONSTRAINT `fk_asset_tipoasset` FOREIGN KEY (`idTipoAsset`) REFERENCES `tipoAsset` (`idTipoAsset`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset`
--

LOCK TABLES `asset` WRITE;
/*!40000 ALTER TABLE `asset` DISABLE KEYS */;
INSERT INTO `asset` VALUES (1,'ERP SAP S/4HANA',6,'Core business management','Critica','2023.3',0,2,3),(2,'PLC Linea Confezionamento 01',3,'Controllo automazione linea 1','Alta','v4.5.1',0,4,4),(3,'Database Formule Segrete',4,'DB SQL con brevetti e ricette','Critica','1.1',0,NULL,1),(4,'Server Historian Produzione',1,'Archivio dati telemetria farmaci','Media','v3.1',0,4,2),(5,'Workstation Controllo Qualità',2,'PC analisi spettrografica','Media','Win10_P',0,NULL,4),(6,'Frigorifero IoT Smart-Cold',5,'Monitoraggio temperatura vaccini','Alta','firm_2.1',0,1,4),(7,'Firewall Perimetrale HQ',9,'Protezione rete aziendale','Critica','OS_7.4',0,2,1),(8,'NAS Backup Offline',10,'Backup immutabile dei dati','Critica','v6.3',0,NULL,3),(9,'Sensore Pressione Reattore A',5,'Monitoraggio critico chimico','Alta','1.2.0',0,4,2),(10,'Laptop Direzione Generale',2,'Dispositivo CEO','Media','v2.3',0,NULL,1);
/*!40000 ALTER TABLE `asset` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_assetlog` AFTER UPDATE ON `asset` FOR EACH ROW BEGIN
	IF(
		NOT(OLD.nomeAsset <=> NEW.nomeAsset)
        OR NOT(OLD.idTipoAsset <=> NEW.idTipoAsset)
        OR NOT(OLD.descrizioneAsset <=> NEW.descrizioneAsset)
        OR NOT(OLD.livelloCriticita <=> NEW.livelloCriticita)
        OR NOT(OLD.versionAsset <=> NEW.versionAsset)
        OR NOT(OLD.idFornitore <=> NEW.idFornitore)
        OR NOT(OLD.idResponsabile <=> NEW.idResponsabile)
	) THEN
    INSERT INTO asset_log(
		nomeAssetLog
        , idTipoAssetLog
        , descrizioneAssetLog
        , livelloCriticitaLog
        , versionAssetLog
        , idFornitoreLog
        , idResponsabileLog
        , dataAssetLog
		, idAsset
    ) VALUES(
		OLD.nomeAsset
        , OLD.idTipoAsset
        , OLD.descrizioneAsset
        , OLD.livelloCriticita
        , OLD.versionAsset
        , OLD.idFornitore
        , OLD.idResponsabile
        , NOW()
        , OLD.idAsset
    );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `asset_history`
--

DROP TABLE IF EXISTS `asset_history`;
/*!50001 DROP VIEW IF EXISTS `asset_history`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `asset_history` AS SELECT 
 1 AS `DATA`,
 1 AS `ASSET`,
 1 AS `CRITICITA`,
 1 AS `TIPO_VARIAZIONE`,
 1 AS `ULTIMO_LIV_MATURITA_RILEVATO`,
 1 AS `RESPONSABILE`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `asset_log`
--

DROP TABLE IF EXISTS `asset_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_log` (
  `idAssetLog` int NOT NULL AUTO_INCREMENT,
  `nomeAssetLog` varchar(100) NOT NULL,
  `idTipoAssetLog` int NOT NULL,
  `descrizioneAssetLog` varchar(255) NOT NULL,
  `livelloCriticitaLog` enum('Bassa','Media','Alta','Critica') NOT NULL,
  `versionAssetLog` varchar(10) NOT NULL,
  `idFornitoreLog` int DEFAULT NULL,
  `idResponsabileLog` int DEFAULT NULL,
  `dataAssetLog` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idAsset` int DEFAULT NULL,
  PRIMARY KEY (`idAssetLog`),
  KEY `fk_assetlog_asset_idx` (`idAsset`),
  CONSTRAINT `fk_assetlog_asset` FOREIGN KEY (`idAsset`) REFERENCES `asset` (`idAsset`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_log`
--

LOCK TABLES `asset_log` WRITE;
/*!40000 ALTER TABLE `asset_log` DISABLE KEYS */;
INSERT INTO `asset_log` VALUES (5,'Database Formule Segrete',4,'DB SQL con brevetti e ricette','Critica','1.0',NULL,1,'2026-03-26 21:29:40',3),(6,'PLC Linea Confezionamento 01',3,'Controllo automazione linea 1','Alta','v4.5',4,2,'2026-03-26 21:29:40',2),(7,'ERP SAP S/4HANA',6,'Core business management','Critica','2023.2',2,3,'2026-03-26 21:29:40',1),(8,'PLC Linea Confezionamento 01',3,'Controllo automazione linea 1','Alta','v4.5.1',4,2,'2026-03-27 22:21:05',2);
/*!40000 ALTER TABLE `asset_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_servizio`
--

DROP TABLE IF EXISTS `asset_servizio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_servizio` (
  `idAsset` int NOT NULL,
  `idServizio` int NOT NULL,
  PRIMARY KEY (`idAsset`,`idServizio`),
  KEY `fk_assetservizio_servizio_idx` (`idServizio`),
  CONSTRAINT `fk_assetservizio_asset` FOREIGN KEY (`idAsset`) REFERENCES `asset` (`idAsset`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_assetservizio_servizio` FOREIGN KEY (`idServizio`) REFERENCES `servizio` (`idServizio`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_servizio`
--

LOCK TABLES `asset_servizio` WRITE;
/*!40000 ALTER TABLE `asset_servizio` DISABLE KEYS */;
INSERT INTO `asset_servizio` VALUES (1,1),(2,1),(3,1),(4,1),(9,1),(1,2),(7,2),(8,2),(10,2),(3,3),(6,3),(7,3),(8,3),(3,4),(5,4),(7,4),(10,4),(1,5),(7,5);
/*!40000 ALTER TABLE `asset_servizio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `codiceCategoria` varchar(10) NOT NULL,
  `nomeCategoria` varchar(100) NOT NULL,
  `descrizioneCategoria` varchar(255) DEFAULT NULL,
  `codiceFunzione` varchar(10) NOT NULL,
  PRIMARY KEY (`codiceCategoria`),
  KEY `fk_categoria_funzione_idx` (`codiceCategoria`),
  KEY `fk_categoria_funzione_idx1` (`codiceFunzione`),
  CONSTRAINT `fk_categoria_funzione` FOREIGN KEY (`codiceFunzione`) REFERENCES `funzione` (`codiceFunzione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES ('DE.AE','Adverse Event Analysis','Anomalie, indicatori di compromissione e altri eventi potenzialmente avversi sono analizzati per caratterizzare gli eventi e rilevare incidenti di cybersecurity','DE'),('DE.CM','Continuous Monitoring','Gli asset sono monitorati per trovare anomalie, indicatori di compromissione e altri eventi potenzialmente avversi','DE'),('GV.OC','Organizational Context','Le circostanze — missione, aspettative degli stakeholder, dipendenze e requisiti legali, normativi e contrattuali — che circondano le decisioni di gestione del rischio di cybersecurity dell\'organizzazione sono comprese','GV'),('GV.OV','Oversight','I risultati delle attività di gestione del rischio di cybersecurity a livello organizzativo e le performance vengono utilizzati per informare, migliorare e adeguare la strategia di gestione del rischio','GV'),('GV.PO','Policy','La politica di cybersecurity organizzativa è stabilita, comunicata e applicata','GV'),('GV.RM','Risk Management Strategy','Le priorità, i vincoli, le dichiarazioni di tolleranza e appetito al rischio e le assunzioni dell\'organizzazione sono stabilite, comunicate e utilizzate per supportare le decisioni operative sul rischio','GV'),('GV.RR','Roles, Responsibilities, and Authorities','I ruoli, le responsabilità e le autorità di cybersecurity per favorire la responsabilità, la valutazione delle performance e il miglioramento continuo sono stabiliti e comunicati','GV'),('GV.SC','Cybersecurity Supply Chain Risk Management','I processi di gestione del rischio cyber nella supply chain sono identificati, stabiliti, gestiti, monitorati e migliorati dagli stakeholder organizzativi','GV'),('ID.AM','Asset Management','Gli asset che consentono all\'organizzazione di raggiungere gli scopi aziendali sono identificati e gestiti in modo coerente con la loro importanza relativa agli obiettivi organizzativi e alla strategia di rischio','ID'),('ID.IM','Improvement','I miglioramenti ai processi, alle procedure e alle attività di gestione del rischio di cybersecurity organizzativo sono identificati in tutte le Funzioni CSF','ID'),('ID.RA','Risk Assessment','Il rischio di cybersecurity per l\'organizzazione, gli asset e gli individui è compreso dall\'organizzazione','ID'),('PR.AA','Identity Management, Authentication, and Access Control','L\'accesso agli asset fisici e logici è limitato agli utenti, ai servizi e all\'hardware autorizzati e gestito in modo commisurato al rischio valutato di accesso non autorizzato','PR'),('PR.AT','Awareness and Training','Il personale dell\'organizzazione riceve formazione e sensibilizzazione sulla cybersecurity in modo da poter eseguire i propri compiti correlati alla cybersecurity','PR'),('PR.DS','Data Security','I dati sono gestiti in modo coerente con la strategia di rischio dell\'organizzazione per proteggere la riservatezza, l\'integrità e la disponibilità delle informazioni','PR'),('PR.IR','Technology Infrastructure Resilience','Le architetture di sicurezza sono gestite con la strategia di rischio dell\'organizzazione per proteggere la riservatezza, l\'integrità e la disponibilità degli asset e la resilienza organizzativa','PR'),('PR.PS','Platform Security','L\'hardware, il software e i servizi delle piattaforme fisiche e virtuali sono gestiti in modo coerente con la strategia di rischio dell\'organizzazione','PR'),('RC.CO','Incident Recovery Communication','Le attività di ripristino sono coordinate con le parti interne ed esterne','RC'),('RC.RP','Incident Recovery Plan Execution','Le attività di ripristino sono eseguite per garantire la disponibilità operativa dei sistemi e dei servizi interessati da incidenti di cybersecurity','RC'),('RS.AN','Incident Analysis','Vengono condotte indagini per garantire una risposta efficace e supportare le attività forensi e di ripristino','RS'),('RS.CO','Incident Response Reporting and Communication','Le attività di risposta sono coordinate con gli stakeholder interni ed esterni come richiesto da leggi, regolamenti o politiche','RS'),('RS.MA','Incident Management','Le risposte agli incidenti di cybersecurity rilevati sono gestite','RS'),('RS.MI','Incident Mitigation','Vengono eseguite attività per prevenire l\'espansione di un evento e mitigarne gli effetti','RS');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `compliance_framework`
--

DROP TABLE IF EXISTS `compliance_framework`;
/*!50001 DROP VIEW IF EXISTS `compliance_framework`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `compliance_framework` AS SELECT 
 1 AS `FUNZIONE`,
 1 AS `CATEGORIA`,
 1 AS `TOT_CONTROLLI_ATTESI`,
 1 AS `MEDIA_PROFILO_TARGET`,
 1 AS `MEDIA_PROFILO_ATTUALE`,
 1 AS `GAP_MEDIO`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `controllo`
--

DROP TABLE IF EXISTS `controllo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controllo` (
  `idControllo` int NOT NULL AUTO_INCREMENT,
  `descrizioneControllo` varchar(255) NOT NULL,
  `idPrototipo` int NOT NULL,
  `codiceSottocategoria` varchar(10) NOT NULL,
  PRIMARY KEY (`idControllo`),
  KEY `fk_controllo_prototiposottocategoria_idx` (`idPrototipo`),
  KEY `fk_controllo_prototiposottocategoria_2_idx` (`codiceSottocategoria`),
  KEY `fk_controllo_prototiposottocategoria_idx1` (`idPrototipo`,`codiceSottocategoria`),
  CONSTRAINT `fk_controllo_prototiposottocategoria` FOREIGN KEY (`idPrototipo`, `codiceSottocategoria`) REFERENCES `prototipo_sottocategoria` (`idPrototipo`, `codiceSottocategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controllo`
--

LOCK TABLES `controllo` WRITE;
/*!40000 ALTER TABLE `controllo` DISABLE KEYS */;
INSERT INTO `controllo` VALUES (1,'Censimento automatico di tutti i PLC e sensori di linea tramite scansione passiva',1,'ID.AM-01'),(2,'Inventario centralizzato di tutte le licenze software dei sistemi di laboratorio',1,'ID.AM-02'),(3,'Procedura formale per la ricezione e gestione di bug report su software medicali',1,'ID.RA-08'),(4,'Analisi dei rischi per ogni nuovo macchinario di produzione prima dell\'acquisto',1,'ID.RA-05'),(5,'Implementazione MFA per l\'accesso remoto ai sistemi ERP e SCADA',1,'PR.AA-01'),(6,'Revisione semestrale dei privilegi di accesso alle cartelle delle ricette farmaceutiche',1,'PR.AA-03'),(7,'Cifratura dei dati dei pazienti nei database dei test clinici (AES-256)',1,'PR.DS-01'),(8,'Test di ripristino mensile dei backup dei dati di produzione',1,'PR.DS-11'),(9,'Log management centralizzato per rilevare accessi anomali fuori orario lavorativo',1,'DE.CM-01'),(10,'Monitoraggio real-time dell\'integrità del firmware dei dispositivi IoT',1,'DE.CM-09');
/*!40000 ALTER TABLE `controllo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `dettaglio_gap_critici`
--

DROP TABLE IF EXISTS `dettaglio_gap_critici`;
/*!50001 DROP VIEW IF EXISTS `dettaglio_gap_critici`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dettaglio_gap_critici` AS SELECT 
 1 AS `ASSET`,
 1 AS `CRITICITA_ASSET`,
 1 AS `ID_REQUISITO`,
 1 AS `DESCRIZIONE_REQUISITO`,
 1 AS `TARGET_ACN`,
 1 AS `LIVELLO_RILEVATO`,
 1 AS `DEFICIT_MATURITA`,
 1 AS `RESPONSABILE`,
 1 AS `RUOLO_RESPONSABILE`,
 1 AS `CELLULARE_RESPONSABILE`,
 1 AS `EMAIL_RESPONSABILE`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fornitore`
--

DROP TABLE IF EXISTS `fornitore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornitore` (
  `idFornitore` int NOT NULL AUTO_INCREMENT,
  `ragioneSociale` varchar(100) NOT NULL,
  `partitaIva` varchar(20) NOT NULL,
  `livelloCriticita` enum('Bassa','Media','Alta','Critica') NOT NULL,
  `contattoEmergenza` varchar(20) NOT NULL,
  `luogoTrattamentoDati` enum('UE','Extra UE') NOT NULL,
  `dataUltimaValutazioneSicurezza` date DEFAULT NULL,
  `tempoRipristinoGarantito` int DEFAULT NULL,
  `idTipoFornitore` int NOT NULL,
  PRIMARY KEY (`idFornitore`),
  UNIQUE KEY `partitaIva_UNIQUE` (`partitaIva`),
  KEY `fk_fornitore_tipofornitore_idx` (`idTipoFornitore`),
  CONSTRAINT `fk_fornitore_tipofornitore` FOREIGN KEY (`idTipoFornitore`) REFERENCES `tipoFornitore` (`idTipoFornitore`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornitore`
--

LOCK TABLES `fornitore` WRITE;
/*!40000 ALTER TABLE `fornitore` DISABLE KEYS */;
INSERT INTO `fornitore` VALUES (1,'PharmaLogistics SpA','B4233521','Alta','+34 629032980','UE','2026-03-23',6,5),(2,'GlobalCloud Services','GB133554676','Media','+44 07665492099','Extra UE','2026-01-15',12,2),(3,'BioTech API Solutions','IT8293930153','Critica','+39 0284993008','UE','2026-02-22',4,1),(4,'Industrial Controls Sec','LT291821029','Critica','+370 65492200','UE','2025-11-20',2,3),(5,'Compliance Experts','PT414345676','Bassa','+351 214313452','UE','2025-12-13',48,4);
/*!40000 ALTER TABLE `fornitore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funzione`
--

DROP TABLE IF EXISTS `funzione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funzione` (
  `codiceFunzione` varchar(10) NOT NULL,
  `nomeFunzione` varchar(10) NOT NULL,
  `descrizioneFunzione` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codiceFunzione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funzione`
--

LOCK TABLES `funzione` WRITE;
/*!40000 ALTER TABLE `funzione` DISABLE KEYS */;
INSERT INTO `funzione` VALUES ('DE','Detect','Le attività per identificare tempestivamente un evento di cybersecurity.'),('GV','Govern','L’orientamento strategico e la governance della cybersecurity.'),('ID','Identify','La comprensione del rischio per gestire le risorse e i processi.'),('PR','Protect','Le misure di salvaguardia per limitare o contenere l’impatto di un evento.'),('RC','Recover','Le attività per ripristinare i servizi compromessi da un incidente.'),('RS','Respond','Le azioni intraprese in risposta a un incidente rilevato.');
/*!40000 ALTER TABLE `funzione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livelloMaturita`
--

DROP TABLE IF EXISTS `livelloMaturita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livelloMaturita` (
  `idLivelloMaturita` int NOT NULL,
  `nomeLivello` varchar(30) NOT NULL,
  `descrizioneLivello` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idLivelloMaturita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livelloMaturita`
--

LOCK TABLES `livelloMaturita` WRITE;
/*!40000 ALTER TABLE `livelloMaturita` DISABLE KEYS */;
INSERT INTO `livelloMaturita` VALUES (1,'INIZIALE','I processi sono ad hoc, reattivi e imprevedibili. Il successo dipende dagli sforzi individuali.'),(2,'GESTITO','I progetti sono pianificati, performati, misurati e controllati a livello di singolo progetto.'),(3,'DEFINITO','I processi sono standardizzati a livello organizzativo, proattivi e documentati.'),(4,'GESTITO QUANTITATIVAMENTE','L\'organizzazione è guidata dai dati, con processi misurati e controllati statisticamente.'),(5,'Ottimizzato','Focus sul miglioramento continuo, con processi stabili, flessibili e orientati all\'innovazione.');
/*!40000 ALTER TABLE `livelloMaturita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `media_sicurezza_supply_chain`
--

DROP TABLE IF EXISTS `media_sicurezza_supply_chain`;
/*!50001 DROP VIEW IF EXISTS `media_sicurezza_supply_chain`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `media_sicurezza_supply_chain` AS SELECT 
 1 AS `FORNITORE`,
 1 AS `TIPO`,
 1 AS `CRITICITA_FORNITORE`,
 1 AS `ZONA_DATI`,
 1 AS `NUMERO_ASSET_GESTITI`,
 1 AS `RATING_SICUREZZA_MEDIO`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `prototipo`
--

DROP TABLE IF EXISTS `prototipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prototipo` (
  `idPrototipo` int NOT NULL AUTO_INCREMENT,
  `nomePrototipo` varchar(50) NOT NULL,
  PRIMARY KEY (`idPrototipo`),
  UNIQUE KEY `nomePrototipo_UNIQUE` (`nomePrototipo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prototipo`
--

LOCK TABLES `prototipo` WRITE;
/*!40000 ALTER TABLE `prototipo` DISABLE KEYS */;
INSERT INTO `prototipo` VALUES (1,'Soggetto Importante');
/*!40000 ALTER TABLE `prototipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prototipo_sottocategoria`
--

DROP TABLE IF EXISTS `prototipo_sottocategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prototipo_sottocategoria` (
  `idPrototipo` int NOT NULL,
  `codiceSottocategoria` varchar(10) NOT NULL,
  `priorita` enum('Bassa','Media','Alta') NOT NULL DEFAULT 'Bassa',
  `livelloMaturitaTarget` int NOT NULL,
  PRIMARY KEY (`idPrototipo`,`codiceSottocategoria`),
  KEY `fk_prototiposottocategoria_sottocategoria_idx` (`codiceSottocategoria`),
  KEY `fk_prototiposottocategoria_livellomaturita_idx` (`livelloMaturitaTarget`),
  CONSTRAINT `fk_prototiposottocategoria_livellomaturita` FOREIGN KEY (`livelloMaturitaTarget`) REFERENCES `livelloMaturita` (`idLivelloMaturita`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_prototiposottocategoria_prototipo` FOREIGN KEY (`idPrototipo`) REFERENCES `prototipo` (`idPrototipo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_prototiposottocategoria_sottocategoria` FOREIGN KEY (`codiceSottocategoria`) REFERENCES `sottocategoria` (`codiceSottocategoria`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prototipo_sottocategoria`
--

LOCK TABLES `prototipo_sottocategoria` WRITE;
/*!40000 ALTER TABLE `prototipo_sottocategoria` DISABLE KEYS */;
INSERT INTO `prototipo_sottocategoria` VALUES (1,'DE.CM-01','Alta',4),(1,'DE.CM-09','Alta',4),(1,'GV.OC-04','Alta',4),(1,'GV.PO-01','Alta',4),(1,'GV.RM-03','Media',3),(1,'GV.RR-02','Alta',4),(1,'GV.SC-01','Alta',5),(1,'ID.AM-01','Alta',4),(1,'ID.AM-02','Alta',4),(1,'ID.IM-04','Alta',5),(1,'ID.RA-05','Alta',4),(1,'ID.RA-08','Media',3),(1,'PR.AA-01','Alta',4),(1,'PR.AA-03','Alta',4),(1,'PR.AT-01','Media',3),(1,'PR.DS-01','Alta',5),(1,'PR.DS-11','Alta',5),(1,'PR.IR-01','Alta',4),(1,'PR.PS-02','Media',3),(1,'RC.RP-01','Alta',5),(1,'RS.CO-02','Media',3),(1,'RS.MA-01','Alta',4);
/*!40000 ALTER TABLE `prototipo_sottocategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsabile`
--

DROP TABLE IF EXISTS `responsabile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsabile` (
  `idResponsabile` int NOT NULL AUTO_INCREMENT,
  `nomeResponsabile` varchar(30) NOT NULL,
  `cognomeResponsabile` varchar(30) NOT NULL,
  `codiceFiscaleResponsabile` varchar(16) NOT NULL,
  `ruoloAziendale` varchar(50) NOT NULL,
  `cellulare` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `dataUltimaFormazione` date DEFAULT NULL,
  PRIMARY KEY (`idResponsabile`),
  UNIQUE KEY `codiceFiscaleResponsabile_UNIQUE` (`codiceFiscaleResponsabile`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsabile`
--

LOCK TABLES `responsabile` WRITE;
/*!40000 ALTER TABLE `responsabile` DISABLE KEYS */;
INSERT INTO `responsabile` VALUES (1,'Marco','Rossi','RSSMRC78B18C594L','CISO','3331234567','mariorossi@gmail.com','2025-11-10'),(2,'Elena','Bianchi','BNCLNE86D49F839K','Responsabile Produzione OT','3337654321','elenabianchi@gmail.com','2026-01-15'),(3,'Luca','Verdi','VRDLCU81D25F694D','IT Manager','3339876543','lucaverdi@gmail.com','2025-12-20'),(4,'Sara','Neri','NRESRA93F69I807D','Quality Assurance Manager','3341122334','saraneri@gmail.com','2026-02-01'),(5,'Giulia','Galli','GLLGLI88G45I323Z','DPO','3355566778','giuliagalli@gmail.com','2025-10-15');
/*!40000 ALTER TABLE `responsabile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servizio`
--

DROP TABLE IF EXISTS `servizio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servizio` (
  `idServizio` int NOT NULL AUTO_INCREMENT,
  `nomeServizio` varchar(50) NOT NULL,
  `descrizioneServizio` varchar(255) DEFAULT NULL,
  `livelloCriticita` enum('Bassa','Media','Alta','Critica') NOT NULL,
  `RTO` int NOT NULL,
  PRIMARY KEY (`idServizio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servizio`
--

LOCK TABLES `servizio` WRITE;
/*!40000 ALTER TABLE `servizio` DISABLE KEYS */;
INSERT INTO `servizio` VALUES (1,'Produzione Farmaci salvavita','Linea attiva 24/7 per medicinali essenziali','Critica',4),(2,'Gestione Ordini e Fatturazione','Processo di vendita e distribuzione','Alta',24),(3,'Conservazione Catena del Freddo','Mantenimento temperatura stock magazzino','Critica',2),(4,'Ricerca e Sviluppo','Laboratori di analisi nuovi principi attivi','Media',48),(5,'Sito Web Istituzionale','Presenza online e portale trasparenza','Bassa',72);
/*!40000 ALTER TABLE `servizio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sottocategoria`
--

DROP TABLE IF EXISTS `sottocategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sottocategoria` (
  `codiceSottocategoria` varchar(10) NOT NULL,
  `descrizioneSottocategoria` varchar(255) DEFAULT NULL,
  `codiceCategoria` varchar(10) NOT NULL,
  PRIMARY KEY (`codiceSottocategoria`),
  KEY `fk_subcategory_category_idx` (`codiceCategoria`),
  CONSTRAINT `fk_sottocategoria_categoria` FOREIGN KEY (`codiceCategoria`) REFERENCES `categoria` (`codiceCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sottocategoria`
--

LOCK TABLES `sottocategoria` WRITE;
/*!40000 ALTER TABLE `sottocategoria` DISABLE KEYS */;
INSERT INTO `sottocategoria` VALUES ('DE.AE-02','Gli eventi potenzialmente avversi sono analizzati per comprendere meglio le attività associate','DE.AE'),('DE.AE-03','Le informazioni sono correlate da più fonti','DE.AE'),('DE.AE-04','L\'impatto e la portata stimati degli eventi avversi sono compresi','DE.AE'),('DE.AE-06','Le informazioni sugli eventi avversi sono fornite al personale e agli strumenti autorizzati','DE.AE'),('DE.AE-07','L\'intelligence sulle minacce cyber e altre informazioni contestuali sono integrate nell\'analisi','DE.AE'),('DE.AE-08','Gli incidenti sono dichiarati quando gli eventi avversi soddisfano i criteri di incidente definiti','DE.AE'),('DE.CM-01','Le reti e i servizi di rete sono monitorati per trovare eventi potenzialmente avversi','DE.CM'),('DE.CM-02','L\'ambiente fisico è monitorato per trovare eventi potenzialmente avversi','DE.CM'),('DE.CM-03','Le attività del personale e l\'utilizzo della tecnologia sono monitorati per trovare eventi potenzialmente avversi','DE.CM'),('DE.CM-06','Le attività e i servizi dei fornitori di servizi esterni sono monitorati per trovare eventi potenzialmente avversi','DE.CM'),('DE.CM-09','L\'hardware e il software di elaborazione, gli ambienti di runtime e i loro dati sono monitorati per trovare eventi potenzialmente avversi','DE.CM'),('GV.OC-01','La missione organizzativa è compresa e informa la gestione del rischio di cybersecurity','GV.OC'),('GV.OC-02','Gli stakeholder interni ed esterni sono compresi e le loro esigenze e aspettative riguardo alla gestione del rischio di cybersecurity sono comprese e considerate','GV.OC'),('GV.OC-03','I requisiti legali, normativi e contrattuali riguardanti la cybersecurity — inclusi gli obblighi di privacy e libertà civili — sono compresi e gestiti','GV.OC'),('GV.OC-04','Gli obiettivi critici, le capacità e i servizi da cui gli stakeholder esterni dipendono o che si aspettano dall\'organizzazione sono compresi e comunicati','GV.OC'),('GV.OC-05','I risultati, le capacità e i servizi da cui dipende l\'organizzazione sono compresi e comunicati','GV.OC'),('GV.OV-01','I risultati della strategia di gestione del rischio di cybersecurity sono rivisti per informare e adeguare la strategia e la direzione','GV.OV'),('GV.OV-02','La strategia di gestione del rischio di cybersecurity è rivista e adeguata per garantire la copertura dei requisiti e dei rischi organizzativi','GV.OV'),('GV.OV-03','Le performance della gestione del rischio di cybersecurity organizzativa sono valutate e riviste per gli adeguamenti necessari','GV.OV'),('GV.PO-01','La politica per la gestione dei rischi di cybersecurity è stabilita sulla base del contesto organizzativo, della strategia di cybersecurity e delle priorità ed è comunicata e applicata','GV.PO'),('GV.PO-02','La politica per la gestione dei rischi di cybersecurity è rivista, aggiornata, comunicata e applicata per riflettere cambiamenti nei requisiti, nelle minacce, nella tecnologia e nella missione organizzativa','GV.PO'),('GV.RM-01','Gli obiettivi di gestione del rischio sono stabiliti e concordati dagli stakeholder organizzativi','GV.RM'),('GV.RM-02','Le dichiarazioni di appetito al rischio e tolleranza al rischio sono stabilite, comunicate e mantenute','GV.RM'),('GV.RM-03','Le attività e i risultati della gestione del rischio di cybersecurity sono inclusi nei processi di gestione del rischio aziendale (ERM)','GV.RM'),('GV.RM-04','La direzione strategica che descrive le appropriate opzioni di risposta al rischio è stabilita e comunicata','GV.RM'),('GV.RM-05','Le linee di comunicazione nell\'organizzazione sono stabilite per i rischi di cybersecurity, inclusi i rischi da fornitori e altre terze parti','GV.RM'),('GV.RM-06','Un metodo standardizzato per calcolare, documentare, categorizzare e prioritizzare i rischi di cybersecurity è stabilito e comunicato','GV.RM'),('GV.RM-07','Le opportunità strategiche (rischi positivi) sono caratterizzate e incluse nelle discussioni organizzative sul rischio di cybersecurity','GV.RM'),('GV.RR-01','La leadership organizzativa è responsabile e accountable per il rischio di cybersecurity e promuove una cultura risk-aware, etica e in continuo miglioramento','GV.RR'),('GV.RR-02','I ruoli, le responsabilità e le autorità legate alla gestione del rischio di cybersecurity sono stabiliti, comunicati, compresi e applicati','GV.RR'),('GV.RR-03','Risorse adeguate sono allocate in modo commisurato alla strategia di rischio di cybersecurity, ai ruoli, alle responsabilità e alle politiche','GV.RR'),('GV.RR-04','La cybersecurity è inclusa nelle pratiche delle risorse umane','GV.RR'),('GV.SC-01','Un programma di gestione del rischio cyber nella supply chain, con strategia, obiettivi, politiche e processi, è stabilito e concordato dagli stakeholder organizzativi','GV.SC'),('GV.SC-02','I ruoli e le responsabilità di cybersecurity per fornitori, clienti e partner sono stabiliti, comunicati e coordinati internamente ed esternamente','GV.SC'),('GV.SC-03','La gestione del rischio cyber nella supply chain è integrata nei processi di cybersecurity, gestione del rischio aziendale, valutazione del rischio e miglioramento','GV.SC'),('GV.SC-04','I fornitori sono noti e prioritizzati in base alla criticità','GV.SC'),('GV.SC-05','I requisiti per affrontare i rischi di cybersecurity nella supply chain sono stabiliti, prioritizzati e integrati nei contratti e in altri tipi di accordi con fornitori e altre terze parti rilevanti','GV.SC'),('GV.SC-06','La pianificazione e la due diligence vengono eseguite per ridurre i rischi prima di entrare in relazioni formali con fornitori o altre terze parti','GV.SC'),('GV.SC-07','I rischi posti da un fornitore, dai suoi prodotti e servizi e da altre terze parti sono compresi, registrati, prioritizzati, valutati, affrontati e monitorati nel corso della relazione','GV.SC'),('GV.SC-08','I fornitori rilevanti e altre terze parti sono inclusi nelle attività di pianificazione, risposta e ripristino degli incidenti','GV.SC'),('GV.SC-09','Le pratiche di sicurezza della supply chain sono integrate nei programmi di cybersecurity e gestione del rischio aziendale e le loro performance sono monitorate lungo il ciclo di vita del prodotto tecnologico e del servizio','GV.SC'),('GV.SC-10','I piani di gestione del rischio cyber nella supply chain includono disposizioni per le attività che si verificano dopo la conclusione di un accordo di partnership o di servizio','GV.SC'),('ID.AM-01','Gli inventari dell\'hardware gestito dall\'organizzazione sono mantenuti','ID.AM'),('ID.AM-02','Gli inventari del software, dei servizi e dei sistemi gestiti dall\'organizzazione sono mantenuti','ID.AM'),('ID.AM-03','Le rappresentazioni dell\'architettura di rete autorizzata dell\'organizzazione e dei flussi di dati di rete interni ed esterni sono mantenute','ID.AM'),('ID.AM-04','Gli inventari dei servizi forniti dai fornitori sono mantenuti','ID.AM'),('ID.AM-05','Gli asset sono prioritizzati in base alla classificazione, alla criticità, alle risorse e all\'impatto sulla missione','ID.AM'),('ID.AM-07','Gli inventari dei dati e i metadati corrispondenti per i tipi di dati designati sono mantenuti','ID.AM'),('ID.AM-08','I sistemi, l\'hardware, il software, i servizi e i dati sono gestiti lungo l\'intero ciclo di vita','ID.AM'),('ID.IM-01','I miglioramenti sono identificati dalle valutazioni','ID.IM'),('ID.IM-02','I miglioramenti sono identificati da test ed esercitazioni di sicurezza, anche in coordinamento con fornitori e terze parti rilevanti','ID.IM'),('ID.IM-03','I miglioramenti sono identificati dall\'esecuzione di processi, procedure e attività operative','ID.IM'),('ID.IM-04','I piani di risposta agli incidenti e gli altri piani di cybersecurity che influenzano le operazioni sono stabiliti, comunicati, mantenuti e migliorati','ID.IM'),('ID.RA-01','Le vulnerabilità negli asset sono identificate, validate e registrate','ID.RA'),('ID.RA-02','L\'intelligence sulle minacce cyber viene ricevuta da forum e fonti di condivisione delle informazioni','ID.RA'),('ID.RA-03','Le minacce interne ed esterne all\'organizzazione sono identificate e registrate','ID.RA'),('ID.RA-04','Gli impatti potenziali e le probabilità delle minacce che sfruttano le vulnerabilità sono identificati e registrati','ID.RA'),('ID.RA-05','Minacce, vulnerabilità, probabilità e impatti sono utilizzati per comprendere il rischio intrinseco e informare la prioritizzazione delle risposte al rischio','ID.RA'),('ID.RA-06','Le risposte al rischio sono scelte, prioritizzate, pianificate, tracciate e comunicate','ID.RA'),('ID.RA-07','I cambiamenti e le eccezioni sono gestiti, valutati per l\'impatto sul rischio, registrati e tracciati','ID.RA'),('ID.RA-08','I processi per ricevere, analizzare e rispondere alle divulgazioni di vulnerabilità sono stabiliti','ID.RA'),('ID.RA-09','L\'autenticità e l\'integrità dell\'hardware e del software sono valutate prima dell\'acquisizione e dell\'utilizzo','ID.RA'),('ID.RA-10','I fornitori critici sono valutati prima dell\'acquisizione','ID.RA'),('PR.AA-01','Le identità e le credenziali per gli utenti, i servizi e l\'hardware autorizzati sono gestite dall\'organizzazione','PR.AA'),('PR.AA-02','Le identità sono verificate e legate alle credenziali in base al contesto delle interazioni','PR.AA'),('PR.AA-03','Gli utenti, i servizi e l\'hardware sono autenticati','PR.AA'),('PR.AA-04','Le asserzioni di identità sono protette, trasmesse e verificate','PR.AA'),('PR.AA-05','Le autorizzazioni, i diritti di accesso e le autorizzazioni sono definiti in una politica, gestiti, applicati e rivisti, e incorporano i principi del minimo privilegio e della separazione dei compiti','PR.AA'),('PR.AA-06','L\'accesso fisico agli asset è gestito, monitorato e applicato in modo commisurato al rischio','PR.AA'),('PR.AT-01','Il personale riceve sensibilizzazione e formazione in modo da possedere le conoscenze e le competenze per eseguire compiti generali tenendo conto dei rischi di cybersecurity','PR.AT'),('PR.AT-02','Gli individui in ruoli specializzati ricevono sensibilizzazione e formazione in modo da possedere le conoscenze e le competenze per eseguire i compiti rilevanti tenendo conto dei rischi di cybersecurity','PR.AT'),('PR.DS-01','La riservatezza, l\'integrità e la disponibilità dei dati a riposo sono protette','PR.DS'),('PR.DS-02','La riservatezza, l\'integrità e la disponibilità dei dati in transito sono protette','PR.DS'),('PR.DS-10','La riservatezza, l\'integrità e la disponibilità dei dati in uso sono protette','PR.DS'),('PR.DS-11','I backup dei dati sono creati, protetti, mantenuti e testati','PR.DS'),('PR.IR-01','Le reti e gli ambienti sono protetti da accessi e utilizzi logici non autorizzati','PR.IR'),('PR.IR-02','Gli asset tecnologici dell\'organizzazione sono protetti dalle minacce ambientali','PR.IR'),('PR.IR-03','Meccanismi sono implementati per raggiungere i requisiti di resilienza in situazioni normali e avverse','PR.IR'),('PR.IR-04','Adeguata capacità di risorse per garantire la disponibilità è mantenuta','PR.IR'),('PR.PS-01','Le pratiche di gestione della configurazione sono stabilite e applicate','PR.PS'),('PR.PS-02','Il software è mantenuto, sostituito e rimosso in modo commisurato al rischio','PR.PS'),('PR.PS-03','L\'hardware è mantenuto, sostituito e rimosso in modo commisurato al rischio','PR.PS'),('PR.PS-04','I record di log sono generati e resi disponibili per il monitoraggio continuo','PR.PS'),('PR.PS-05','L\'installazione e l\'esecuzione di software non autorizzato sono prevenute','PR.PS'),('PR.PS-06','Le pratiche di sviluppo sicuro del software sono integrate e le loro performance sono monitorate lungo il ciclo di vita dello sviluppo del software','PR.PS'),('RC.CO-03','Le attività di ripristino e i progressi nel ripristino delle capacità operative sono comunicati agli stakeholder interni ed esterni designati','RC.CO'),('RC.CO-04','Gli aggiornamenti pubblici sull\'incidente e sul ripristino sono condivisi utilizzando metodi e messaggi approvati','RC.CO'),('RC.RP-01','La parte di ripristino del piano di risposta agli incidenti è eseguita una volta avviata dal processo di risposta agli incidenti','RC.RP'),('RC.RP-02','Le azioni di ripristino sono selezionate, delimitate, prioritizzate ed eseguite','RC.RP'),('RC.RP-03','L\'integrità dei backup e degli altri asset di ripristino è verificata prima di utilizzarli per il ripristino','RC.RP'),('RC.RP-04','Le funzioni critiche della missione e la gestione del rischio di cybersecurity sono considerate per stabilire le norme operative post-incidente','RC.RP'),('RC.RP-05','L\'integrità degli asset ripristinati è verificata, i sistemi e i servizi sono ripristinati e lo stato operativo normale è confermato','RC.RP'),('RC.RP-06','La fine del ripristino dall\'incidente è dichiarata sulla base di criteri e la documentazione relativa all\'incidente è completata','RC.RP'),('RS.AN-03','Viene eseguita un\'analisi per stabilire cosa è accaduto durante un incidente e la causa principale dell\'incidente','RS.AN'),('RS.AN-06','Le azioni eseguite durante un\'indagine sono registrate e l\'integrità e la provenienza dei record sono preservate','RS.AN'),('RS.AN-07','I dati e i metadati degli incidenti sono raccolti e la loro integrità e provenienza sono preservate','RS.AN'),('RS.AN-08','La portata di un incidente è stimata e validata','RS.AN'),('RS.CO-02','Gli stakeholder interni ed esterni sono notificati degli incidenti','RS.CO'),('RS.CO-03','Le informazioni sono condivise con gli stakeholder interni ed esterni designati','RS.CO'),('RS.MA-01','Il piano di risposta agli incidenti è eseguito in coordinamento con le terze parti rilevanti una volta dichiarato un incidente','RS.MA'),('RS.MA-02','I rapporti sugli incidenti sono classificati e validati','RS.MA'),('RS.MA-03','Gli incidenti sono categorizzati e prioritizzati','RS.MA'),('RS.MA-04','Gli incidenti vengono escalati o elevati secondo necessità','RS.MA'),('RS.MA-05','I criteri per avviare il ripristino degli incidenti sono applicati','RS.MA'),('RS.MI-01','Gli incidenti sono contenuti','RS.MI'),('RS.MI-02','Gli incidenti sono eradicati','RS.MI');
/*!40000 ALTER TABLE `sottocategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoAsset`
--

DROP TABLE IF EXISTS `tipoAsset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoAsset` (
  `idTipoAsset` int NOT NULL AUTO_INCREMENT,
  `nomeTipoAsset` varchar(50) NOT NULL,
  PRIMARY KEY (`idTipoAsset`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoAsset`
--

LOCK TABLES `tipoAsset` WRITE;
/*!40000 ALTER TABLE `tipoAsset` DISABLE KEYS */;
INSERT INTO `tipoAsset` VALUES (1,'Server di Produzione'),(2,'Client/Workstation'),(3,'Sistema SCADA/PLC'),(4,'Database Critico'),(5,'Dispositivo IoT Medico'),(6,'Software Gestionale (ERP)'),(7,'Cloud Service'),(8,'Apparecchiatura di Laboratorio'),(9,'Network Switch/Firewall'),(10,'Storage Backup');
/*!40000 ALTER TABLE `tipoAsset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoFornitore`
--

DROP TABLE IF EXISTS `tipoFornitore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoFornitore` (
  `idTipoFornitore` int NOT NULL AUTO_INCREMENT,
  `nomeTipoFornitore` varchar(50) NOT NULL,
  `classeRischioPredefinita` enum('Bassa','Media','Alta','Critica') DEFAULT NULL,
  PRIMARY KEY (`idTipoFornitore`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoFornitore`
--

LOCK TABLES `tipoFornitore` WRITE;
/*!40000 ALTER TABLE `tipoFornitore` DISABLE KEYS */;
INSERT INTO `tipoFornitore` VALUES (1,'Fornitore Materie Prime (API)','Alta'),(2,'Servizi IT Cloud','Media'),(3,'Manutenzione Impianti OT','Critica'),(4,'Consulenza Regolatoria','Bassa'),(5,'Logistica a Temperatura Controllata','Alta');
/*!40000 ALTER TABLE `tipoFornitore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valutazione`
--

DROP TABLE IF EXISTS `valutazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valutazione` (
  `idValutazione` int NOT NULL,
  `dataValutazione` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `livelloMaturitaRegistrato` int NOT NULL,
  `idControllo` int NOT NULL,
  `idAsset` int DEFAULT NULL,
  PRIMARY KEY (`idValutazione`),
  KEY `fk_valutazione_livellomaturita_idx` (`livelloMaturitaRegistrato`),
  KEY `fk_valutazione_controllo_idx` (`idControllo`),
  KEY `fk_valutazione_asset_idx` (`idAsset`),
  CONSTRAINT `fk_valutazione_asset` FOREIGN KEY (`idAsset`) REFERENCES `asset` (`idAsset`),
  CONSTRAINT `fk_valutazione_controllo` FOREIGN KEY (`idControllo`) REFERENCES `controllo` (`idControllo`),
  CONSTRAINT `fk_valutazione_livellomaturita` FOREIGN KEY (`livelloMaturitaRegistrato`) REFERENCES `livelloMaturita` (`idLivelloMaturita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valutazione`
--

LOCK TABLES `valutazione` WRITE;
/*!40000 ALTER TABLE `valutazione` DISABLE KEYS */;
INSERT INTO `valutazione` VALUES (1,'2026-03-23 20:54:12',2,1,2),(2,'2026-03-23 20:54:12',4,3,NULL),(3,'2026-03-23 20:54:12',1,5,1),(4,'2026-03-23 20:54:12',5,7,3),(5,'2026-03-23 20:54:12',3,8,8),(6,'2026-03-23 20:54:12',2,9,7),(7,'2026-03-23 20:54:12',4,4,9),(8,'2026-03-23 20:54:12',2,2,6);
/*!40000 ALTER TABLE `valutazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'nis2_prod_def'
--

--
-- Dumping routines for database 'nis2_prod_def'
--

--
-- Final view structure for view `asset_history`
--

/*!50001 DROP VIEW IF EXISTS `asset_history`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `asset_history` AS select `asset_log`.`dataAssetLog` AS `DATA`,`asset`.`nomeAsset` AS `ASSET`,`asset`.`livelloCriticita` AS `CRITICITA`,(case when (`asset_log`.`versionAssetLog` <> `asset`.`versionAsset`) then concat('Aggiornamento Versione: ',`asset_log`.`versionAssetLog`,' -> ',`asset`.`versionAsset`) when (`asset_log`.`idResponsabileLog` <> `asset`.`idResponsabile`) then 'Cambio Responsabile Asset' when (`asset_log`.`livelloCriticitaLog` <> `asset`.`livelloCriticita`) then concat('Variazione Criticità: ',`asset_log`.`livelloCriticitaLog`,' -> ',`asset`.`livelloCriticita`) else 'Modifica attributi generici' end) AS `TIPO_VARIAZIONE`,(select `valutazione`.`livelloMaturitaRegistrato` from `valutazione` where (`valutazione`.`idAsset` = `asset_log`.`idAsset`) order by `valutazione`.`dataValutazione` desc limit 1) AS `ULTIMO_LIV_MATURITA_RILEVATO`,concat(`responsabile`.`cognomeResponsabile`,' ',`responsabile`.`nomeResponsabile`) AS `RESPONSABILE` from ((`asset_log` join `asset` on((`asset_log`.`idAsset` = `asset`.`idAsset`))) join `responsabile` on((`asset_log`.`idResponsabileLog` = `responsabile`.`idResponsabile`))) order by `asset_log`.`dataAssetLog` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `compliance_framework`
--

/*!50001 DROP VIEW IF EXISTS `compliance_framework`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `compliance_framework` AS select `funzione`.`nomeFunzione` AS `FUNZIONE`,`categoria`.`nomeCategoria` AS `CATEGORIA`,count(`prototipo_sottocategoria`.`codiceSottocategoria`) AS `TOT_CONTROLLI_ATTESI`,round(avg(`prototipo_sottocategoria`.`livelloMaturitaTarget`),2) AS `MEDIA_PROFILO_TARGET`,round(avg(coalesce(`valutazione`.`livelloMaturitaRegistrato`,0)),2) AS `MEDIA_PROFILO_ATTUALE`,round(avg((`prototipo_sottocategoria`.`livelloMaturitaTarget` - coalesce(`valutazione`.`livelloMaturitaRegistrato`,0))),2) AS `GAP_MEDIO` from (((((`funzione` join `categoria` on((`funzione`.`codiceFunzione` = `categoria`.`codiceFunzione`))) join `sottocategoria` on((`categoria`.`codiceCategoria` = `sottocategoria`.`codiceCategoria`))) join `prototipo_sottocategoria` on((`sottocategoria`.`codiceSottocategoria` = `prototipo_sottocategoria`.`codiceSottocategoria`))) left join `controllo` on((`prototipo_sottocategoria`.`codiceSottocategoria` = `controllo`.`codiceSottocategoria`))) left join `valutazione` on((`controllo`.`idControllo` = `valutazione`.`idControllo`))) group by `funzione`.`nomeFunzione`,`categoria`.`nomeCategoria` order by `GAP_MEDIO` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dettaglio_gap_critici`
--

/*!50001 DROP VIEW IF EXISTS `dettaglio_gap_critici`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dettaglio_gap_critici` AS select `asset`.`nomeAsset` AS `ASSET`,`asset`.`livelloCriticita` AS `CRITICITA_ASSET`,`sottocategoria`.`codiceSottocategoria` AS `ID_REQUISITO`,`sottocategoria`.`descrizioneSottocategoria` AS `DESCRIZIONE_REQUISITO`,`prototipo_sottocategoria`.`livelloMaturitaTarget` AS `TARGET_ACN`,coalesce(`valutazione`.`livelloMaturitaRegistrato`,0) AS `LIVELLO_RILEVATO`,(`prototipo_sottocategoria`.`livelloMaturitaTarget` - coalesce(`valutazione`.`livelloMaturitaRegistrato`,0)) AS `DEFICIT_MATURITA`,concat(`responsabile`.`cognomeResponsabile`,' ',`responsabile`.`nomeResponsabile`) AS `RESPONSABILE`,`responsabile`.`ruoloAziendale` AS `RUOLO_RESPONSABILE`,`responsabile`.`cellulare` AS `CELLULARE_RESPONSABILE`,`responsabile`.`email` AS `EMAIL_RESPONSABILE` from (((((`asset` join `prototipo_sottocategoria`) join `sottocategoria` on((`prototipo_sottocategoria`.`codiceSottocategoria` = `sottocategoria`.`codiceSottocategoria`))) left join `controllo` on((`sottocategoria`.`codiceSottocategoria` = `controllo`.`codiceSottocategoria`))) left join `valutazione` on(((`controllo`.`idControllo` = `valutazione`.`idControllo`) and (`valutazione`.`idAsset` = `asset`.`idAsset`)))) join `responsabile` on((`asset`.`idResponsabile` = `responsabile`.`idResponsabile`))) where ((`asset`.`livelloCriticita` in ('Alta','Critica')) and (`prototipo_sottocategoria`.`livelloMaturitaTarget` > coalesce(`valutazione`.`livelloMaturitaRegistrato`,0))) order by `asset`.`livelloCriticita` desc,(`prototipo_sottocategoria`.`livelloMaturitaTarget` - coalesce(`valutazione`.`livelloMaturitaRegistrato`,0)) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `media_sicurezza_supply_chain`
--

/*!50001 DROP VIEW IF EXISTS `media_sicurezza_supply_chain`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `media_sicurezza_supply_chain` AS select `fornitore`.`ragioneSociale` AS `FORNITORE`,`tipofornitore`.`nomeTipoFornitore` AS `TIPO`,`fornitore`.`livelloCriticita` AS `CRITICITA_FORNITORE`,`fornitore`.`luogoTrattamentoDati` AS `ZONA_DATI`,count(`asset`.`idAsset`) AS `NUMERO_ASSET_GESTITI`,round(avg(`valutazione`.`livelloMaturitaRegistrato`),1) AS `RATING_SICUREZZA_MEDIO` from (((`fornitore` join `tipofornitore` on((`fornitore`.`idTipoFornitore` = `tipofornitore`.`idTipoFornitore`))) left join `asset` on((`fornitore`.`idFornitore` = `asset`.`idFornitore`))) left join `valutazione` on((`asset`.`idAsset` = `valutazione`.`idAsset`))) group by `fornitore`.`idFornitore` order by `fornitore`.`livelloCriticita` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-30 21:52:20
