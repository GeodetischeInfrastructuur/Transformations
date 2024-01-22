-------------------------------------------------------
--     Add extents of NSGI transformations
-------------------------------------------------------
INSERT INTO
    "extent" ( 
         auth_name, code, name, description, south_lat, north_lat, west_lon, east_lon, deprecated
    )
VALUES
    ( 'NSGI', 'EXTENT_3D_RDNAPTRANS2018', 'Extent for 3D RDNAPTRANS2018', 'Extent limited by extent of NLGEO2018 grid', 50, 56, 2, 8, 0 );

-------------------------------------------------------
--     Add additonal NL datum (AGRS.NL)
-------------------------------------------------------
INSERT INTO
    "geodetic_datum" (
        auth_name, code, name, description, ellipsoid_auth_name, ellipsoid_code, prime_meridian_auth_name, prime_meridian_code, publication_date, frame_reference_epoch, ensemble_accuracy, anchor, deprecated
    )
VALUES
    ( 'NSGI', 'AGRS.NL', 'Active GNSS Reference Sytem for the Netherlands', NULL, 'EPSG', '7019', 'EPSG', '8901', '1997-01-01', NULL, NULL, NULL, 0 ),
    ( 'NSGI', 'DPnet_Bonaire_Datum', 'Geodetic Datum for Bonaire', NULL, 'EPSG', '7022', 'EPSG', '8901', '2023-12-11', NULL, NULL, NULL, 0),
    ( 'NSGI', 'Bonaire2004_Datum', 'Geodetic Datum for Bonaire based on ITRF2000', NULL, 'EPSG', '7019', 'EPSG', '8901', '2023-12-11', NULL, NULL, NULL, 0),
    ( 'NSGI', 'DPnet_Saba_Datum', 'Geodetic Datum for Saba', NULL, 'EPSG', '7022', 'EPSG', '8901', '2023-12-11', NULL, NULL, NULL, 0),
    ( 'NSGI', 'DPnet_StEustatius_Datum', 'Geodetic Datum for St Eustatius', NULL, 'EPSG', '7022', 'EPSG', '8901', '2023-12-11', NULL, NULL, NULL, 0),
    ( 'NSGI', 'BES2020', 'Geodetic Datum for Bonaire, Saba and St Eustatius based on ITRF2014', NULL, 'EPSG', '7019', 'EPSG', '8901', '2023-12-11', NULL, NULL, NULL, 0);

INSERT INTO
    "usage" (
        auth_name, code, object_table_name, object_auth_name, object_code, extent_auth_name, extent_code, scope_auth_name, scope_code
    )
VALUES
    ( 'NSGI', 'AGRS.NL_USAGE', 'geodetic_datum', 'NSGI', 'AGRS.NL', 'EPSG', '1298', 'EPSG', '1027' ),
    ( 'NSGI', 'DPnet_Bonaire_Datum_USAGE', 'geodetic_datum', 'NSGI', 'DPnet_Bonaire_Datum', 'EPSG', '3805', 'EPSG', '1027'),
    ( 'NSGI', 'Bonaire2004_Datum_USAGE', 'geodetic_datum', 'NSGI', 'Bonaire2004_Datum', 'EPSG', '3805', 'EPSG', '1027'),
    ( 'NSGI', 'DPnet_Saba_Datum_USAGE', 'geodetic_datum', 'NSGI', 'DPnet_Saba_Datum', 'EPSG', '3805', 'EPSG', '1027'),
    ( 'NSGI', 'DPnet_StEustatius_Datum_USAGE', 'geodetic_datum', 'NSGI', 'DPnet_StEustatius_Datum', 'EPSG', '3805', 'EPSG', '1027'),
    ( 'NSGI', 'BES2020_USAGE', 'geodetic_datum', 'NSGI', 'BES2020', 'EPSG', '3805', 'EPSG', '1027');

-------------------------------------------------------
--     Add additonal NL crss 
--     (pseudo RD Bessel, AGRS2010)
-------------------------------------------------------
INSERT INTO
    "geodetic_crs" (  auth_name,  code,  name,  description,  type,  coordinate_system_auth_name,  coordinate_system_code,  datum_auth_name,  datum_code,  text_definition,  deprecated
    )
VALUES
    ( 'NSGI', 'Pseudo_RD_Bessel', 'pseudo RD Bessel', NULL, 'geographic 2D', 'EPSG', '6422', 'EPSG', '6289', NULL, 0),
    ( 'NSGI', 'AGRS2010_GEOCENTRIC', 'AGRS2010', NULL, 'geocentric', 'EPSG', '6500', 'NSGI', 'AGRS.NL', NULL, 0),
    ( 'NSGI', 'AGRS2010_GEOGRAPHIC_3D', 'AGRS2010', NULL, 'geographic 3D', 'EPSG', '6423', 'NSGI', 'AGRS.NL', NULL, 0),
    ( 'NSGI', 'AGRS2010_GEOGRAPHIC_2D', 'AGRS2010', NULL, 'geographic 2D', 'EPSG', '6422', 'NSGI', 'AGRS.NL', NULL, 0),
    ( 'NSGI', 'DPnet_Bonaire_GEOCENTRIC', 'DPnet Bonaire', NULL, 'geocentric', 'EPSG', '6500', 'NSGI', 'DPnet_Bonaire_Datum', NULL, 0),
    ( 'NSGI', 'DPnet_Bonaire_GEOGRAPHIC_3D', 'DPnet Bonaire', NULL, 'geographic 3D', 'EPSG', '6423', 'NSGI', 'DPnet_Bonaire_Datum', NULL, 0),
    ( 'NSGI', 'DPnet_Bonaire_GEOGRAPHIC_2D', 'DPnet Bonaire', NULL, 'geographic 2D', 'EPSG', '6422', 'NSGI', 'DPnet_Bonaire_Datum', NULL, 0),
    ( 'NSGI', 'Bonaire2004_GEOCENTRIC', 'ITRF2000 realisation approximately epoch 2001.0 of Bonaire computed in 2004', NULL, 'geocentric', 'EPSG', '6500', 'NSGI', 'Bonaire2004_Datum', NULL, 0),
    ( 'NSGI', 'Bonaire2004_GEOGRAPHIC_3D', 'ITRF2000 realisation approximately epoch 2001.0 of Bonaire computed in 2004', NULL, 'geographic 3D', 'EPSG', '6423', 'NSGI', 'Bonaire2004_Datum', NULL, 0),
    ( 'NSGI', 'Bonaire2004_GEOGRAPHIC_2D', 'ITRF2000 realisation approximately epoch 2001.0 of Bonaire computed in 2004', NULL, 'geographic 2D', 'EPSG', '6422', 'NSGI', 'Bonaire2004_Datum', NULL, 0),
    ( 'NSGI', 'DPnet_Saba_GEOCENTRIC', 'DPnet Saba', NULL, 'geocentric', 'EPSG', '6500', 'NSGI', 'DPnet_Saba_Datum', NULL, 0),
    ( 'NSGI', 'DPnet_Saba_GEOGRAPHIC_3D', 'DPnet Saba', NULL, 'geographic 3D', 'EPSG', '6423', 'NSGI', 'DPnet_Saba_Datum', NULL, 0),
    ( 'NSGI', 'DPnet_Saba_GEOGRAPHIC_2D', 'DPnet Saba', NULL, 'geographic 2D', 'EPSG', '6422', 'NSGI', 'DPnet_Saba_Datum', NULL, 0),
    ( 'NSGI', 'Saba2020_GEOCENTRIC', 'ITRF2014 realisation at epoch 2020.0 of Saba', NULL, 'geocentric', 'EPSG', '6500', 'NSGI', 'BES2020', NULL, 0),
    ( 'NSGI', 'Saba2020_GEOGRAPHIC_3D', 'ITRF2014 realisation at epoch 2020.0 of Saba', NULL, 'geographic 3D', 'EPSG', '6423', 'NSGI', 'BES2020', NULL, 0),
    ( 'NSGI', 'Saba2020_GEOGRAPHIC_2D', 'ITRF2014 realisation at epoch 2020.0 of Saba', NULL, 'geographic 2D', 'EPSG', '6422', 'NSGI', 'BES2020', NULL, 0),
    ( 'NSGI', 'DPnet_StEustatius_GEOCENTRIC', 'DPnet StEustatius', NULL, 'geocentric', 'EPSG', '6500', 'NSGI', 'DPnet_StEustatius_Datum', NULL, 0),
    ( 'NSGI', 'DPnet_StEustatius_GEOGRAPHIC_3D', 'DPnet StEustatius', NULL, 'geographic 3D', 'EPSG', '6423', 'NSGI', 'DPnet_StEustatius_Datum', NULL, 0),
    ( 'NSGI', 'DPnet_StEustatius_GEOGRAPHIC_2D', 'DPnet StEustatius', NULL, 'geographic 2D', 'EPSG', '6422', 'NSGI', 'DPnet_StEustatius_Datum', NULL, 0),
    ( 'NSGI', 'StEustatius2020_GEOCENTRIC', 'ITRF2014 realisation at epoch 2020.0 of StEustatius', NULL, 'geocentric', 'EPSG', '6500', 'NSGI', 'BES2020', NULL, 0),
    ( 'NSGI', 'StEustatius2020_GEOGRAPHIC_3D', 'ITRF2014 realisation at epoch 2020.0 of StEustatius', NULL, 'geographic 3D', 'EPSG', '6423', 'NSGI', 'BES2020', NULL, 0),
    ( 'NSGI', 'StEustatius2020_GEOGRAPHIC_2D', 'ITRF2014 realisation at epoch 2020.0 of StEustatius', NULL, 'geographic 2D', 'EPSG', '6422', 'NSGI', 'BES2020', NULL, 0);

INSERT INTO
    "usage" (
        auth_name, code, object_table_name, object_auth_name, object_code, extent_auth_name, extent_code, scope_auth_name, scope_code
    )
VALUES
    ( 'NSGI', 'Pseudo_RD_Bessel_USAGE', 'geodetic_crs', 'NSGI', 'Pseudo_RD_Bessel', 'EPSG', '1262', 'EPSG', '1269'),
    ( 'NSGI', 'AGRS2010_GEOCENTRIC_USAGE', 'geodetic_crs', 'NSGI', 'AGRS2010_GEOCENTRIC', 'EPSG', '1298', 'EPSG', '1027'),
    ( 'NSGI', 'AGRS2010_GEOGRAPHIC_3D_USAGE', 'geodetic_crs', 'NSGI', 'AGRS2010_GEOGRAPHIC_3D', 'EPSG', '1298', 'EPSG', '1027'),
    ( 'NSGI', 'AGRS2010_GEOGRAPHIC_2D_USAGE', 'geodetic_crs', 'NSGI', 'AGRS2010_GEOGRAPHIC_2D', 'EPSG', '1298', 'EPSG', '1027'),
    ( 'NSGI', 'DPnet_Bonaire_GEOCENTRIC_USAGE', 'geodetic_crs', 'NSGI', 'DPnet_Bonaire_GEOCENTRIC', 'EPSG', '3805', 'EPSG', '1027'),
    ( 'NSGI', 'DPnet_Bonaire_GEOGRAPHIC_3D_USAGE', 'geodetic_crs', 'NSGI', 'DPnet_Bonaire_GEOGRAPHIC_3D', 'EPSG', '3805', 'EPSG', '1027'),
    ( 'NSGI', 'DPnet_Bonaire_GEOGRAPHIC_2D_USAGE', 'geodetic_crs', 'NSGI', 'DPnet_Bonaire_GEOGRAPHIC_2D', 'EPSG', '3805', 'EPSG', '1027'),
    ( 'NSGI', 'Bonaire2004_GEOCENTRIC_USAGE', 'geodetic_crs', 'NSGI', 'Bonaire2004_GEOCENTRIC', 'EPSG', '3805', 'EPSG', '1027'),
    ( 'NSGI', 'Bonaire2004_GEOGRAPHIC_3D_USAGE', 'geodetic_crs', 'NSGI', 'Bonaire2004_GEOGRAPHIC_3D', 'EPSG', '3805', 'EPSG', '1027'),
    ( 'NSGI', 'Bonaire2004_GEOGRAPHIC_2D_USAGE', 'geodetic_crs', 'NSGI', 'Bonaire2004_GEOGRAPHIC_2D', 'EPSG', '3805', 'EPSG', '1027'),
    ( 'NSGI', 'DPnet_Saba_GEOCENTRIC_USAGE', 'geodetic_crs', 'NSGI', 'DPnet_Saba_GEOCENTRIC', 'EPSG', '3805', 'EPSG', '1027'),
    ( 'NSGI', 'DPnet_Saba_GEOGRAPHIC_3D_USAGE', 'geodetic_crs', 'NSGI', 'DPnet_Saba_GEOGRAPHIC_3D', 'EPSG', '3805', 'EPSG', '1027'),
    ( 'NSGI', 'DPnet_Saba_GEOGRAPHIC_2D_USAGE', 'geodetic_crs', 'NSGI', 'DPnet_Saba_GEOGRAPHIC_2D', 'EPSG', '3805', 'EPSG', '1027'),
    ( 'NSGI', 'Saba2020_GEOCENTRIC_USAGE', 'geodetic_crs', 'NSGI', 'Saba2020_GEOCENTRIC', 'EPSG', '3805', 'EPSG', '1027'),
    ( 'NSGI', 'Saba2020_GEOGRAPHIC_3D_USAGE', 'geodetic_crs', 'NSGI', 'Bonaire2004_GEOGRAPHIC_3D', 'EPSG', '3805', 'EPSG', '1027'),
    ( 'NSGI', 'Saba2020_GEOGRAPHIC_2D_USAGE', 'geodetic_crs', 'NSGI', 'Saba2020_GEOGRAPHIC_2D', 'EPSG', '3805', 'EPSG', '1027'),
    ( 'NSGI', 'DPnet_StEustatius_GEOCENTRIC_USAGE', 'geodetic_crs', 'NSGI', 'DPnet_StEustatius_GEOCENTRIC', 'EPSG', '3805', 'EPSG', '1027'),
    ( 'NSGI', 'DPnet_StEustatius_GEOGRAPHIC_3D_USAGE', 'geodetic_crs', 'NSGI', 'DPnet_StEustatius_GEOGRAPHIC_3D', 'EPSG', '3805', 'EPSG', '1027'),
    ( 'NSGI', 'DPnet_StEustatius_GEOGRAPHIC_2D_USAGE', 'geodetic_crs', 'NSGI', 'DPnet_StEustatius_GEOGRAPHIC_2D', 'EPSG', '3805', 'EPSG', '1027'),
    ( 'NSGI', 'StEustatius2020_GEOCENTRIC_USAGE', 'geodetic_crs', 'NSGI', 'StEustatius2020_GEOCENTRIC', 'EPSG', '3805', 'EPSG', '1027'),
    ( 'NSGI', 'StEustatius2020_GEOGRAPHIC_3D_USAGE', 'geodetic_crs', 'NSGI', 'Bonaire2004_GEOGRAPHIC_3D', 'EPSG', '3805', 'EPSG', '1027'),
    ( 'NSGI', 'StEustatius2020_GEOGRAPHIC_2D_USAGE', 'geodetic_crs', 'NSGI', 'StEustatius2020_GEOGRAPHIC_2D', 'EPSG', '3805', 'EPSG', '1027');


--- Map projections
INSERT INTO "conversion" 
VALUES
    ('NSGI','DPnet_Bonaire_conversion','Local map projection system of Bonaire','','EPSG','9807','Transverse Mercator','EPSG','8801','Latitude of natural origin',12.180658675,'EPSG','9102','EPSG','8802','Longitude of natural origin',-68.251802281,'EPSG','9102','EPSG','8805','Scale factor at natural origin',1.0,'EPSG','9201','EPSG','8806','False easting',23209.5600,'EPSG','9001','EPSG','8807','False northing',21423.9900,'EPSG','9001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
    ('NSGI','DPnet_Saba_conversion','Local map projection of Saba','','EPSG','9807','Transverse Mercator','EPSG','8801','Latitude of natural origin',0.0,'EPSG','9102','EPSG','8802','Longitude of natural origin',-63.0,'EPSG','9102','EPSG','8805','Scale factor at natural origin',0.9996,'EPSG','9201','EPSG','8806','False easting',29973.97,'EPSG','9001','EPSG','8807','False northing',-1947925.94,'EPSG','9001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
    ('NSGI','DPnet_StEustatius_conversion','Local map projection of StEustatius','','EPSG','9807','Transverse Mercator','EPSG','8801','Latitude of natural origin',0.0,'EPSG','9102','EPSG','8802','Longitude of natural origin',-63.0,'EPSG','9102','EPSG','8805','Scale factor at natural origin',0.9996,'EPSG','9201','EPSG','8806','False easting',500000.0,'EPSG','9001','EPSG','8807','False northing',0.0,'EPSG','9001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
    
INSERT INTO
    "usage" (
        auth_name, code, object_table_name, object_auth_name, object_code, extent_auth_name, extent_code, scope_auth_name, scope_code
    )
VALUES
    ('NSGI','DPnet_Bonaire_conversion_USAGE','conversion','NSGI','DPnet_Bonaire_conversion','EPSG','3805','EPSG','1027'),
    ('NSGI','DPnet_Saba_conversion_USAGE','conversion','NSGI','DPnet_Saba_conversion','EPSG','3805','EPSG','1027'),
    ('NSGI','DPnet_StEustatius_conversion_USAGE','conversion','NSGI','DPnet_StEustatius_conversion','EPSG','3805','EPSG','1027');

--- Projected crs
INSERT INTO "projected_crs" 
VALUES
    ('NSGI','DPnet_Bonaire','Local coordinate system of Bonaire',NULL,'EPSG','4499','NSGI','DPnet_Bonaire_GEOGRAPHIC_2D','NSGI','DPnet_Bonaire_conversion',NULL,0),
    ('NSGI','DPnet_Saba','Local coordinate system of Saba',NULL,'EPSG','4499','NSGI','DPnet_Saba_GEOGRAPHIC_2D','NSGI','DPnet_Saba_conversion',NULL,0),
    ('NSGI','DPnet_StEustatius','Local coordinate system of StEustatius',NULL,'EPSG','4499','NSGI','DPnet_StEustatius_GEOGRAPHIC_2D','NSGI','DPnet_StEustatius_conversion',NULL,0);

INSERT INTO
    "usage" (
        auth_name, code, object_table_name, object_auth_name, object_code, extent_auth_name, extent_code, scope_auth_name, scope_code
    )
VALUES
    ('NSGI','DPnet_Bonaire_USAGE','projected_crs','NSGI','DPnet_Bonaire','EPSG','3805','EPSG','1027'),
    ('NSGI','DPnet_Saba_USAGE','projected_crs','NSGI','DPnet_Saba','EPSG','3805','EPSG','1027'),
    ('NSGI','DPnet_StEustatius_USAGE','projected_crs','NSGI','DPnet_StEustatius','EPSG','3805','EPSG','1027');

-- vertical datum
INSERT INTO "vertical_datum" 
VALUES
    ('NSGI','KADpeil_Bonaire_Datum','KAD Peil Bonaire',NULL,NULL,NULL,NULL,NULL,0);

INSERT INTO
    "usage" (
        auth_name, code, object_table_name, object_auth_name, object_code, extent_auth_name, extent_code, scope_auth_name, scope_code
    )
VALUES
    ('NSGI','KADpeil_Bonaire_Datum_USAGE','vertical_datum','NSGI','KADpeil_Bonaire_Datum','EPSG','3805','EPSG','1027');

-- vertical crss
INSERT INTO "vertical_crs" 
VALUES
    ('NSGI','KADpeil_Bonaire','KADpeil_Bonaire',NULL,'EPSG','6499','EPSG','5109',0);

INSERT INTO
    "usage" (
        auth_name, code, object_table_name, object_auth_name, object_code, extent_auth_name, extent_code, scope_auth_name, scope_code
    )
VALUES
    ('NSGI','KADpeil_Bonaire_USAGE','vertical_crs','NSGI','KADpeil_Bonaire','EPSG','3805','EPSG','1027');

--- Compound crs
INSERT INTO "compound_crs" 
VALUES
('NSGI','DPnet_KADpeil_Bonaire','DPnet and KADpeil Bonaire',NULL,'NSGI','DPnet_Bonaire','NSGI','KADpeil_Bonaire',0);

INSERT INTO
    "usage" (
        auth_name, code, object_table_name, object_auth_name, object_code, extent_auth_name, extent_code, scope_auth_name, scope_code
    )
VALUES
    ('NSGI','DPnet_KADpeil_Bonaire_USAGE','compound_crs','NSGI','DPnet_KADpeil_Bonaire','EPSG','3805','EPSG','1027');
