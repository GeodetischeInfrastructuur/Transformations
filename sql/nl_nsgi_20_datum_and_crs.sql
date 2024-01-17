-------------------------------------------------------
--     Add extents of NSGI transformations
-------------------------------------------------------
INSERT INTO
    "extent" (
        auth_name,
        code,
        name,
        description,
        south_lat,
        north_lat,
        west_lon,
        east_lon,
        deprecated
    )
VALUES
    (
        'NSGI',
        'EXTENT_3D_RDNAPTRANS2018',
        'Extent for 3D RDNAPTRANS2018',
        'Extent limited by extent of NLGEO2018 grid',
        50,
        56,
        2,
        8,
        0
    );

-------------------------------------------------------
--     Add additonal NL datum (AGRS.NL)
-------------------------------------------------------
INSERT INTO
    "geodetic_datum" (
        auth_name,
        code,
        name,
        description,
        ellipsoid_auth_name,
        ellipsoid_code,
        prime_meridian_auth_name,
        prime_meridian_code,
        publication_date,
        frame_reference_epoch,
        ensemble_accuracy,
        anchor,
        deprecated
    )
VALUES
    (
        'NSGI',
        'AGRS.NL',
        'Active GNSS Reference Sytem for the Netherlands',
        NULL,
        'EPSG',
        '7019',
        'EPSG',
        '8901',
        '1997-01-01',
        NULL,
        NULL,
        NULL,
        0
    );

INSERT INTO
    "usage" (
        auth_name,
        code,
        object_table_name,
        object_auth_name,
        object_code,
        extent_auth_name,
        extent_code,
        scope_auth_name,
        scope_code
    )
VALUES
    (
        'NSGI',
        'AGRS.NL_USAGE',
        'geodetic_datum',
        'NSGI',
        'AGRS.NL',
        'EPSG',
        '1298',
        'EPSG',
        '1027'
    );

INSERT INTO
    "geodetic_datum" (
        auth_name,
        code,
        name,
        description,
        ellipsoid_auth_name,
        ellipsoid_code,
        prime_meridian_auth_name,
        prime_meridian_code,
        publication_date,
        frame_reference_epoch,
        ensemble_accuracy,
        anchor,
        deprecated
    )
VALUES
    (
        'NSGI',
        'DPnet',
        'Geodetic Datum for BES',
        NULL,
        'EPSG',
        '7022',
        'EPSG',
        '8901',
        '2023-12-11',
        NULL,
        NULL,
        NULL,
        0
    );

INSERT INTO
    "usage" (
        auth_name,
        code,
        object_table_name,
        object_auth_name,
        object_code,
        extent_auth_name,
        extent_code,
        scope_auth_name,
        scope_code
    )
VALUES
    (
        'NSGI',
        'DPnet_USAGE',
        'geodetic_datum',
        'NSGI',
        'DPnet',
        'EPSG',
        '3805',
        'EPSG',
        '1027'
    );
-------------------------------------------------------
--     Add additonal NL crss 
--     (pseudo RD Bessel, AGRS2010)
-------------------------------------------------------
INSERT INTO
    "geodetic_crs" (
        auth_name,
        code,
        name,
        description,
        type,
        coordinate_system_auth_name,
        coordinate_system_code,
        datum_auth_name,
        datum_code,
        text_definition,
        deprecated
    )
VALUES
    (
        'NSGI',
        'PSEUDO_RD_BESSEL',
        'pseudo RD Bessel',
        NULL,
        'geographic 2D',
        'EPSG',
        '6422',
        'EPSG',
        '6289',
        NULL,
        0
    );

INSERT INTO
    "usage" (
        auth_name,
        code,
        object_table_name,
        object_auth_name,
        object_code,
        extent_auth_name,
        extent_code,
        scope_auth_name,
        scope_code
    )
VALUES
    (
        'NSGI',
        'PSEUDO_RD_BESSEL_USAGE',
        'geodetic_crs',
        'NSGI',
        'PSEUDO_RD_BESSEL',
        'EPSG',
        '1262',
        'EPSG',
        '1269'
    );

INSERT INTO
    "geodetic_crs" (
        auth_name,
        code,
        name,
        description,
        type,
        coordinate_system_auth_name,
        coordinate_system_code,
        datum_auth_name,
        datum_code,
        text_definition,
        deprecated
    )
VALUES
    (
        'NSGI',
        'AGRS2010_GEOCENTRIC',
        'AGRS2010',
        NULL,
        'geocentric',
        'EPSG',
        '6500',
        'NSGI',
        'AGRS.NL',
        NULL,
        0
    );

INSERT INTO
    "usage" (
        auth_name,
        code,
        object_table_name,
        object_auth_name,
        object_code,
        extent_auth_name,
        extent_code,
        scope_auth_name,
        scope_code
    )
VALUES
    (
        'NSGI',
        'AGRS2010_GEOCENTRIC_USAGE',
        'geodetic_crs',
        'NSGI',
        'AGRS2010_GEOCENTRIC',
        'EPSG',
        '1298',
        'EPSG',
        '1027'
    );

INSERT INTO
    "geodetic_crs" (
        auth_name,
        code,
        name,
        description,
        type,
        coordinate_system_auth_name,
        coordinate_system_code,
        datum_auth_name,
        datum_code,
        text_definition,
        deprecated
    )
VALUES
    (
        'NSGI',
        'AGRS2010_GEOGRAPHIC_3D',
        'AGRS2010',
        NULL,
        'geographic 3D',
        'EPSG',
        '6423',
        'NSGI',
        'AGRS.NL',
        NULL,
        0
    );

INSERT INTO
    "usage" (
        auth_name,
        code,
        object_table_name,
        object_auth_name,
        object_code,
        extent_auth_name,
        extent_code,
        scope_auth_name,
        scope_code
    )
VALUES
    (
        'NSGI',
        'AGRS2010_GEOGRAPHIC_3D_USAGE',
        'geodetic_crs',
        'NSGI',
        'AGRS2010_GEOGRAPHIC_3D',
        'EPSG',
        '1298',
        'EPSG',
        '1027'
    );

INSERT INTO
    "geodetic_crs" (
        auth_name,
        code,
        name,
        description,
        type,
        coordinate_system_auth_name,
        coordinate_system_code,
        datum_auth_name,
        datum_code,
        text_definition,
        deprecated
    )
VALUES
    (
        'NSGI',
        'AGRS2010_GEOGRAPHIC_2D',
        'AGRS2010',
        NULL,
        'geographic 2D',
        'EPSG',
        '6422',
        'NSGI',
        'AGRS.NL',
        NULL,
        0
    );

INSERT INTO
    "usage" (
        auth_name,
        code,
        object_table_name,
        object_auth_name,
        object_code,
        extent_auth_name,
        extent_code,
        scope_auth_name,
        scope_code
    )
VALUES
    (
        'NSGI',
        'AGRS2010_GEOGRAPHIC_2D_USAGE',
        'geodetic_crs',
        'NSGI',
        'AGRS2010_GEOGRAPHIC_2D',
        'EPSG',
        '1298',
        'EPSG',
        '1027'
    );

--- Bonaire 
INSERT INTO
    "geodetic_crs" (
        auth_name,
        code,
        name,
        description,
        type,
        coordinate_system_auth_name,
        coordinate_system_code,
        datum_auth_name,
        datum_code,
        text_definition,
        deprecated
    )
VALUES
    (
        'NSGI',
        'DPnet_Bonaire_GEOCENTRIC',
        'DPnet Bonaire',
        NULL,
        'geocentric',
        'EPSG',
        '6500',
        'NSGI',
        'AGRS.NL',
        NULL,
        0
    );

INSERT INTO
    "usage" (
        auth_name,
        code,
        object_table_name,
        object_auth_name,
        object_code,
        extent_auth_name,
        extent_code,
        scope_auth_name,
        scope_code
    )
VALUES
    (
        'NSGI',
        'DPnet_Bonaire__GEOCENTRIC_USAGE',
        'geodetic_crs',
        'NSGI',
        'DPnet_Bonaire_GEOCENTRIC',
        'EPSG',
        '3805',
        'EPSG',
        '1027'
    );

INSERT INTO
    "geodetic_crs" (
        auth_name,
        code,
        name,
        description,
        type,
        coordinate_system_auth_name,
        coordinate_system_code,
        datum_auth_name,
        datum_code,
        text_definition,
        deprecated
    )
VALUES
    (
        'NSGI',
        'DPnet_Bonaire_GEOGRAPHIC_3D',
        'DPnet Bonaire',
        NULL,
        'geographic 3D',
        'EPSG',
        '6423',
        'NSGI',
        'AGRS.NL',
        NULL,
        0
    );

INSERT INTO
    "usage" (
        auth_name,
        code,
        object_table_name,
        object_auth_name,
        object_code,
        extent_auth_name,
        extent_code,
        scope_auth_name,
        scope_code
    )
VALUES
    (
        'NSGI',
        'DPnet_Bonaire_GEOGRAPHIC_3D_USAGE',
        'geodetic_crs',
        'NSGI',
        'DPnet_Bonaire_GEOGRAPHIC_3D',
        'EPSG',
        '3805',
        'EPSG',
        '1027'
    );

INSERT INTO
    "geodetic_crs" (
        auth_name,
        code,
        name,
        description,
        type,
        coordinate_system_auth_name,
        coordinate_system_code,
        datum_auth_name,
        datum_code,
        text_definition,
        deprecated
    )
VALUES
    (
        'NSGI',
        'DPnet_Bonaire_GEOGRAPHIC_2D',
        'DPnet Bonaire',
        NULL,
        'geographic 2D',
        'EPSG',
        '6422',
        'NSGI',
        'AGRS.NL',
        NULL,
        0
    );

INSERT INTO
    "usage" (
        auth_name,
        code,
        object_table_name,
        object_auth_name,
        object_code,
        extent_auth_name,
        extent_code,
        scope_auth_name,
        scope_code
    )
VALUES
    (
        'NSGI',
        'DPnet_Bonaire_GEOGRAPHIC_2D_USAGE',
        'geodetic_crs',
        'NSGI',
        'DPnet_Bonaire_GEOGRAPHIC_2D',
        'EPSG',
        '3805',
        'EPSG',
        '1027'
    );
    
--- Saba
INSERT INTO
    "geodetic_crs" (
        auth_name,
        code,
        name,
        description,
        type,
        coordinate_system_auth_name,
        coordinate_system_code,
        datum_auth_name,
        datum_code,
        text_definition,
        deprecated
    )
VALUES
    (
        'NSGI',
        'DPnet_Saba_GEOCENTRIC',
        'DPnet Saba',
        NULL,
        'geocentric',
        'EPSG',
        '6500',
        'NSGI',
        'AGRS.NL',
        NULL,
        0
    );

INSERT INTO
    "usage" (
        auth_name,
        code,
        object_table_name,
        object_auth_name,
        object_code,
        extent_auth_name,
        extent_code,
        scope_auth_name,
        scope_code
    )
VALUES
    (
        'NSGI',
        'DPnet_Saba__GEOCENTRIC_USAGE',
        'geodetic_crs',
        'NSGI',
        'DPnet_Saba_GEOCENTRIC',
        'EPSG',
        '3805',
        'EPSG',
        '1027'
    );

INSERT INTO
    "geodetic_crs" (
        auth_name,
        code,
        name,
        description,
        type,
        coordinate_system_auth_name,
        coordinate_system_code,
        datum_auth_name,
        datum_code,
        text_definition,
        deprecated
    )
VALUES
    (
        'NSGI',
        'DPnet_Saba_GEOGRAPHIC_3D',
        'DPnet Saba',
        NULL,
        'geographic 3D',
        'EPSG',
        '6423',
        'NSGI',
        'AGRS.NL',
        NULL,
        0
    );

INSERT INTO
    "usage" (
        auth_name,
        code,
        object_table_name,
        object_auth_name,
        object_code,
        extent_auth_name,
        extent_code,
        scope_auth_name,
        scope_code
    )
VALUES
    (
        'NSGI',
        'DPnet_Saba_GEOGRAPHIC_3D_USAGE',
        'geodetic_crs',
        'NSGI',
        'DPnet_Saba_GEOGRAPHIC_3D',
        'EPSG',
        '3805',
        'EPSG',
        '1027'
    );

INSERT INTO
    "geodetic_crs" (
        auth_name,
        code,
        name,
        description,
        type,
        coordinate_system_auth_name,
        coordinate_system_code,
        datum_auth_name,
        datum_code,
        text_definition,
        deprecated
    )
VALUES
    (
        'NSGI',
        'DPnet_Saba_GEOGRAPHIC_2D',
        'DPnet Saba',
        NULL,
        'geographic 2D',
        'EPSG',
        '6422',
        'NSGI',
        'AGRS.NL',
        NULL,
        0
    );

INSERT INTO
    "usage" (
        auth_name,
        code,
        object_table_name,
        object_auth_name,
        object_code,
        extent_auth_name,
        extent_code,
        scope_auth_name,
        scope_code
    )
VALUES
    (
        'NSGI',
        'DPnet_Saba_GEOGRAPHIC_2D_USAGE',
        'geodetic_crs',
        'NSGI',
        'DPnet_Saba_GEOGRAPHIC_2D',
        'EPSG',
        '3805',
        'EPSG',
        '1027'
    );


--- St. Eustatius
INSERT INTO
    "geodetic_crs" (
        auth_name,
        code,
        name,
        description,
        type,
        coordinate_system_auth_name,
        coordinate_system_code,
        datum_auth_name,
        datum_code,
        text_definition,
        deprecated
    )
VALUES
    (
        'NSGI',
        'DPnet_St_Eustatius_GEOCENTRIC',
        'DPnet St_Eustatius',
        NULL,
        'geocentric',
        'EPSG',
        '6500',
        'NSGI',
        'AGRS.NL',
        NULL,
        0
    );

INSERT INTO
    "usage" (
        auth_name,
        code,
        object_table_name,
        object_auth_name,
        object_code,
        extent_auth_name,
        extent_code,
        scope_auth_name,
        scope_code
    )
VALUES
    (
        'NSGI',
        'DPnet_St_Eustatius_GEOCENTRIC_USAGE',
        'geodetic_crs',
        'NSGI',
        'DPnet_St_Eustatius_GEOCENTRIC',
        'EPSG',
        '3805',
        'EPSG',
        '1027'
    );

INSERT INTO
    "geodetic_crs" (
        auth_name,
        code,
        name,
        description,
        type,
        coordinate_system_auth_name,
        coordinate_system_code,
        datum_auth_name,
        datum_code,
        text_definition,
        deprecated
    )
VALUES
    (
        'NSGI',
        'DPnet_St_Eustatius_GEOGRAPHIC_3D',
        'DPnet St_Eustatius',
        NULL,
        'geographic 3D',
        'EPSG',
        '6423',
        'NSGI',
        'AGRS.NL',
        NULL,
        0
    );

INSERT INTO
    "usage" (
        auth_name,
        code,
        object_table_name,
        object_auth_name,
        object_code,
        extent_auth_name,
        extent_code,
        scope_auth_name,
        scope_code
    )
VALUES
    (
        'NSGI',
        'DPnet_St_Eustatius_GEOGRAPHIC_3D_USAGE',
        'geodetic_crs',
        'NSGI',
        'DPnet_St_Eustatius_GEOGRAPHIC_3D',
        'EPSG',
        '3805',
        'EPSG',
        '1027'
    );

INSERT INTO
    "geodetic_crs" (
        auth_name,
        code,
        name,
        description,
        type,
        coordinate_system_auth_name,
        coordinate_system_code,
        datum_auth_name,
        datum_code,
        text_definition,
        deprecated
    )
VALUES
    (
        'NSGI',
        'DPnet_St_Eustatius_GEOGRAPHIC_2D',
        'DPnet St_Eustatius',
        NULL,
        'geographic 2D',
        'EPSG',
        '6422',
        'NSGI',
        'AGRS.NL',
        NULL,
        0
    );

INSERT INTO
    "usage" (
        auth_name,
        code,
        object_table_name,
        object_auth_name,
        object_code,
        extent_auth_name,
        extent_code,
        scope_auth_name,
        scope_code
    )
VALUES
    (
        'NSGI',
        'DPnet_St_Eustatius_GEOGRAPHIC_2D_USAGE',
        'geodetic_crs',
        'NSGI',
        'DPnet_St_Eustatius_GEOGRAPHIC_2D',
        'EPSG',
        '3805',
        'EPSG',
        '1027'
    );

--- Map projections
INSERT INTO "conversion" VALUES('NSGI','DPnet_Bonaire_conversion','Local map projection system of Bonaire','','EPSG','9807','Transverse Mercator','EPSG','8801','Latitude of natural origin',12.180658675,'EPSG','9102','EPSG','8802','Longitude of natural origin',-68.251802281,'EPSG','9102','EPSG','8805','Scale factor at natural origin',1.0,'EPSG','9201','EPSG','8806','False easting',23209.5600,'EPSG','9001','EPSG','8807','False northing',21423.9900,'EPSG','9001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO "usage" VALUES('NSGI','DPnet_Bonaire_conversion_USAGE','conversion','NSGI','DPnet_Bonaire_conversion','EPSG','3805','EPSG','1027');

INSERT INTO "conversion" VALUES('NSGI','DPnet_Saba_conversion','Local map projection of Saba','','EPSG','9807','Transverse Mercator','EPSG','8801','Latitude of natural origin',0.0,'EPSG','9102','EPSG','8802','Longitude of natural origin',-63.0,'EPSG','9102','EPSG','8805','Scale factor at natural origin',0.9996,'EPSG','9201','EPSG','8806','False easting',29973.97,'EPSG','9001','EPSG','8807','False northing',1947925.94,'EPSG','9001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO "usage" VALUES('NSGI','DPnet_Saba_conversion_USAGE','conversion','NSGI','DPnet_Saba_conversion','EPSG','3805','EPSG','1027');

INSERT INTO "conversion" VALUES('NSGI','DPnet_St_Eustatius_conversion','Local map projection of St_Eustatius','','EPSG','9807','Transverse Mercator','EPSG','8801','Latitude of natural origin',0.0,'EPSG','9102','EPSG','8802','Longitude of natural origin',-63.0,'EPSG','9102','EPSG','8805','Scale factor at natural origin',0.9996,'EPSG','9201','EPSG','8806','False easting',1276.2485,'EPSG','9001','EPSG','8807','False northing',-2016.6406,'EPSG','9001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO "usage" VALUES('NSGI','DPnet_St_Eustatius_conversion_USAGE','conversion','NSGI','DPnet_St_Eustatius_conversion','EPSG','3805','EPSG','1027');

--- Projected crs
INSERT INTO "projected_crs" VALUES('NSGI','DPnet_Bonaire','Local coordinate system of Bonaire',NULL,'EPSG','4499','NSGI','DPnet_Bonaire_GEOGRAPHIC_2D','NSGI','DPnet_Bonaire_conversion',NULL,0);
INSERT INTO "usage" VALUES('NSGI','DPnet_Bonaire_USAGE','projected_crs','NSGI','DPnet_Bonaire','EPSG','3805','EPSG','1027');

INSERT INTO "projected_crs" VALUES('NSGI','DPnet_Saba','Local coordinate system of Saba',NULL,'EPSG','4499','NSGI','DPnet_Saba_GEOGRAPHIC_2D','NSGI','DPnet_Saba_conversion',NULL,0);
INSERT INTO "usage" VALUES('NSGI','DPnet_Saba_USAGE','projected_crs','NSGI','DPnet_Saba','EPSG','3805','EPSG','1027');

INSERT INTO "projected_crs" VALUES('NSGI','DPnet_St_Eustatius','Local coordinate system of St_Eustatius',NULL,'EPSG','4499','NSGI','DPnet_St_Eustatius_GEOGRAPHIC_2D','NSGI','DPnet_St_Eustatius_conversion',NULL,0);
INSERT INTO "usage" VALUES('NSGI','DPnet_St_Eustatius_USAGE','projected_crs','NSGI','DPnet_St_Eustatius','EPSG','3805','EPSG','1027');
