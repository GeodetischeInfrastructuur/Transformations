-------------------------------------------------------
--     Transformation: AGRS2010 --> ETRF2000
-------------------------------------------------------
INSERT INTO
    "helmert_transformation" (
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
        tx,
        ty,
        tz,
        translation_uom_auth_name,
        translation_uom_code,
        rx,
        ry,
        rz,
        rotation_uom_auth_name,
        rotation_uom_code,
        scale_difference,
        scale_difference_uom_auth_name,
        scale_difference_uom_code,
        rate_tx,
        rate_ty,
        rate_tz,
        rate_translation_uom_auth_name,
        rate_translation_uom_code,
        rate_rx,
        rate_ry,
        rate_rz,
        rate_rotation_uom_auth_name,
        rate_rotation_uom_code,
        rate_scale_difference,
        rate_scale_difference_uom_auth_name,
        rate_scale_difference_uom_code,
        epoch,
        epoch_uom_auth_name,
        epoch_uom_code,
        px,
        py,
        pz,
        pivot_uom_auth_name,
        pivot_uom_code,
        operation_version,
        deprecated
    )
VALUES
    (
        'NSGI',
        'AGRS2010_TO_ETRF2000',
        'AGRS2010 to ETRF2000 NULL transformation',
        'null transformation between AGRS2010 and ETRF2010',
        'EPSG',
        '9603',
        'Geocentric translations (geog2D domain)',
        'NSGI',
        'AGRS2010_GEOGRAPHIC_2D',
        'EPSG',
        '9067',
        0.000,
        0.0,
        0.0,
        0.0,
        'EPSG',
        '9001',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        '',
        0
    ),
    (
        'NSGI',
        'ETRS89_TO_ETRF2000_preferred',
        'ETRS89 to ETRF2000',
        'Accuracy 0.099 m, from datum ensemble definition',
        'EPSG',
        '9603',
        'Geocentric translations (geog2D domain)',
        'EPSG',
        '4258',
        'EPSG',
        '9067',
        0.099,
        0.0,
        0.0,
        0.0,
        'EPSG',
        '9001',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        '',
        0
    ),
    (
        'NSGI',
        'Bonaire2004_TO_ITRF2000',
        'Bonaire2004 to ITRF2000 NULL transformation',
        'null transformation between Bonaire2004 and ITRF2000',
        'EPSG',
        '9603',
        'Geocentric translations (geog2D domain)',
        'NSGI',
        'Bonaire2004_GEOGRAPHIC_2D',
        'EPSG',
        '8997',
        0.000,
        0.0,
        0.0,
        0.0,
        'EPSG',
        '9001',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        '',
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
        'AGRS2010_TO_ETRF2000_USAGE',
        'helmert_transformation',
        'NSGI',
        'AGRS2010_TO_ETRF2000',
        'EPSG',
        '1262',
        'EPSG',
        '1027'
    ),
    (
        'NSGI',
        'ETRS89_TO_ETRF2000_preferred_USAGE',
        'helmert_transformation',
        'NSGI',
        'ETRS89_TO_ETRF2000_preferred',
        'EPSG',
        '1298',
        'EPSG',
        '1024'
    ),
    (
        'NSGI',
        'Bonaire2004_TO_ITRF2000_USAGE',
        'helmert_transformation',
        'NSGI',
        'Bonaire2004_TO_ITRF2000',
        'EPSG',
        '3805',
        'EPSG',
        '1027'
    );

-------------------------------------------------------
--     Transformation (concatenated): 
--     RD Bessel --> 2D ETRF2000
-------------------------------------------------------
INSERT INTO
    "concatenated_operation" (
        auth_name,
        code,
        name,
        description,
        source_crs_auth_name,
        source_crs_code,
        target_crs_auth_name,
        target_crs_code,
        accuracy,
        operation_version,
        deprecated
    )
VALUES
    (
        'NSGI',
        'RD_Bessel_TO_ETRF2000_VARIANT_1',
        'Rd Bessel to ETRF2000',
        'Transformation based on RDNAPTRANS2018 documentation',
        'EPSG',
        '4289',
        'EPSG',
        '9067',
        0.001,
        'NSGI 2019',
        0
    );

INSERT INTO
    "concatenated_operation_step" (
        operation_auth_name,
        operation_code,
        step_number,
        step_auth_name,
        step_code
    )
VALUES
    (
        'NSGI',
        'RD_Bessel_TO_ETRF2000_VARIANT_1',
        3,
        'NSGI',
        'AGRS2010_TO_ETRF2000'
    ),
    (
        'NSGI',
        'RD_Bessel_TO_ETRF2000_VARIANT_1',
        2,
        'NSGI',
        'AGRS2010_TO_Pseudo_RD_Bessel_VARIANT_1'
    ),
    (
        'NSGI',
        'RD_Bessel_TO_ETRF2000_VARIANT_1',
        1,
        'NSGI',
        'RD_Bessel_TO_Pseudo_RD_Bessel'
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
        'RD_Bessel_TO_ETRF2000_VARIANT_1_USAGE',
        'concatenated_operation',
        'NSGI',
        'RD_Bessel_TO_ETRF2000_VARIANT_1',
        'EPSG',
        '1262',
        'EPSG',
        '1181'
    );

-------------------------------------------------------
--     Transformation: DPnet --> ITRFxxxx
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
        'Bonaire_DPnet_TO_Bonaire2004',
        'DPnet Bonaire to Bonaire2004 2D transformation',
        'transformation between DPnet Bonaire and Bonaire2004',
        'PROJ',
        'PROJString',
        '+proj=pipeline +step +proj=axisswap +order=2,1 +step +proj=unitconvert +xy_in=deg +xy_out=rad +step +proj=cart +ellps=intl +step +proj=helmert +x=-366.1939 +y=-115.0688 +z=-776.7039 +rx=20.963080 +ry=16.462749 +rz=-14.276379 +s=-12.80900 +convention=coordinate_frame +exact +step +proj=cart +inv +ellps=GRS80 +step +proj=axisswap +order=2,1 +step +proj=unitconvert +xy_in=rad +xy_out=deg',
        'NSGI',
        'Bonaire_Local_2004_GEOGRAPHIC_2D',
        'NSGI',
        'Bonaire2004_GEOGRAPHIC_2D',
        0.1000,
        0
    ),
    (
        'NSGI',
        'Bonaire_DPnet_KADpeil_TO_Bonaire2004',
        'Bonaire DPnet KADpeil to Bonaire2004 3D transformation',
        'Transformation between Bonaire DPnet KADpeil and Bonaire2004',
        'PROJ',
        'PROJString',
        '+proj=pipeline +step +proj=push +v_3 +step +proj=tmerc +inv +lat_0=12.180658675 +lon_0=-68.251802281 +k_0=1 +x_0=23209.5600 +y_0=21423.9900 +ellps=intl +step +proj=cart +ellps=intl +step +proj=helmert +x=-366.1939 +y=-115.0688 +z=-776.7039 +rx=20.963080 +ry=16.462749 +rz=-14.276379 +s=-12.80900 +convention=coordinate_frame +exact +step +proj=cart +inv +ellps=GRS80 +step +proj=vgridshift +grids=bq_nsgi_bongeo2004.tif +omit_fwd +step +proj=pop +v_3 +step +proj=vgridshift +inv +grids=bq_nsgi_bongeo2004.tif +step +proj=axisswap +order=2,1 +step +proj=unitconvert +xy_in=rad +xy_out=deg',
        'NSGI',
        'Bonaire_DPnet_KADpeil',
        'NSGI',
        'Bonaire2004_GEOGRAPHIC_3D',
        0.1000,
        0
    ),
    (
        'NSGI',
        'Saba_DPnet_TO_Saba2020',
        'DPnet Saba to Saba2020 transformation',
        'Transformation between Saba DPnet and Saba2020',
        'PROJ',
        'PROJString',
        '+proj=pipeline +step +proj=axisswap +order=2,1 +step +proj=unitconvert +xy_in=deg +xy_out=rad +step +proj=cart +ellps=intl +step +proj=helmert +x=1138.7432 +y=-2064.4761 +z=110.7016 +rx=-214.615206 +ry=479.360036 +rz=-164.703951 +s=-402.32073 +convention=coordinate_frame +exact +step +proj=cart +inv +ellps=GRS80 +step +proj=axisswap +order=2,1 +step +proj=unitconvert +xy_in=rad +xy_out=deg',
        'NSGI',
        'Saba_Local_2020_GEOGRAPHIC_3D',
        'NSGI',
        'Saba2020_GEOGRAPHIC_3D',
        0.1000,
        0
    ),
    (
        'NSGI',
        'St_Eustatius_DPnet_TO_St_Eustatius2020',
        'DPnet St_Eustatius to St_Eustatius2020 transformation',
        'transformation between DPnet St_Eustatius and St_Eustatius2020',
        'PROJ',
        'PROJString',
        '+proj=pipeline +step +proj=axisswap +order=2,1 +step +proj=unitconvert +xy_in=deg +xy_out=rad +step +proj=cart +ellps=intl +step +proj=helmert +x=1276.2485 +y=-2016.6406 +z=667.4403 +rx=-101.005288 +ry=212.913401 +rz=-68.432770 +s=-431.59604 +convention=coordinate_frame +exact +step +proj=cart +inv +ellps=GRS80 +step +proj=axisswap +order=2,1 +step +proj=unitconvert +xy_in=rad +xy_out=deg',
        'NSGI',
        'St_Eustatius_Local_2020_GEOGRAPHIC_3D',
        'NSGI',
        'St_Eustatius2020_GEOGRAPHIC_3D',
        0.1000,
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
        'Bonaire_DPnet_TO_Bonaire2004_USAGE',
        'other_transformation',
        'NSGI',
        'Bonaire_DPnet_TO_Bonaire2004',
        'EPSG',
        '3805',
        'EPSG',
        '1027'
    ),
    (
        'NSGI',
        'Bonaire_DPnet_KADpeil_TO_Bonaire2004_USAGE',
        'other_transformation',
        'NSGI',
        'Bonaire_DPnet_KADpeil_TO_Bonaire2004',
        'EPSG',
        '3805',
        'EPSG',
        '1027'
    ),
    (
        'NSGI',
        'Saba_DPnet_TO_Saba2020_USAGE',
        'other_transformation',
        'NSGI',
        'Saba_DPnet_TO_Saba2020',
        'EPSG',
        '3805',
        'EPSG',
        '1027'
    ),
    (
        'NSGI',
        'St_Eustatius_DPnet_TO_St_Eustatius2020_USAGE',
        'other_transformation',
        'NSGI',
        'St_Eustatius_DPnet_TO_St_Eustatius2020',
        'EPSG',
        '3805',
        'EPSG',
        '1027'
    );