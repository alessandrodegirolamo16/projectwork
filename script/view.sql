CREATE VIEW `asset_history` AS
    SELECT 
        `asset_log`.`dataAssetLog` AS `DATA`,
        `asset`.`nomeAsset` AS `ASSET`,
        `asset`.`livelloCriticita` AS `CRITICITA`,
        (CASE
            WHEN
                (`asset_log`.`versionAssetLog` <> `asset`.`versionAsset`)
            THEN
                CONCAT('Aggiornamento Versione: ',
                        `asset_log`.`versionAssetLog`,
                        ' -> ',
                        `asset`.`versionAsset`)
            WHEN (`asset_log`.`idResponsabileLog` <> `asset`.`idResponsabile`) THEN 'Cambio Responsabile Asset'
            WHEN
                (`asset_log`.`livelloCriticitaLog` <> `asset`.`livelloCriticita`)
            THEN
                CONCAT('Variazione Criticità: ',
                        asset_log.livelloCriticitaLog,
                        ' -> ',
                        asset.livelloCriticita)
            ELSE 'Modifica attributi generici'
        END) AS TIPO_VARIAZIONE,
        (SELECT 
                valutazione.livelloMaturitaRegistrato
            FROM
                valutazione
            WHERE
                (valutazione.idAsset = asset_log.idAsset)
            ORDER BY valutazione.dataValutazione DESC
            LIMIT 1) AS ULTIMO_LIV_MATURITA_RILEVATO,
        CONCAT(responsabile.cognomeResponsabile,
                ' ',
                responsabile.nomeResponsabile) AS RESPONSABILE
    FROM
        ((asset_log
        JOIN asset ON ((asset_log.idAsset = asset.idAsset)))
        JOIN responsabile ON ((asset_log.idResponsabileLog = responsabile.idResponsabile)))
    ORDER BY asset_log.dataAssetLog DESC;

CREATE VIEW `compliance_framework` AS
    SELECT 
        `funzione`.`nomeFunzione` AS `FUNZIONE`,
        `categoria`.`nomeCategoria` AS `CATEGORIA`,
        COUNT(`prototipo_sottocategoria`.`codiceSottocategoria`) AS `TOT_CONTROLLI_ATTESI`,
        ROUND(AVG(`prototipo_sottocategoria`.`livelloMaturitaTarget`),
                2) AS `MEDIA_PROFILO_TARGET`,
        ROUND(AVG(COALESCE(`valutazione`.`livelloMaturitaRegistrato`,
                        0)),
                2) AS `MEDIA_PROFILO_ATTUALE`,
        ROUND(AVG((`prototipo_sottocategoria`.`livelloMaturitaTarget` - COALESCE(`valutazione`.`livelloMaturitaRegistrato`,
                        0))),
                2) AS `GAP_MEDIO`
    FROM
        (((((`funzione`
        JOIN `categoria` ON ((`funzione`.`codiceFunzione` = `categoria`.`codiceFunzione`)))
        JOIN `sottocategoria` ON ((`categoria`.`codiceCategoria` = `sottocategoria`.`codiceCategoria`)))
        JOIN `prototipo_sottocategoria` ON ((`sottocategoria`.`codiceSottocategoria` = `prototipo_sottocategoria`.`codiceSottocategoria`)))
        LEFT JOIN `controllo` ON ((`prototipo_sottocategoria`.`codiceSottocategoria` = `controllo`.`codiceSottocategoria`)))
        LEFT JOIN `valutazione` ON ((`controllo`.`idControllo` = `valutazione`.`idControllo`)))
    GROUP BY `funzione`.`nomeFunzione` , `categoria`.`nomeCategoria`
    ORDER BY `GAP_MEDIO` DESC;

CREATE VIEW `dettaglio_gap_critici` AS
    SELECT 
        `asset`.`nomeAsset` AS `ASSET`,
        `asset`.`livelloCriticita` AS `CRITICITA_ASSET`,
        `sottocategoria`.`codiceSottocategoria` AS `ID_REQUISITO`,
        `sottocategoria`.`descrizioneSottocategoria` AS `DESCRIZIONE_REQUISITO`,
        `prototipo_sottocategoria`.`livelloMaturitaTarget` AS `TARGET_ACN`,
        COALESCE(`valutazione`.`livelloMaturitaRegistrato`,
                0) AS `LIVELLO_RILEVATO`,
        (`prototipo_sottocategoria`.`livelloMaturitaTarget` - COALESCE(`valutazione`.`livelloMaturitaRegistrato`,
                0)) AS `DEFICIT_MATURITA`,
        CONCAT(`responsabile`.`cognomeResponsabile`,
                ' ',
                `responsabile`.`nomeResponsabile`) AS `RESPONSABILE`,
        `responsabile`.`ruoloAziendale` AS `RUOLO_RESPONSABILE`,
        `responsabile`.`cellulare` AS `CELLULARE_RESPONSABILE`,
        `responsabile`.`email` AS `EMAIL_RESPONSABILE`
    FROM
        (((((`asset`
        JOIN `prototipo_sottocategoria`)
        JOIN `sottocategoria` ON ((`prototipo_sottocategoria`.`codiceSottocategoria` = `sottocategoria`.`codiceSottocategoria`)))
        LEFT JOIN `controllo` ON ((`sottocategoria`.`codiceSottocategoria` = `controllo`.`codiceSottocategoria`)))
        LEFT JOIN `valutazione` ON (((`controllo`.`idControllo` = `valutazione`.`idControllo`)
            AND (`valutazione`.`idAsset` = `asset`.`idAsset`))))
        JOIN `responsabile` ON ((`asset`.`idResponsabile` = `responsabile`.`idResponsabile`)))
    WHERE
        ((`asset`.`livelloCriticita` IN ('Alta' , 'Critica'))
            AND (`prototipo_sottocategoria`.`livelloMaturitaTarget` > COALESCE(`valutazione`.`livelloMaturitaRegistrato`,
                0)))
    ORDER BY `asset`.`livelloCriticita` DESC , (`prototipo_sottocategoria`.`livelloMaturitaTarget` - COALESCE(`valutazione`.`livelloMaturitaRegistrato`,
            0)) DESC;

CREATE VIEW `media_sicurezza_supply_chain` AS
    SELECT 
        `fornitore`.`ragioneSociale` AS `FORNITORE`,
        `tipofornitore`.`nomeTipoFornitore` AS `TIPO`,
        `fornitore`.`livelloCriticita` AS `CRITICITA_FORNITORE`,
        `fornitore`.`luogoTrattamentoDati` AS `ZONA_DATI`,
        COUNT(`asset`.`idAsset`) AS `NUMERO_ASSET_GESTITI`,
        ROUND(AVG(`valutazione`.`livelloMaturitaRegistrato`),
                1) AS `RATING_SICUREZZA_MEDIO`
    FROM
        (((`fornitore`
        JOIN `tipofornitore` ON ((`fornitore`.`idTipoFornitore` = `tipofornitore`.`idTipoFornitore`)))
        LEFT JOIN `asset` ON ((`fornitore`.`idFornitore` = `asset`.`idFornitore`)))
        LEFT JOIN `valutazione` ON ((`asset`.`idAsset` = `valutazione`.`idAsset`)))
    GROUP BY `fornitore`.`idFornitore`
    ORDER BY `fornitore`.`livelloCriticita` DESC;