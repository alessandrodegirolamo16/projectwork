INSERT INTO
    `asset`
VALUES (
        1,
        'ERP SAP S/4HANA',
        6,
        'Core business management',
        'Critica',
        '2023.3',
        0,
        2,
        3
    ),
    (
        2,
        'PLC Linea Confezionamento 01',
        3,
        'Controllo automazione linea 1',
        'Alta',
        'v4.5.1',
        0,
        4,
        4
    ),
    (
        3,
        'Database Formule Segrete',
        4,
        'DB SQL con brevetti e ricette',
        'Critica',
        '1.1',
        0,
        NULL,
        1
    ),
    (
        4,
        'Server Historian Produzione',
        1,
        'Archivio dati telemetria farmaci',
        'Media',
        'v3.1',
        0,
        4,
        2
    ),
    (
        5,
        'Workstation Controllo Qualità',
        2,
        'PC analisi spettrografica',
        'Media',
        'Win10_P',
        0,
        NULL,
        4
    ),
    (
        6,
        'Frigorifero IoT Smart-Cold',
        5,
        'Monitoraggio temperatura vaccini',
        'Alta',
        'firm_2.1',
        0,
        1,
        4
    ),
    (
        7,
        'Firewall Perimetrale HQ',
        9,
        'Protezione rete aziendale',
        'Critica',
        'OS_7.4',
        0,
        2,
        1
    ),
    (
        8,
        'NAS Backup Offline',
        10,
        'Backup immutabile dei dati',
        'Critica',
        'v6.3',
        0,
        NULL,
        3
    ),
    (
        9,
        'Sensore Pressione Reattore A',
        5,
        'Monitoraggio critico chimico',
        'Alta',
        '1.2.0',
        0,
        4,
        2
    ),
    (
        10,
        'Laptop Direzione Generale',
        2,
        'Dispositivo CEO',
        'Media',
        'v2.3',
        0,
        NULL,
        1
    );
INSERT INTO
    `asset_log`
VALUES (
        5,
        'Database Formule Segrete',
        4,
        'DB SQL con brevetti e ricette',
        'Critica',
        '1.0',
        NULL,
        1,
        '2026-03-26 21:29:40',
        3
    ),
    (
        6,
        'PLC Linea Confezionamento 01',
        3,
        'Controllo automazione linea 1',
        'Alta',
        'v4.5',
        4,
        2,
        '2026-03-26 21:29:40',
        2
    ),
    (
        7,
        'ERP SAP S/4HANA',
        6,
        'Core business management',
        'Critica',
        '2023.2',
        2,
        3,
        '2026-03-26 21:29:40',
        1
    ),
    (
        8,
        'PLC Linea Confezionamento 01',
        3,
        'Controllo automazione linea 1',
        'Alta',
        'v4.5.1',
        4,
        2,
        '2026-03-27 22:21:05',
        2
    );
INSERT INTO
    `asset_servizio`
VALUES (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (9, 1),
    (1, 2),
    (7, 2),
    (8, 2),
    (10, 2),
    (3, 3),
    (6, 3),
    (7, 3),
    (8, 3),
    (3, 4),
    (5, 4),
    (7, 4),
    (10, 4),
    (1, 5),
    (7, 5);

INSERT INTO
    `categoria`
VALUES (
        'DE.AE',
        'Adverse Event Analysis',
        'Anomalie, indicatori di compromissione e altri eventi potenzialmente avversi sono analizzati per caratterizzare gli eventi e rilevare incidenti di cybersecurity',
        'DE'
    ),
    (
        'DE.CM',
        'Continuous Monitoring',
        'Gli asset sono monitorati per trovare anomalie, indicatori di compromissione e altri eventi potenzialmente avversi',
        'DE'
    ),
    (
        'GV.OC',
        'Organizational Context',
        'Le circostanze — missione, aspettative degli stakeholder, dipendenze e requisiti legali, normativi e contrattuali — che circondano le decisioni di gestione del rischio di cybersecurity dell\'organizzazione sono comprese',
        'GV'
    ),
    (
        'GV.OV',
        'Oversight',
        'I risultati delle attività di gestione del rischio di cybersecurity a livello organizzativo e le performance vengono utilizzati per informare, migliorare e adeguare la strategia di gestione del rischio',
        'GV'
    ),
    (
        'GV.PO',
        'Policy',
        'La politica di cybersecurity organizzativa è stabilita, comunicata e applicata',
        'GV'
    ),
    (
        'GV.RM',
        'Risk Management Strategy',
        'Le priorità, i vincoli, le dichiarazioni di tolleranza e appetito al rischio e le assunzioni dell\'organizzazione sono stabilite, comunicate e utilizzate per supportare le decisioni operative sul rischio',
        'GV'
    ),
    (
        'GV.RR',
        'Roles, Responsibilities, and Authorities',
        'I ruoli, le responsabilità e le autorità di cybersecurity per favorire la responsabilità, la valutazione delle performance e il miglioramento continuo sono stabiliti e comunicati',
        'GV'
    ),
    (
        'GV.SC',
        'Cybersecurity Supply Chain Risk Management',
        'I processi di gestione del rischio cyber nella supply chain sono identificati, stabiliti, gestiti, monitorati e migliorati dagli stakeholder organizzativi',
        'GV'
    ),
    (
        'ID.AM',
        'Asset Management',
        'Gli asset che consentono all\'organizzazione di raggiungere gli scopi aziendali sono identificati e gestiti in modo coerente con la loro importanza relativa agli obiettivi organizzativi e alla strategia di rischio',
        'ID'
    ),
    (
        'ID.IM',
        'Improvement',
        'I miglioramenti ai processi, alle procedure e alle attività di gestione del rischio di cybersecurity organizzativo sono identificati in tutte le Funzioni CSF',
        'ID'
    ),
    (
        'ID.RA',
        'Risk Assessment',
        'Il rischio di cybersecurity per l\'organizzazione, gli asset e gli individui è compreso dall\'organizzazione',
        'ID'
    ),
    (
        'PR.AA',
        'Identity Management, Authentication, and Access Control',
        'L\'accesso agli asset fisici e logici è limitato agli utenti, ai servizi e all\'hardware autorizzati e gestito in modo commisurato al rischio valutato di accesso non autorizzato',
        'PR'
    ),
    (
        'PR.AT',
        'Awareness and Training',
        'Il personale dell\'organizzazione riceve formazione e sensibilizzazione sulla cybersecurity in modo da poter eseguire i propri compiti correlati alla cybersecurity',
        'PR'
    ),
    (
        'PR.DS',
        'Data Security',
        'I dati sono gestiti in modo coerente con la strategia di rischio dell\'organizzazione per proteggere la riservatezza, l\'integrità e la disponibilità delle informazioni',
        'PR'
    ),
    (
        'PR.IR',
        'Technology Infrastructure Resilience',
        'Le architetture di sicurezza sono gestite con la strategia di rischio dell\'organizzazione per proteggere la riservatezza, l\'integrità e la disponibilità degli asset e la resilienza organizzativa',
        'PR'
    ),
    (
        'PR.PS',
        'Platform Security',
        'L\'hardware, il software e i servizi delle piattaforme fisiche e virtuali sono gestiti in modo coerente con la strategia di rischio dell\'organizzazione',
        'PR'
    ),
    (
        'RC.CO',
        'Incident Recovery Communication',
        'Le attività di ripristino sono coordinate con le parti interne ed esterne',
        'RC'
    ),
    (
        'RC.RP',
        'Incident Recovery Plan Execution',
        'Le attività di ripristino sono eseguite per garantire la disponibilità operativa dei sistemi e dei servizi interessati da incidenti di cybersecurity',
        'RC'
    ),
    (
        'RS.AN',
        'Incident Analysis',
        'Vengono condotte indagini per garantire una risposta efficace e supportare le attività forensi e di ripristino',
        'RS'
    ),
    (
        'RS.CO',
        'Incident Response Reporting and Communication',
        'Le attività di risposta sono coordinate con gli stakeholder interni ed esterni come richiesto da leggi, regolamenti o politiche',
        'RS'
    ),
    (
        'RS.MA',
        'Incident Management',
        'Le risposte agli incidenti di cybersecurity rilevati sono gestite',
        'RS'
    ),
    (
        'RS.MI',
        'Incident Mitigation',
        'Vengono eseguite attività per prevenire l\'espansione di un evento e mitigarne gli effetti',
        'RS'
    );

INSERT INTO
    `controllo`
VALUES (
        1,
        'Censimento automatico di tutti i PLC e sensori di linea tramite scansione passiva',
        1,
        'ID.AM-01'
    ),
    (
        2,
        'Inventario centralizzato di tutte le licenze software dei sistemi di laboratorio',
        1,
        'ID.AM-02'
    ),
    (
        3,
        'Procedura formale per la ricezione e gestione di bug report su software medicali',
        1,
        'ID.RA-08'
    ),
    (
        4,
        'Analisi dei rischi per ogni nuovo macchinario di produzione prima dell\'acquisto',
        1,
        'ID.RA-05'
    ),
    (
        5,
        'Implementazione MFA per l\'accesso remoto ai sistemi ERP e SCADA',
        1,
        'PR.AA-01'
    ),
    (
        6,
        'Revisione semestrale dei privilegi di accesso alle cartelle delle ricette farmaceutiche',
        1,
        'PR.AA-03'
    ),
    (
        7,
        'Cifratura dei dati dei pazienti nei database dei test clinici (AES-256)',
        1,
        'PR.DS-01'
    ),
    (
        8,
        'Test di ripristino mensile dei backup dei dati di produzione',
        1,
        'PR.DS-11'
    ),
    (
        9,
        'Log management centralizzato per rilevare accessi anomali fuori orario lavorativo',
        1,
        'DE.CM-01'
    ),
    (
        10,
        'Monitoraggio real-time dell\'integrità del firmware dei dispositivi IoT',
        1,
        'DE.CM-09'
    );

INSERT INTO
    `fornitore`
VALUES (
        1,
        'PharmaLogistics SpA',
        'B4233521',
        'Alta',
        '+34 629032980',
        'UE',
        '2026-03-23',
        6,
        5
    ),
    (
        2,
        'GlobalCloud Services',
        'GB133554676',
        'Media',
        '+44 07665492099',
        'Extra UE',
        '2026-01-15',
        12,
        2
    ),
    (
        3,
        'BioTech API Solutions',
        'IT8293930153',
        'Critica',
        '+39 0284993008',
        'UE',
        '2026-02-22',
        4,
        1
    ),
    (
        4,
        'Industrial Controls Sec',
        'LT291821029',
        'Critica',
        '+370 65492200',
        'UE',
        '2025-11-20',
        2,
        3
    ),
    (
        5,
        'Compliance Experts',
        'PT414345676',
        'Bassa',
        '+351 214313452',
        'UE',
        '2025-12-13',
        48,
        4
    );

INSERT INTO
    `funzione`
VALUES (
        'DE',
        'Detect',
        'Le attività per identificare tempestivamente un evento di cybersecurity.'
    ),
    (
        'GV',
        'Govern',
        'L’orientamento strategico e la governance della cybersecurity.'
    ),
    (
        'ID',
        'Identify',
        'La comprensione del rischio per gestire le risorse e i processi.'
    ),
    (
        'PR',
        'Protect',
        'Le misure di salvaguardia per limitare o contenere l’impatto di un evento.'
    ),
    (
        'RC',
        'Recover',
        'Le attività per ripristinare i servizi compromessi da un incidente.'
    ),
    (
        'RS',
        'Respond',
        'Le azioni intraprese in risposta a un incidente rilevato.'
    );

INSERT INTO
    `livelloMaturita`
VALUES (
        1,
        'INIZIALE',
        'I processi sono ad hoc, reattivi e imprevedibili. Il successo dipende dagli sforzi individuali.'
    ),
    (
        2,
        'GESTITO',
        'I progetti sono pianificati, performati, misurati e controllati a livello di singolo progetto.'
    ),
    (
        3,
        'DEFINITO',
        'I processi sono standardizzati a livello organizzativo, proattivi e documentati.'
    ),
    (
        4,
        'GESTITO QUANTITATIVAMENTE',
        'L\'organizzazione è guidata dai dati, con processi misurati e controllati statisticamente.'
    ),
    (
        5,
        'Ottimizzato',
        'Focus sul miglioramento continuo, con processi stabili, flessibili e orientati all\'innovazione.'
    );

INSERT INTO `prototipo` VALUES (1, 'Soggetto Importante');

INSERT INTO
    `prototipo_sottocategoria`
VALUES (1, 'DE.CM-01', 'Alta', 4),
    (1, 'DE.CM-09', 'Alta', 4),
    (1, 'GV.OC-04', 'Alta', 4),
    (1, 'GV.PO-01', 'Alta', 4),
    (1, 'GV.RM-03', 'Media', 3),
    (1, 'GV.RR-02', 'Alta', 4),
    (1, 'GV.SC-01', 'Alta', 5),
    (1, 'ID.AM-01', 'Alta', 4),
    (1, 'ID.AM-02', 'Alta', 4),
    (1, 'ID.IM-04', 'Alta', 5),
    (1, 'ID.RA-05', 'Alta', 4),
    (1, 'ID.RA-08', 'Media', 3),
    (1, 'PR.AA-01', 'Alta', 4),
    (1, 'PR.AA-03', 'Alta', 4),
    (1, 'PR.AT-01', 'Media', 3),
    (1, 'PR.DS-01', 'Alta', 5),
    (1, 'PR.DS-11', 'Alta', 5),
    (1, 'PR.IR-01', 'Alta', 4),
    (1, 'PR.PS-02', 'Media', 3),
    (1, 'RC.RP-01', 'Alta', 5),
    (1, 'RS.CO-02', 'Media', 3),
    (1, 'RS.MA-01', 'Alta', 4);

INSERT INTO
    `responsabile`
VALUES (
        1,
        'Marco',
        'Rossi',
        'RSSMRC78B18C594L',
        'CISO',
        '3331234567',
        'mariorossi@gmail.com',
        '2025-11-10'
    ),
    (
        2,
        'Elena',
        'Bianchi',
        'BNCLNE86D49F839K',
        'Responsabile Produzione OT',
        '3337654321',
        'elenabianchi@gmail.com',
        '2026-01-15'
    ),
    (
        3,
        'Luca',
        'Verdi',
        'VRDLCU81D25F694D',
        'IT Manager',
        '3339876543',
        'lucaverdi@gmail.com',
        '2025-12-20'
    ),
    (
        4,
        'Sara',
        'Neri',
        'NRESRA93F69I807D',
        'Quality Assurance Manager',
        '3341122334',
        'saraneri@gmail.com',
        '2026-02-01'
    ),
    (
        5,
        'Giulia',
        'Galli',
        'GLLGLI88G45I323Z',
        'DPO',
        '3355566778',
        'giuliagalli@gmail.com',
        '2025-10-15'
    );

INSERT INTO
    `servizio`
VALUES (
        1,
        'Produzione Farmaci salvavita',
        'Linea attiva 24/7 per medicinali essenziali',
        'Critica',
        4
    ),
    (
        2,
        'Gestione Ordini e Fatturazione',
        'Processo di vendita e distribuzione',
        'Alta',
        24
    ),
    (
        3,
        'Conservazione Catena del Freddo',
        'Mantenimento temperatura stock magazzino',
        'Critica',
        2
    ),
    (
        4,
        'Ricerca e Sviluppo',
        'Laboratori di analisi nuovi principi attivi',
        'Media',
        48
    ),
    (
        5,
        'Sito Web Istituzionale',
        'Presenza online e portale trasparenza',
        'Bassa',
        72
    );

INSERT INTO
    `sottocategoria`
VALUES (
        'DE.AE-02',
        'Gli eventi potenzialmente avversi sono analizzati per comprendere meglio le attività associate',
        'DE.AE'
    ),
    (
        'DE.AE-03',
        'Le informazioni sono correlate da più fonti',
        'DE.AE'
    ),
    (
        'DE.AE-04',
        'L\'impatto e la portata stimati degli eventi avversi sono compresi',
        'DE.AE'
    ),
    (
        'DE.AE-06',
        'Le informazioni sugli eventi avversi sono fornite al personale e agli strumenti autorizzati',
        'DE.AE'
    ),
    (
        'DE.AE-07',
        'L\'intelligence sulle minacce cyber e altre informazioni contestuali sono integrate nell\'analisi',
        'DE.AE'
    ),
    (
        'DE.AE-08',
        'Gli incidenti sono dichiarati quando gli eventi avversi soddisfano i criteri di incidente definiti',
        'DE.AE'
    ),
    (
        'DE.CM-01',
        'Le reti e i servizi di rete sono monitorati per trovare eventi potenzialmente avversi',
        'DE.CM'
    ),
    (
        'DE.CM-02',
        'L\'ambiente fisico è monitorato per trovare eventi potenzialmente avversi',
        'DE.CM'
    ),
    (
        'DE.CM-03',
        'Le attività del personale e l\'utilizzo della tecnologia sono monitorati per trovare eventi potenzialmente avversi',
        'DE.CM'
    ),
    (
        'DE.CM-06',
        'Le attività e i servizi dei fornitori di servizi esterni sono monitorati per trovare eventi potenzialmente avversi',
        'DE.CM'
    ),
    (
        'DE.CM-09',
        'L\'hardware e il software di elaborazione, gli ambienti di runtime e i loro dati sono monitorati per trovare eventi potenzialmente avversi',
        'DE.CM'
    ),
    (
        'GV.OC-01',
        'La missione organizzativa è compresa e informa la gestione del rischio di cybersecurity',
        'GV.OC'
    ),
    (
        'GV.OC-02',
        'Gli stakeholder interni ed esterni sono compresi e le loro esigenze e aspettative riguardo alla gestione del rischio di cybersecurity sono comprese e considerate',
        'GV.OC'
    ),
    (
        'GV.OC-03',
        'I requisiti legali, normativi e contrattuali riguardanti la cybersecurity — inclusi gli obblighi di privacy e libertà civili — sono compresi e gestiti',
        'GV.OC'
    ),
    (
        'GV.OC-04',
        'Gli obiettivi critici, le capacità e i servizi da cui gli stakeholder esterni dipendono o che si aspettano dall\'organizzazione sono compresi e comunicati',
        'GV.OC'
    ),
    (
        'GV.OC-05',
        'I risultati, le capacità e i servizi da cui dipende l\'organizzazione sono compresi e comunicati',
        'GV.OC'
    ),
    (
        'GV.OV-01',
        'I risultati della strategia di gestione del rischio di cybersecurity sono rivisti per informare e adeguare la strategia e la direzione',
        'GV.OV'
    ),
    (
        'GV.OV-02',
        'La strategia di gestione del rischio di cybersecurity è rivista e adeguata per garantire la copertura dei requisiti e dei rischi organizzativi',
        'GV.OV'
    ),
    (
        'GV.OV-03',
        'Le performance della gestione del rischio di cybersecurity organizzativa sono valutate e riviste per gli adeguamenti necessari',
        'GV.OV'
    ),
    (
        'GV.PO-01',
        'La politica per la gestione dei rischi di cybersecurity è stabilita sulla base del contesto organizzativo, della strategia di cybersecurity e delle priorità ed è comunicata e applicata',
        'GV.PO'
    ),
    (
        'GV.PO-02',
        'La politica per la gestione dei rischi di cybersecurity è rivista, aggiornata, comunicata e applicata per riflettere cambiamenti nei requisiti, nelle minacce, nella tecnologia e nella missione organizzativa',
        'GV.PO'
    ),
    (
        'GV.RM-01',
        'Gli obiettivi di gestione del rischio sono stabiliti e concordati dagli stakeholder organizzativi',
        'GV.RM'
    ),
    (
        'GV.RM-02',
        'Le dichiarazioni di appetito al rischio e tolleranza al rischio sono stabilite, comunicate e mantenute',
        'GV.RM'
    ),
    (
        'GV.RM-03',
        'Le attività e i risultati della gestione del rischio di cybersecurity sono inclusi nei processi di gestione del rischio aziendale (ERM)',
        'GV.RM'
    ),
    (
        'GV.RM-04',
        'La direzione strategica che descrive le appropriate opzioni di risposta al rischio è stabilita e comunicata',
        'GV.RM'
    ),
    (
        'GV.RM-05',
        'Le linee di comunicazione nell\'organizzazione sono stabilite per i rischi di cybersecurity, inclusi i rischi da fornitori e altre terze parti',
        'GV.RM'
    ),
    (
        'GV.RM-06',
        'Un metodo standardizzato per calcolare, documentare, categorizzare e prioritizzare i rischi di cybersecurity è stabilito e comunicato',
        'GV.RM'
    ),
    (
        'GV.RM-07',
        'Le opportunità strategiche (rischi positivi) sono caratterizzate e incluse nelle discussioni organizzative sul rischio di cybersecurity',
        'GV.RM'
    ),
    (
        'GV.RR-01',
        'La leadership organizzativa è responsabile e accountable per il rischio di cybersecurity e promuove una cultura risk-aware, etica e in continuo miglioramento',
        'GV.RR'
    ),
    (
        'GV.RR-02',
        'I ruoli, le responsabilità e le autorità legate alla gestione del rischio di cybersecurity sono stabiliti, comunicati, compresi e applicati',
        'GV.RR'
    ),
    (
        'GV.RR-03',
        'Risorse adeguate sono allocate in modo commisurato alla strategia di rischio di cybersecurity, ai ruoli, alle responsabilità e alle politiche',
        'GV.RR'
    ),
    (
        'GV.RR-04',
        'La cybersecurity è inclusa nelle pratiche delle risorse umane',
        'GV.RR'
    ),
    (
        'GV.SC-01',
        'Un programma di gestione del rischio cyber nella supply chain, con strategia, obiettivi, politiche e processi, è stabilito e concordato dagli stakeholder organizzativi',
        'GV.SC'
    ),
    (
        'GV.SC-02',
        'I ruoli e le responsabilità di cybersecurity per fornitori, clienti e partner sono stabiliti, comunicati e coordinati internamente ed esternamente',
        'GV.SC'
    ),
    (
        'GV.SC-03',
        'La gestione del rischio cyber nella supply chain è integrata nei processi di cybersecurity, gestione del rischio aziendale, valutazione del rischio e miglioramento',
        'GV.SC'
    ),
    (
        'GV.SC-04',
        'I fornitori sono noti e prioritizzati in base alla criticità',
        'GV.SC'
    ),
    (
        'GV.SC-05',
        'I requisiti per affrontare i rischi di cybersecurity nella supply chain sono stabiliti, prioritizzati e integrati nei contratti e in altri tipi di accordi con fornitori e altre terze parti rilevanti',
        'GV.SC'
    ),
    (
        'GV.SC-06',
        'La pianificazione e la due diligence vengono eseguite per ridurre i rischi prima di entrare in relazioni formali con fornitori o altre terze parti',
        'GV.SC'
    ),
    (
        'GV.SC-07',
        'I rischi posti da un fornitore, dai suoi prodotti e servizi e da altre terze parti sono compresi, registrati, prioritizzati, valutati, affrontati e monitorati nel corso della relazione',
        'GV.SC'
    ),
    (
        'GV.SC-08',
        'I fornitori rilevanti e altre terze parti sono inclusi nelle attività di pianificazione, risposta e ripristino degli incidenti',
        'GV.SC'
    ),
    (
        'GV.SC-09',
        'Le pratiche di sicurezza della supply chain sono integrate nei programmi di cybersecurity e gestione del rischio aziendale e le loro performance sono monitorate lungo il ciclo di vita del prodotto tecnologico e del servizio',
        'GV.SC'
    ),
    (
        'GV.SC-10',
        'I piani di gestione del rischio cyber nella supply chain includono disposizioni per le attività che si verificano dopo la conclusione di un accordo di partnership o di servizio',
        'GV.SC'
    ),
    (
        'ID.AM-01',
        'Gli inventari dell\'hardware gestito dall\'organizzazione sono mantenuti',
        'ID.AM'
    ),
    (
        'ID.AM-02',
        'Gli inventari del software, dei servizi e dei sistemi gestiti dall\'organizzazione sono mantenuti',
        'ID.AM'
    ),
    (
        'ID.AM-03',
        'Le rappresentazioni dell\'architettura di rete autorizzata dell\'organizzazione e dei flussi di dati di rete interni ed esterni sono mantenute',
        'ID.AM'
    ),
    (
        'ID.AM-04',
        'Gli inventari dei servizi forniti dai fornitori sono mantenuti',
        'ID.AM'
    ),
    (
        'ID.AM-05',
        'Gli asset sono prioritizzati in base alla classificazione, alla criticità, alle risorse e all\'impatto sulla missione',
        'ID.AM'
    ),
    (
        'ID.AM-07',
        'Gli inventari dei dati e i metadati corrispondenti per i tipi di dati designati sono mantenuti',
        'ID.AM'
    ),
    (
        'ID.AM-08',
        'I sistemi, l\'hardware, il software, i servizi e i dati sono gestiti lungo l\'intero ciclo di vita',
        'ID.AM'
    ),
    (
        'ID.IM-01',
        'I miglioramenti sono identificati dalle valutazioni',
        'ID.IM'
    ),
    (
        'ID.IM-02',
        'I miglioramenti sono identificati da test ed esercitazioni di sicurezza, anche in coordinamento con fornitori e terze parti rilevanti',
        'ID.IM'
    ),
    (
        'ID.IM-03',
        'I miglioramenti sono identificati dall\'esecuzione di processi, procedure e attività operative',
        'ID.IM'
    ),
    (
        'ID.IM-04',
        'I piani di risposta agli incidenti e gli altri piani di cybersecurity che influenzano le operazioni sono stabiliti, comunicati, mantenuti e migliorati',
        'ID.IM'
    ),
    (
        'ID.RA-01',
        'Le vulnerabilità negli asset sono identificate, validate e registrate',
        'ID.RA'
    ),
    (
        'ID.RA-02',
        'L\'intelligence sulle minacce cyber viene ricevuta da forum e fonti di condivisione delle informazioni',
        'ID.RA'
    ),
    (
        'ID.RA-03',
        'Le minacce interne ed esterne all\'organizzazione sono identificate e registrate',
        'ID.RA'
    ),
    (
        'ID.RA-04',
        'Gli impatti potenziali e le probabilità delle minacce che sfruttano le vulnerabilità sono identificati e registrati',
        'ID.RA'
    ),
    (
        'ID.RA-05',
        'Minacce, vulnerabilità, probabilità e impatti sono utilizzati per comprendere il rischio intrinseco e informare la prioritizzazione delle risposte al rischio',
        'ID.RA'
    ),
    (
        'ID.RA-06',
        'Le risposte al rischio sono scelte, prioritizzate, pianificate, tracciate e comunicate',
        'ID.RA'
    ),
    (
        'ID.RA-07',
        'I cambiamenti e le eccezioni sono gestiti, valutati per l\'impatto sul rischio, registrati e tracciati',
        'ID.RA'
    ),
    (
        'ID.RA-08',
        'I processi per ricevere, analizzare e rispondere alle divulgazioni di vulnerabilità sono stabiliti',
        'ID.RA'
    ),
    (
        'ID.RA-09',
        'L\'autenticità e l\'integrità dell\'hardware e del software sono valutate prima dell\'acquisizione e dell\'utilizzo',
        'ID.RA'
    ),
    (
        'ID.RA-10',
        'I fornitori critici sono valutati prima dell\'acquisizione',
        'ID.RA'
    ),
    (
        'PR.AA-01',
        'Le identità e le credenziali per gli utenti, i servizi e l\'hardware autorizzati sono gestite dall\'organizzazione',
        'PR.AA'
    ),
    (
        'PR.AA-02',
        'Le identità sono verificate e legate alle credenziali in base al contesto delle interazioni',
        'PR.AA'
    ),
    (
        'PR.AA-03',
        'Gli utenti, i servizi e l\'hardware sono autenticati',
        'PR.AA'
    ),
    (
        'PR.AA-04',
        'Le asserzioni di identità sono protette, trasmesse e verificate',
        'PR.AA'
    ),
    (
        'PR.AA-05',
        'Le autorizzazioni, i diritti di accesso e le autorizzazioni sono definiti in una politica, gestiti, applicati e rivisti, e incorporano i principi del minimo privilegio e della separazione dei compiti',
        'PR.AA'
    ),
    (
        'PR.AA-06',
        'L\'accesso fisico agli asset è gestito, monitorato e applicato in modo commisurato al rischio',
        'PR.AA'
    ),
    (
        'PR.AT-01',
        'Il personale riceve sensibilizzazione e formazione in modo da possedere le conoscenze e le competenze per eseguire compiti generali tenendo conto dei rischi di cybersecurity',
        'PR.AT'
    ),
    (
        'PR.AT-02',
        'Gli individui in ruoli specializzati ricevono sensibilizzazione e formazione in modo da possedere le conoscenze e le competenze per eseguire i compiti rilevanti tenendo conto dei rischi di cybersecurity',
        'PR.AT'
    ),
    (
        'PR.DS-01',
        'La riservatezza, l\'integrità e la disponibilità dei dati a riposo sono protette',
        'PR.DS'
    ),
    (
        'PR.DS-02',
        'La riservatezza, l\'integrità e la disponibilità dei dati in transito sono protette',
        'PR.DS'
    ),
    (
        'PR.DS-10',
        'La riservatezza, l\'integrità e la disponibilità dei dati in uso sono protette',
        'PR.DS'
    ),
    (
        'PR.DS-11',
        'I backup dei dati sono creati, protetti, mantenuti e testati',
        'PR.DS'
    ),
    (
        'PR.IR-01',
        'Le reti e gli ambienti sono protetti da accessi e utilizzi logici non autorizzati',
        'PR.IR'
    ),
    (
        'PR.IR-02',
        'Gli asset tecnologici dell\'organizzazione sono protetti dalle minacce ambientali',
        'PR.IR'
    ),
    (
        'PR.IR-03',
        'Meccanismi sono implementati per raggiungere i requisiti di resilienza in situazioni normali e avverse',
        'PR.IR'
    ),
    (
        'PR.IR-04',
        'Adeguata capacità di risorse per garantire la disponibilità è mantenuta',
        'PR.IR'
    ),
    (
        'PR.PS-01',
        'Le pratiche di gestione della configurazione sono stabilite e applicate',
        'PR.PS'
    ),
    (
        'PR.PS-02',
        'Il software è mantenuto, sostituito e rimosso in modo commisurato al rischio',
        'PR.PS'
    ),
    (
        'PR.PS-03',
        'L\'hardware è mantenuto, sostituito e rimosso in modo commisurato al rischio',
        'PR.PS'
    ),
    (
        'PR.PS-04',
        'I record di log sono generati e resi disponibili per il monitoraggio continuo',
        'PR.PS'
    ),
    (
        'PR.PS-05',
        'L\'installazione e l\'esecuzione di software non autorizzato sono prevenute',
        'PR.PS'
    ),
    (
        'PR.PS-06',
        'Le pratiche di sviluppo sicuro del software sono integrate e le loro performance sono monitorate lungo il ciclo di vita dello sviluppo del software',
        'PR.PS'
    ),
    (
        'RC.CO-03',
        'Le attività di ripristino e i progressi nel ripristino delle capacità operative sono comunicati agli stakeholder interni ed esterni designati',
        'RC.CO'
    ),
    (
        'RC.CO-04',
        'Gli aggiornamenti pubblici sull\'incidente e sul ripristino sono condivisi utilizzando metodi e messaggi approvati',
        'RC.CO'
    ),
    (
        'RC.RP-01',
        'La parte di ripristino del piano di risposta agli incidenti è eseguita una volta avviata dal processo di risposta agli incidenti',
        'RC.RP'
    ),
    (
        'RC.RP-02',
        'Le azioni di ripristino sono selezionate, delimitate, prioritizzate ed eseguite',
        'RC.RP'
    ),
    (
        'RC.RP-03',
        'L\'integrità dei backup e degli altri asset di ripristino è verificata prima di utilizzarli per il ripristino',
        'RC.RP'
    ),
    (
        'RC.RP-04',
        'Le funzioni critiche della missione e la gestione del rischio di cybersecurity sono considerate per stabilire le norme operative post-incidente',
        'RC.RP'
    ),
    (
        'RC.RP-05',
        'L\'integrità degli asset ripristinati è verificata, i sistemi e i servizi sono ripristinati e lo stato operativo normale è confermato',
        'RC.RP'
    ),
    (
        'RC.RP-06',
        'La fine del ripristino dall\'incidente è dichiarata sulla base di criteri e la documentazione relativa all\'incidente è completata',
        'RC.RP'
    ),
    (
        'RS.AN-03',
        'Viene eseguita un\'analisi per stabilire cosa è accaduto durante un incidente e la causa principale dell\'incidente',
        'RS.AN'
    ),
    (
        'RS.AN-06',
        'Le azioni eseguite durante un\'indagine sono registrate e l\'integrità e la provenienza dei record sono preservate',
        'RS.AN'
    ),
    (
        'RS.AN-07',
        'I dati e i metadati degli incidenti sono raccolti e la loro integrità e provenienza sono preservate',
        'RS.AN'
    ),
    (
        'RS.AN-08',
        'La portata di un incidente è stimata e validata',
        'RS.AN'
    ),
    (
        'RS.CO-02',
        'Gli stakeholder interni ed esterni sono notificati degli incidenti',
        'RS.CO'
    ),
    (
        'RS.CO-03',
        'Le informazioni sono condivise con gli stakeholder interni ed esterni designati',
        'RS.CO'
    ),
    (
        'RS.MA-01',
        'Il piano di risposta agli incidenti è eseguito in coordinamento con le terze parti rilevanti una volta dichiarato un incidente',
        'RS.MA'
    ),
    (
        'RS.MA-02',
        'I rapporti sugli incidenti sono classificati e validati',
        'RS.MA'
    ),
    (
        'RS.MA-03',
        'Gli incidenti sono categorizzati e prioritizzati',
        'RS.MA'
    ),
    (
        'RS.MA-04',
        'Gli incidenti vengono escalati o elevati secondo necessità',
        'RS.MA'
    ),
    (
        'RS.MA-05',
        'I criteri per avviare il ripristino degli incidenti sono applicati',
        'RS.MA'
    ),
    (
        'RS.MI-01',
        'Gli incidenti sono contenuti',
        'RS.MI'
    ),
    (
        'RS.MI-02',
        'Gli incidenti sono eradicati',
        'RS.MI'
    );

INSERT INTO
    `tipoAsset`
VALUES (1, 'Server di Produzione'),
    (2, 'Client/Workstation'),
    (3, 'Sistema SCADA/PLC'),
    (4, 'Database Critico'),
    (5, 'Dispositivo IoT Medico'),
    (
        6,
        'Software Gestionale (ERP)'
    ),
    (7, 'Cloud Service'),
    (
        8,
        'Apparecchiatura di Laboratorio'
    ),
    (9, 'Network Switch/Firewall'),
    (10, 'Storage Backup');

INSERT INTO
    `tipoFornitore`
VALUES (
        1,
        'Fornitore Materie Prime (API)',
        'Alta'
    ),
    (
        2,
        'Servizi IT Cloud',
        'Media'
    ),
    (
        3,
        'Manutenzione Impianti OT',
        'Critica'
    ),
    (
        4,
        'Consulenza Regolatoria',
        'Bassa'
    ),
    (
        5,
        'Logistica a Temperatura Controllata',
        'Alta'
    );

INSERT INTO
    `valutazione`
VALUES (
        1,
        '2026-03-23 20:54:12',
        2,
        1,
        2
    ),
    (
        2,
        '2026-03-23 20:54:12',
        4,
        3,
        NULL
    ),
    (
        3,
        '2026-03-23 20:54:12',
        1,
        5,
        1
    ),
    (
        4,
        '2026-03-23 20:54:12',
        5,
        7,
        3
    ),
    (
        5,
        '2026-03-23 20:54:12',
        3,
        8,
        8
    ),
    (
        6,
        '2026-03-23 20:54:12',
        2,
        9,
        7
    ),
    (
        7,
        '2026-03-23 20:54:12',
        4,
        4,
        9
    ),
    (
        8,
        '2026-03-23 20:54:12',
        2,
        2,
        6
    );