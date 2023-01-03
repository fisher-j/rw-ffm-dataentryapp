PRAGMA foreign_keys = on;

CREATE TABLE IF NOT EXISTS datasheets (
    datasheetid INTEGER PRIMARY KEY,
    filename TEXT UNIQUE,
    modtime TIMESTAMP,
    status TEXT DEFAULT 'Modified' -- or 'Done' or 'Missing'
);

CREATE TABLE IF NOT EXISTS plots (
    plotid INTEGER PRIMARY KEY,
    site TEXT NOT NULL,
    treatment TEXT NOT NULL,
    burn TEXT NOT NULL,
    plotnum INTEGER NOT NULL,
    coord_x REAL,
    coord_y REAL,
    notes TEXT,
    UNIQUE(site, treatment, burn, plotnum)
);

CREATE TABLE IF NOT EXISTS stages (
    stageid INTEGER PRIMARY KEY,
    stage TEXT
);

CREATE TABLE IF NOT EXISTS collections (
    collectid INTEGER PRIMARY KEY,
    plotid INTEGER NOT NULL,
    stageid INTEGER NOT NULL,
    datasheettype TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS collectdatasheets (
    collectid INTEGER NOT NULL,
    datasheetid INTEGER NOT NULL,
    FOREIGN KEY (collectid) REFERENCES collections(collectid)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (datasheetid) REFERENCES datasheets(datasheetid)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (collectid, datasheetid)
);

CREATE TABLE IF NOT EXISTS collectdates (
    collectid INTEGER NOT NULL,
    date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS collectcrew (
    collectid INTEGER NOT NULL,
    transectid INTEGER,
    role TEXT NOT NULL,
    member TEXT NOT NULL,
    UNIQUE(collectid, transectid, role)
);

CREATE TABLE IF NOT EXISTS fuelmetadata (
    collectid INTEGER PRIMARY KEY,
    onehrlen INTEGER NOT NULL,
    tenhrlen INTEGER NOT NULL,
    hundhrlen INTEGER NOT NULL,
    thoushrlen INTEGER NOT NULL,
    notes TEXT
);

CREATE TABLE IF NOT EXISTS treemetadata (
    collectid INTEGER PRIMARY KEY,
    notes TEXT,
    FOREIGN KEY (collectid) REFERENCES collections(collectid)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS reftrees (
    collectid INTEGER PRIMARY KEY,
    treeid INTEGER NOT NULL,
    distance REAL,
    azimuth INTEGER,
    FOREIGN KEY (collectid) REFERENCES collections(collectid)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS regenmetadata (
    collectid INTEGER PRIMARY KEY,
    seedlingradius INTEGER NOT NULL,
    saplingradius INTEGER NOT NULL,
    notes TEXT,
    FOREIGN KEY (collectid) REFERENCES collections(collectid)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS trees (
    treeobsid INTEGER PRIMARY KEY,
    collectid INTEGER NOT NULL,
    treeid INTEGER NOT NULL,
    spp TEXT,
    dbh REAL,
    ht REAL,
    cbh REAL,
    cr REAL,
    clumpid INTEGER,
    notes TEXT,
    UNIQUE(collectid, treeid),
    FOREIGN KEY (collectid) REFERENCES collections(collectid)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS treedefect (
    treeobsid INTEGER NOT NULL,
    location TEXT,
    defecttype TEXT,
    UNIQUE(location, defecttype),
    FOREIGN KEY (treeobsid) REFERENCES trees(treeobsid)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS clumpsaplings (
    collectid INTEGER NOT NULL,
    clumpid INTEGER NOT NULL,
    sapdbh REAL,
    FOREIGN KEY (collectid) REFERENCES collections(collectid)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (collectid, clumpid)
);

CREATE TABLE IF NOT EXISTS regencounts (
    collectid INTEGER NOT NULL,
    spp TEXT NOT NULL,
    sizeclass TEXT NOT NULL,
    count INTEGER NOT NULL,
    UNIQUE(collectid, spp, sizeclass),
    FOREIGN KEY (collectid) REFERENCES collections(collectid)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS regenheights (
    collectid INTEGER NOT NULL,
    spp TEXT NOT NULL,
    sizeclass TEXT NOT NULL,
    cbh REAL,
    ht REAL,
    FOREIGN KEY (collectid) REFERENCES collections(collectid)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS transects (
    transectid INTEGER PRIMARY KEY,
    collectid INTEGER NOT NULL,
    transectnum INTEGER NOT NULL,
    azimuth INTEGER,
    slope INTEGER,
    notes TEXT,
    UNIQUE(collectid, transectnum)
);

CREATE TABLE IF NOT EXISTS fwd (
    transectid INTEGER PRIMARY KEY,
    onehr INTEGER NOT NULL,
    tenhr INTEGER NOT NULL,
    hundhr INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS station (
    transectid INTEGER NOT NULL,
    metermark INTEGER NOT NULL,
    depth REAL,
    pctlitter REAL,
    fbd REAL,
    livewoody REAL,
    deadwoody REAL,
    woodyheight REAL,
    liveherb REAL,
    deadherb REAL,
    herbheight REAL,
    PRIMARY KEY (transectid, metermark)
);

CREATE TABLE IF NOT EXISTS cwd (
    transectid INTEGER NOT NULL,
    diameter REAL NOT NULL,
    decayclass INTEGER NOT NULL
);

CREATE VIEW IF NOT EXISTS expand_collection
AS
SELECT
    datasheetid,
    datasheettype,
    collectid,
    plotid,
    stageid,
    plotnum
FROM collectdatasheets
JOIN collections USING(collectid)
JOIN plots USING(plotid)
;

-- CREATE VIEW IF NOT EXISTS expand_transects
-- AS 
-- SELECT
--     transectnum,
--     member,
--     slope,
--     onehr,
--     tenhr,
--     hundhr,
--     MAX(CASE WHEN metermark = 5 THEN depth) "dufflitter",
--     MAX(CASE WHEN metermark = 5 THEN pctlitter) "pctlitter",
--     MAX(CASE WHEN metermark = 5 THEN fbd) "fbd",
--     MAX(CASE WHEN metermark = 10 THEN depth) "dufflitter",
--     MAX(CASE WHEN metermark = 10 THEN pctlitter) "pctlitter",
--     MAX(CASE WHEN metermark = 10 THEN fbd) "fbd"
--     FROM transects
--     LEFT JOIN collectcrew USING(transectid)
--     LEFT JOIN fwd USING(transectid)
--     LEFT JOIN station USING(transectid)
-- ;


-- :TODO add transect to crew table
