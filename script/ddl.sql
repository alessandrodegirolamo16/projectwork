CREATE DATABASE  IF NOT EXISTS `nis2_prod`;
USE `nis2_prod`;
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
)

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
)

CREATE TABLE `asset_servizio` (
  `idAsset` int NOT NULL,
  `idServizio` int NOT NULL,
  PRIMARY KEY (`idAsset`,`idServizio`),
  KEY `fk_assetservizio_servizio_idx` (`idServizio`),
  CONSTRAINT `fk_assetservizio_asset` FOREIGN KEY (`idAsset`) REFERENCES `asset` (`idAsset`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_assetservizio_servizio` FOREIGN KEY (`idServizio`) REFERENCES `servizio` (`idServizio`) ON DELETE RESTRICT ON UPDATE CASCADE
)

CREATE TABLE `categoria` (
  `codiceCategoria` varchar(10) NOT NULL,
  `nomeCategoria` varchar(100) NOT NULL,
  `descrizioneCategoria` varchar(255) DEFAULT NULL,
  `codiceFunzione` varchar(10) NOT NULL,
  PRIMARY KEY (`codiceCategoria`),
  KEY `fk_categoria_funzione_idx` (`codiceCategoria`),
  KEY `fk_categoria_funzione_idx1` (`codiceFunzione`),
  CONSTRAINT `fk_categoria_funzione` FOREIGN KEY (`codiceFunzione`) REFERENCES `funzione` (`codiceFunzione`)
)

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
)

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
) 

CREATE TABLE `funzione` (
  `codiceFunzione` varchar(10) NOT NULL,
  `nomeFunzione` varchar(10) NOT NULL,
  `descrizioneFunzione` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codiceFunzione`)
)

CREATE TABLE `livelloMaturita` (
  `idLivelloMaturita` int NOT NULL,
  `nomeLivello` varchar(30) NOT NULL,
  `descrizioneLivello` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idLivelloMaturita`)
)

CREATE TABLE `prototipo` (
  `idPrototipo` int NOT NULL AUTO_INCREMENT,
  `nomePrototipo` varchar(50) NOT NULL,
  PRIMARY KEY (`idPrototipo`),
  UNIQUE KEY `nomePrototipo_UNIQUE` (`nomePrototipo`)
)

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
)

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
)

CREATE TABLE `servizio` (
  `idServizio` int NOT NULL AUTO_INCREMENT,
  `nomeServizio` varchar(50) NOT NULL,
  `descrizioneServizio` varchar(255) DEFAULT NULL,
  `livelloCriticita` enum('Bassa','Media','Alta','Critica') NOT NULL,
  `RTO` int NOT NULL,
  PRIMARY KEY (`idServizio`)
)

CREATE TABLE `sottocategoria` (
  `codiceSottocategoria` varchar(10) NOT NULL,
  `descrizioneSottocategoria` varchar(255) DEFAULT NULL,
  `codiceCategoria` varchar(10) NOT NULL,
  PRIMARY KEY (`codiceSottocategoria`),
  KEY `fk_subcategory_category_idx` (`codiceCategoria`),
  CONSTRAINT `fk_sottocategoria_categoria` FOREIGN KEY (`codiceCategoria`) REFERENCES `categoria` (`codiceCategoria`)
) 

CREATE TABLE `tipoAsset` (
  `idTipoAsset` int NOT NULL AUTO_INCREMENT,
  `nomeTipoAsset` varchar(50) NOT NULL,
  PRIMARY KEY (`idTipoAsset`)
) 

CREATE TABLE `tipoFornitore` (
  `idTipoFornitore` int NOT NULL AUTO_INCREMENT,
  `nomeTipoFornitore` varchar(50) NOT NULL,
  `classeRischioPredefinita` enum('Bassa','Media','Alta','Critica') DEFAULT NULL,
  PRIMARY KEY (`idTipoFornitore`)
)

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
)