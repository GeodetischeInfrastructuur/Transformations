-- Append NSGI to authority references
UPDATE
    authority_to_authority_preference
SET
    allowed_authorities = allowed_authorities || ',NSGI'
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

-------------------------------------------------------
--     Transformation: ETRF2000 to RDNAP Hybrid
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
        'ETRF2000_TO_RDNAP_HYBRID',
        'ETRF2000 to RD and NAP hybrid variant',
        'Hybrid transformation based on RDNAPTRANS2018 documentation',
        'PROJ',
        'PROJString',
        '+proj=pipeline +step +proj=unitconvert +xy_in=deg +xy_out=rad +step +proj=axisswap +order=2,1 +step +proj=vgridshift +grids=nl_nsgi_nlgeo2018.tif,us_nga_egm96_15.tif +step +proj=push +v_3 +step +proj=set +v_3=43 +omit_inv +step +proj=cart +ellps=GRS80 +step +proj=helmert +x=-565.7346 +y=-50.4058 +z=-465.2895 +rx=-0.395023 +ry=0.330776 +rz=-1.876073 +s=-4.07242 +convention=coordinate_frame +exact +step +proj=cart +inv +ellps=bessel +step +proj=hgridshift +inv +grids=nl_nsgi_rdcorr2018.tif,null +step +proj=sterea +lat_0=52.156160556 +lon_0=5.387638889 +k=0.9999079 +x_0=155000 +y_0=463000 +ellps=bessel +step +proj=set +v_3=0 +omit_fwd +step +proj=pop +v_3',
        'EPSG',
        '7931',
        'EPSG',
        '7415',
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
        'ETRF2000_TO_RDNAP_HYBRID_USAGE',
        'other_transformation',
        'NSGI',
        'ETRF2000_TO_RDNAP_HYBRID',
        'EPSG',
        '1262',
        'EPSG',
        '1024'
    );

-------------------------------------------------------
--     Transformation: ETRF2000 -> RD
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
        'ETRF2000_TO_RD_VARIANT_1',
        'ETRF2000 to ETRF2000 RD variant 1',
        'Transformation based on RDNAPTRANS2018 documentation',
        'PROJ',
        'PROJString',
        '+proj=pipeline +step +proj=unitconvert +xy_in=deg +xy_out=rad +step +proj=axisswap +order=2,1 +step +proj=push +v_3 +step +proj=set +v_3=43 +omit_inv +step +proj=cart +ellps=GRS80 +step +proj=helmert +x=-565.7346 +y=-50.4058 +z=-465.2895 +rx=-0.395023 +ry=0.330776 +rz=-1.876073 +s=-4.07242 +convention=coordinate_frame +exact +step +proj=cart +inv +ellps=bessel +step +proj=hgridshift +inv +grids=nl_nsgi_rdcorr2018.tif,null +step +proj=sterea +lat_0=52.156160556 +lon_0=5.387638889 +k=0.9999079 +x_0=155000 +y_0=463000 +ellps=bessel +step +proj=set +v_3=0 +omit_fwd +step +proj=pop +v_3',
        'EPSG',
        '9067',
        'EPSG',
        '28992',
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
        'ETRF2000_TO_RD_VARIANT_1_USAGE',
        'other_transformation',
        'NSGI',
        'ETRF2000_TO_RD_VARIANT_1',
        'EPSG',
        '1262',
        'EPSG',
        '1024'
    );