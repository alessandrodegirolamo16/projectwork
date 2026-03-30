CREATE TRIGGER `trigger_assetlog` AFTER UPDATE ON `asset` FOR EACH ROW BEGIN
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
END