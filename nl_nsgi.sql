-- Append NSGI to authority references
UPDATE
    authority_to_authority_preference
SET
    allowed_authorities = 'NSGI,' || allowed_authorities 
WHERE
    source_auth_name = 'EPSG'
    AND target_auth_name = 'EPSG';

INSERT INTO
    "authority_to_authority_preference" (
        source_auth_name,
        target_auth_name,
        allowed_authorities
    )
VALUES
    ('NSGI', 'EPSG', 'NSGI,PROJ,EPSG');

------------------------------------------------------
--     Delete all existing transformations
-------------------------------------------------------
--DELETE FROM concatenated_operation;
--DELETE FROM concatenated_operation_step;
--DELETE FROM grid_transformation;
--DELETE FROM helmert_transformation_table;
--DELETE FROM other_transformation;

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

-----------------------------------------------------------------------------------
--     Deprecate all existing transformations related to RD Bessel (aka Amersfoort)
-----------------------------------------------------------------------------------
UPDATE helmert_transformation_table
SET deprecated = 1
  WHERE (source_crs_auth_name = 'EPSG' and source_crs_code = '4289') OR (target_crs_auth_name = 'EPSG' and target_crs_code = '4289')
  ;
UPDATE grid_transformation
SET deprecated = 1
  WHERE (source_crs_auth_name = 'EPSG' and source_crs_code = '4289') OR (target_crs_auth_name = 'EPSG' and target_crs_code = '4289')
  ;
UPDATE concatenated_operation
SET deprecated = 1
  WHERE (source_crs_auth_name = 'EPSG' and source_crs_code = '4289') OR (target_crs_auth_name = 'EPSG' and target_crs_code = '4289')
  ;

----------------------------------------------------------------------------
	--     Deprecate all existing transformations related to ETRS89 <--> NAP
----------------------------------------------------------------------------
--UPDATE grid_transformation
--SET deprecated = 1
--WHERE (source_crs_auth_name = 'EPSG' and source_crs_code = '4937' and target_crs_auth_name = 'EPSG' and target_crs_code = '5709' ) OR (source_crs_auth_name = 'EPSG' and source_crs_code = '5709' and target_crs_auth_name = 'EPSG' and target_crs_code = '4937' );
--  ;
--UPDATE other_transformation
--SET deprecated = 1
--WHERE (source_crs_auth_name = 'EPSG' and source_crs_code = '4937' and target_crs_auth_name = 'EPSG' and target_crs_code = '5709' ) OR (source_crs_auth_name = 'EPSG' and source_crs_code = '5709' and target_crs_auth_name = 'EPSG' and target_crs_code = '4937' );
  ;

--------------------------------------------------------------
--     Deprecate existing ETRS89 <-- --> WGS 84 (2D)
--------------------------------------------------------------
--UPDATE helmert_transformation_table
--SET deprecated = 1
--  WHERE (source_crs_auth_name = 'EPSG' AND source_crs_code = '4258' AND target_crs_auth_name = 'EPSG' AND target_crs_code = '4326') OR (source_crs_auth_name = 'EPSG' AND source_crs_code = '4326' AND target_crs_auth_name = 'EPSG' AND target_crs_code = '4258')
--  ;
--UPDATE helmert_transformation_table
--SET deprecated = 1
--  WHERE (auth_name = 'EPSG' and code = '1149')
--  ;


-------------------------------------------------------
--     Add additonal NL datum (AGRS.NL)
-------------------------------------------------------
INSERT INTO "geodetic_datum" VALUES('NSGI','AGRS.NL','Active GNSS Reference Sytem for the Netherlands',NULL,'EPSG','7019','EPSG','8901','1997-01-01',NULL,NULL,NULL,0);
INSERT INTO "usage" VALUES('NSGI','AGRS.NL_USAGE','geodetic_datum','NSGI','AGRS.NL','EPSG','1298','EPSG','1027');

-------------------------------------------------------
--     Add additonal NL crss (pseudo RD Bessel,  AGRS2010)
-------------------------------------------------------
INSERT INTO "geodetic_crs" VALUES('NSGI','PSEUDO_RD_BESSEL','pseudo RD Bessel',NULL,'geographic 2D','EPSG','6422','EPSG','6289',NULL,0);
INSERT INTO "usage" VALUES('NSGI','PSEUDO_RD_BESSEL_USAGE','geodetic_crs','NSGI','PSEUDO_RD_BESSEL','EPSG','1262','EPSG','1269');

INSERT INTO "geodetic_crs" VALUES('NSGI','AGRS2010_GEOCENTRIC','AGRS2010',NULL,'geocentric','EPSG','6500','NSGI','AGRS.NL',NULL,0);
INSERT INTO "usage" VALUES('NSGI','AGRS2010_GEOCENTRIC_USAGE','geodetic_crs','NSGI','AGRS2010_GEOCENTRIC','EPSG','1298','EPSG','1027');
INSERT INTO "geodetic_crs" VALUES('NSGI','AGRS2010_GEOGRAPHIC_3D','AGRS2010',NULL,'geographic 3D','EPSG','6423','NSGI','AGRS.NL',NULL,0);
INSERT INTO "usage" VALUES('NSGI','AGRS2010_GEOGRAPHIC_3D_USAGE','geodetic_crs','NSGI','AGRS2010_GEOGRAPHIC_3D','EPSG','1298','EPSG','1027');
INSERT INTO "geodetic_crs" VALUES('NSGI','AGRS2010_GEOGRAPHIC_2D','AGRS2010',NULL,'geographic 2D','EPSG','6422','NSGI','AGRS.NL',NULL,0);
INSERT INTO "usage" VALUES('NSGI','AGRS2010_GEOGRAPHIC_2D_USAGE','geodetic_crs','NSGI','AGRS2010_GEOGRAPHIC_2D','EPSG','1298','EPSG','1027');

-------------------------------------------------------
	--     Transformation: ETRF2000 --> AGRS2010
-------------------------------------------------------
INSERT INTO "helmert_transformation" VALUES('NSGI','ETRF2000_TO_AGRS2010','ETRF2000 to AGRS2010 NULL transformation','null transformation between ETRF2010 and AGRS2010 ','EPSG','9603','Geocentric translations (geog2D domain)','EPSG','9067','NSGI','AGRS2010_GEOGRAPHIC_2D',0.000,0.0,0.0,0.0,'EPSG','9001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0);
INSERT INTO "usage" VALUES('NSGI','ETRF2000_TO_AGRS2010_USAGE','helmert_transformation','NSGI','ETRF2000_TO_AGRS2010','EPSG','1262','EPSG','1027');

-------------------------------------------------------
	--     Transformation: AGRS2010 -> NAP height
-------------------------------------------------------
INSERT INTO "grid_transformation" VALUES('NSGI','AGRS2010_TO_NAP','AGRS2010 to NAP height','Transformation based on RDNAPTRANS2018 documentation','EPSG','9665','Geographic3D to GravityRelatedHeight (gtx)','NSGI','AGRS2010_GEOGRAPHIC_3D','EPSG','5709',0.001,'EPSG','8666','Geoid (height correction) model file','nlgeo2018.gtx',NULL,NULL,NULL,NULL,NULL,NULL,'NSGI-Nld 2018',0);
INSERT INTO "usage" VALUES('NSGI','AGRS2010_TO_NAP_USAGE','grid_transformation','NSGI','AGRS2010_TO_NAP','NSGI','EXTENT_3D_RDNAPTRANS2018','EPSG','1133');

-------------------------------------------------------
	--     Transformation: RD Bessel -> pseudo RD Bessel
-------------------------------------------------------
INSERT INTO "grid_transformation" VALUES('NSGI','RD_BESSEL_TO_PSEUDO_RD_BESSEL','RD Bessel to pseudo RD Bessel grid shift','Transformation based on RDNAPTRANS2018 documentation','EPSG','9615','NTv2','EPSG','4289','NSGI','PSEUDO_RD_BESSEL',0.001,'EPSG','8656','Latitude and longitude difference file','nl_nsgi_rdcorr2018.tif,null',NULL,NULL,NULL,NULL,NULL,NULL,'NSGI-Nld 2018',0);
INSERT INTO "usage" VALUES('NSGI','RD_BESSEL_TO_PSEUDO_RD_BESSEL_USAGE','grid_transformation','NSGI','RD_BESSEL_TO_PSEUDO_RD_BESSEL','EPSG','1262','EPSG','1051');

-------------------------------------------------------
	--     Transformation: AGRS2010 -> pseudo RD Bessel
-------------------------------------------------------

INSERT INTO
    "other_transformation" (
        auth_name,
        code,
        name,
        description,
        method_auth_name,
        method_code,
        method_name,
        source_crs_auth_name,
        source_crs_code,
        target_crs_auth_name,
        target_crs_code,
        accuracy,
        deprecated
    )
VALUES
(
        'NSGI',
        'AGRS2010_TO_PSEUDO_RD_BESSEL_VARIANT_1',
        'AGRS2010 to pseudo RD Bessel variant 1',
        'Transformation based on RDNAPTRANS2018 documentation',
        'PROJ',
        'PROJString',
        '+proj=pipeline +step +proj=axisswap +order=2,1 +step +proj=unitconvert +xy_in=deg +xy_out=rad +step +proj=push +v_3 +step +proj=set +v_3=43 +omit_inv +step +proj=cart +ellps=GRS80 +step +proj=helmert +x=-565.7346 +y=-50.4058 +z=-465.2895 +rx=-0.395023 +ry=0.330776 +rz=-1.876073 +s=-4.07242 +convention=coordinate_frame +exact +step +proj=cart +inv +ellps=bessel +step +proj=set +v_3=0 +omit_fwd +step +proj=pop +v_3 +step +proj=unitconvert +xy_in=rad +xy_out=deg +step +proj=axisswap +order=2,1',
        'NSGI',
        'AGRS2010_GEOGRAPHIC_2D',
        'NSGI',
        'PSEUDO_RD_BESSEL',
        0.001,
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
        'AGRS2010_TO_PSEUDO_RD_BESSEL_VARIANT_1_USAGE',
        'other_transformation',
        'NSGI',
        'AGRS2010_TO_PSEUDO_RD_BESSEL_VARIANT_1',
        'NSGI',
        'EXTENT_3D_RDNAPTRANS2018', 
        'EPSG',
        '1181' -- Geodesy, cadastre, engineering survey, topographic mapping.
    );

-------------------------------------------------------
	--     Transformation (concatenated): RD Bessel --> 2D ETRF2000
-------------------------------------------------------

INSERT INTO "concatenated_operation" VALUES (
    'NSGI', 'RD_BESSEL_TO_ETRF2000_VARIANT_1', -- operation auth+code
    'Rd Bessel to ETRF2000', -- name
    'Transformation based on RDNAPTRANS2018 documentation', -- description
    'EPSG', '4289', -- source_crs:  RD Bessel
    'EPSG', '9067',-- target_crs:   ETRF2000
    0.001,           -- accuracy
    'NSGI 2019',     -- operation_version
    0               -- deprecated
);
INSERT INTO "concatenated_operation_step" (
    operation_auth_name, operation_code, step_number, step_auth_name, step_code
) VALUES
    ('NSGI', 'RD_BESSEL_TO_ETRF2000_VARIANT_1', 3, 'NSGI','ETRF2000_TO_AGRS2010' ), 
    ('NSGI', 'RD_BESSEL_TO_ETRF2000_VARIANT_1', 2, 'NSGI', 'AGRS2010_TO_PSEUDO_RD_BESSEL_VARIANT_1'),
    ('NSGI', 'RD_BESSEL_TO_ETRF2000_VARIANT_1', 1, 'NSGI', 'RD_BESSEL_TO_PSEUDO_RD_BESSEL')	
;
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
        'RD_BESSEL_TO_ETRF2000_VARIANT_1_USAGE',
        'concatenated_operation',
        'NSGI',
        'RD_BESSEL_TO_ETRF2000_VARIANT_1',
        'EPSG',
        '1262', -- World
        'EPSG',
        '1181' -- Geodesy, cadastre, engineering survey, topographic mapping.
    );

-------------------------------------------------------
--     Transformation: ITRF2014 -> WGS 84
-------------------------------------------------------
INSERT INTO "helmert_transformation" VALUES('NSGI','ITRF2014_TO_WGS_84_NULL','ITRF2014 to WGS 84 NULL transformation','null transformation between ITRF2014 and WGS 84 ','EPSG','1053','Time-dependent Position Vector tfm (geocentric)','EPSG','9000','EPSG','4326',0.0,0.0,0.0,0.0,'EPSG','1025',0.0,0.0,0.0,'EPSG','1031',0.0,'EPSG','1028',0.0,0.0,0.0,'EPSG','1027',0.0,0.0,0.0,'EPSG','1032',0.0,'EPSG','1030',2021.0,'EPSG','1029',NULL,NULL,NULL,NULL,NULL,'',0);

-------------------------------------------------------
--     Transformation: ETRF2000 -> WGS 84
-------------------------------------------------------
INSERT INTO "helmert_transformation" VALUES('NSGI','ETRF2000_TO_WGS_84_NULL','ETRF2000 to WGS 84 NULL transformation','null transformation between ETRF2010 and WGS 84 ','EPSG','9603','Geocentric translations (geog2D domain)','EPSG','9067','EPSG','4326',2.0,0.0,0.0,0.0,'EPSG','9001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0);
INSERT INTO "usage" VALUES('NSGI','ETRF2000_TO_WGS_84_NULL_USAGE','helmert_transformation','NSGI','ETRF2000_TO_WGS_84_NULL','EPSG','1262','EPSG','1027');


-------------------------------------------------------
--     Transformation: RD Bessel --> 2D ITRF2014 
--     Added to shorten the transformation routes between NL projected and WGS 84 ensenmble
-------------------------------------------------------
INSERT INTO "concatenated_operation" VALUES (
    'NSGI', 'RD_BESSEL_TO_ITRF2014', -- operation auth+code
    'RD Bessel to ITRF2014 via ETRF2000', -- name
    'Transformation based on RDNAPTRANS2018 documentation', -- description
    'EPSG', '4289', -- source_crs:  RD Bessel
    'EPSG', '9000',-- target_crs:  ITRF2014
    0.001,           -- accuracy
    'NSGI 2019',     -- operation_version
    0               -- deprecated
);
INSERT INTO "concatenated_operation_step" (
    operation_auth_name, operation_code, step_number, step_auth_name, step_code
) VALUES
    ('NSGI', 'RD_BESSEL_TO_ITRF2014', 1, 'NSGI', 'RD_BESSEL_TO_PSEUDO_RD_BESSEL'),	
    ('NSGI', 'RD_BESSEL_TO_ITRF2014', 2, 'NSGI', 'AGRS2010_TO_PSEUDO_RD_BESSEL_VARIANT_1'),
    ('NSGI', 'RD_BESSEL_TO_ITRF2014', 3, 'NSGI','ETRF2000_TO_AGRS2010' ), 
    ('NSGI', 'RD_BESSEL_TO_ITRF2014', 4, 'EPSG', '8405')
;

INSERT INTO "usage" VALUES (
    'NSGI', 'RD_BESSEL_TO_ITRF2014_USAGE',              -- usage auth+code
    'concatenated_operation',   -- object_table_name
    'NSGI', 'RD_BESSEL_TO_ITRF2014', -- object auth+code
    'EPSG', '1262',       -- extent auth+code
    'EPSG', '1181'      -- scope auth+code
);

-------------------------------------------------------
--     Transformation: AGRS2010 --> 2D ITRF2014 
--     Added to shorten the transformation routes between NL projected and WGS 84 ensenmble for 3D?
-------------------------------------------------------
INSERT INTO "concatenated_operation" VALUES (
    'NSGI', 'AGRS2010_TO_ITRF2014', -- operation auth+code
    'AGRS2010 to ITRF2014 via ETRF2000', -- name
    'Transformation based on RDNAPTRANS2018 documentation', -- description
    'NSGI', 'AGRS2010_GEOGRAPHIC_2D', -- source_crs:  AGRS2010
    'EPSG', '9000',-- target_crs:  ITRF2014
    0.001,           -- accuracy
    'NSGI 2019',     -- operation_version
    0               -- deprecated
);
INSERT INTO "concatenated_operation_step" (
    operation_auth_name, operation_code, step_number, step_auth_name, step_code
) VALUES
    ('NSGI', 'AGRS2010_TO_ITRF2014', 1, 'NSGI','ETRF2000_TO_AGRS2010' ), 
    ('NSGI', 'AGRS2010_TO_ITRF2014', 2, 'EPSG', '8405')
;

INSERT INTO "usage" VALUES (
    'NSGI', 'AGRS2010_TO_ITRF2014_USAGE',              -- usage auth+code
    'concatenated_operation',   -- object_table_name
    'NSGI', 'AGRS2010_TO_ITRF2014', -- object auth+code
    'EPSG', '1262',       -- extent auth+code
    'EPSG', '1181'      -- scope auth+code
);

-------------------------------------------------------
--     Transformation: ETRS89_TO_ETRF2000
--     Added to give preference to ETRS89_TO_ETRF2000
-------------------------------------------------------
INSERT INTO "helmert_transformation" VALUES('NSGI','ETRS89_TO_ETRF2000','ETRS89 to ETRF2000','Accuracy 0.999 m, from datum ensemble definition','EPSG','9603','Geocentric translations (geog2D domain)','EPSG','4258','EPSG','9067',0.099,0.0,0.0,0.0,'EPSG','9001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0);
INSERT INTO "usage" VALUES('NSGI','ETRS89_TO_ETRF2000_USAGE','helmert_transformation','NSGI','ETRS89_TO_ETRF2000','EPSG','1298','EPSG','1024');

--INSERT INTO "helmert_transformation" VALUES('NSGI','8405','ITRF2014 to ETRF2000 (1)','Scale difference in ppb and scale difference rate in ppb/yr where 1/billion = 1E-9 or nm/m.','EPSG','1053','Time-dependent Position Vector tfm (geocentric)','EPSG','7789','EPSG','7930',0.0,54.7,52.2,-74.1,'EPSG','1025',1.701,10.29,-16.632,'EPSG','1031',2.12,'EPSG','1028',0.1,0.1,-1.9,'EPSG','1027',0.081,0.49,-0.792,'EPSG','1032',0.11,'EPSG','1030',2010.0,'EPSG','1029',NULL,NULL,NULL,NULL,NULL,'EUREF-Eur 2000',0);
--INSERT INTO "usage" VALUES('NSGI','10535','helmert_transformation','NSGI','8405','EPSG','1298','EPSG','1027');
