-------------------------------------------------------
--     Duplicate WGS 84 realizations to ITRS realizations with NSGI authority
-------------------------------------------------------
CREATE temp TABLE nsgi_wgs_84_to_itrs AS
SELECT
    *
FROM
    helmert_transformation_table
WHERE
    name LIKE 'WGS 84 (G%) to ITRF% (1)';

UPDATE
    nsgi_wgs_84_to_itrs
SET
    auth_name = 'NSGI';

INSERT INTO
    helmert_transformation_table
SELECT
    *
FROM
    nsgi_wgs_84_to_itrs;

CREATE temp TABLE nsgi_wgs_84_to_itrs_usage AS
SELECT
    *
FROM
    USAGE
WHERE
    object_auth_name IN (
        SELECT
            auth_name
        FROM
            helmert_transformation_table
        WHERE
            name LIKE 'WGS 84 (G%) to ITRF% (1)'
            AND auth_name <> 'NSGI'
    )
    AND object_code IN (
        SELECT
            code
        FROM
            helmert_transformation_table
        WHERE
            name LIKE 'WGS 84 (G%) to ITRF% (1)'
            AND auth_name <> 'NSGI'
    );

UPDATE
    nsgi_wgs_84_to_itrs_usage
SET
    auth_name = 'NSGI';

UPDATE
    nsgi_wgs_84_to_itrs_usage
SET
    object_auth_name = 'NSGI';

UPDATE
    nsgi_wgs_84_to_itrs_usage
SET
    code = object_code || '_USAGE';

INSERT INTO
    USAGE
SELECT
    *
FROM
    nsgi_wgs_84_to_itrs_usage;

-------------------------------------------------------
--     Duplicate ITRS realizations to ITRS realizations with NSGI authority
-------------------------------------------------------
CREATE temp TABLE nsgi_itrs_to_itrs AS
SELECT
    *
FROM
    helmert_transformation_table
WHERE
    name LIKE '%TRF% to %TRF% (1)'
    AND deprecated = '0';

UPDATE
    nsgi_itrs_to_itrs
SET
    auth_name = 'NSGI';

INSERT INTO
    helmert_transformation_table
SELECT
    *
FROM
    nsgi_itrs_to_itrs;

CREATE temp TABLE nsgi_itrs_to_itrs_usage AS
SELECT
    *
FROM
    USAGE
WHERE
    object_auth_name IN (
        SELECT
            auth_name
        FROM
            helmert_transformation_table
        WHERE
            name LIKE '%TRF% to %TRF% (1)'
            AND auth_name <> 'NSGI'
            AND deprecated = '0'
    )
    AND object_code IN (
        SELECT
            code
        FROM
            helmert_transformation_table
        WHERE
            name LIKE '%TRF% to %TRF% (1)'
            AND auth_name <> 'NSGI'
            AND deprecated = '0'
    )
    AND object_table_name = 'helmert_transformation';

UPDATE
    nsgi_itrs_to_itrs_usage
SET
    auth_name = 'NSGI';

UPDATE
    nsgi_itrs_to_itrs_usage
SET
    object_auth_name = 'NSGI';

UPDATE
    nsgi_itrs_to_itrs_usage
SET
    code = object_code || '_USAGE';

INSERT INTO
    USAGE
SELECT
    *
FROM
    nsgi_itrs_to_itrs_usage;

-------------------------------------------------------
--     Duplicate WGS 84 realizations to WGS 84 realizations with NSGI authority
-------------------------------------------------------
CREATE temp TABLE nsgi_wgs_84s_to_wgs_84 AS
SELECT
    *
FROM
    helmert_transformation_table
WHERE
    name LIKE 'WGS 84 (G%) to WGS 84 (G%) (1)'
    AND deprecated = '0';

UPDATE
    nsgi_wgs_84s_to_wgs_84
SET
    auth_name = 'NSGI';

INSERT INTO
    helmert_transformation_table
SELECT
    *
FROM
    nsgi_wgs_84s_to_wgs_84;

CREATE temp TABLE nsgi_wgs_84s_to_wgs_84_usage AS
SELECT
    *
FROM
    USAGE
WHERE
    object_auth_name IN (
        SELECT
            auth_name
        FROM
            helmert_transformation_table
        WHERE
            name LIKE 'WGS 84 (G%) to WGS 84 (G%) (1)'
            AND auth_name <> 'NSGI'
            AND deprecated = '0'
    )
    AND object_code IN (
        SELECT
            code
        FROM
            helmert_transformation_table
        WHERE
            name LIKE 'WGS 84 (G%) to WGS 84 (G%) (1)'
            AND auth_name <> 'NSGI'
            AND deprecated = '0'
    )
    AND object_table_name = 'helmert_transformation';

UPDATE
    nsgi_wgs_84s_to_wgs_84_usage
SET
    auth_name = 'NSGI';

UPDATE
    nsgi_wgs_84s_to_wgs_84_usage
SET
    object_auth_name = 'NSGI';

UPDATE
    nsgi_wgs_84s_to_wgs_84_usage
SET
    code = object_code || '_USAGE';

INSERT INTO
    USAGE
SELECT
    *
FROM
    nsgi_wgs_84s_to_wgs_84_usage;

-------------------------------------------------------
--     Duplicate ETRS9 ensemble to ETRS89 realizations with NSGI authority
-------------------------------------------------------
CREATE temp TABLE nsgi_etrs89_to_etrf AS
SELECT
    *
FROM
    helmert_transformation_table
WHERE
    name LIKE 'ETRS89 to ETRF%'
    AND name NOT LIKE 'ETRS89 to ETRF2000';

UPDATE
    nsgi_etrs89_to_etrf
SET
    auth_name = 'NSGI';

INSERT INTO
    helmert_transformation_table
SELECT
    *
FROM
    nsgi_etrs89_to_etrf;

CREATE temp TABLE nsgi_etrs89_to_etrf_usage AS
SELECT
    *
FROM
    USAGE
WHERE
    object_auth_name IN (
        SELECT
            auth_name
        FROM
            helmert_transformation_table
        WHERE
            name LIKE 'ETRS89 to ETRF%'
            AND name NOT LIKE 'ETRS89 to ETRF2000'
            AND auth_name <> 'NSGI'
    )
    AND object_code IN (
        SELECT
            code
        FROM
            helmert_transformation_table
        WHERE
            name LIKE 'ETRS89 to ETRF%'
            AND name NOT LIKE 'ETRS89 to ETRF2000'
            AND auth_name <> 'NSGI'
    );

UPDATE
    nsgi_etrs89_to_etrf_usage
SET
    auth_name = 'NSGI';

UPDATE
    nsgi_etrs89_to_etrf_usage
SET
    object_auth_name = 'NSGI';

UPDATE
    nsgi_etrs89_to_etrf_usage
SET
    code = object_code || '_USAGE';

INSERT INTO
    USAGE
SELECT
    *
FROM
    nsgi_etrs89_to_etrf_usage;

-------------------------------------------------------
--     Append NSGI to authority references
-------------------------------------------------------
UPDATE
    authority_to_authority_preference
SET
    allowed_authorities = 'NSGI,PROJ';