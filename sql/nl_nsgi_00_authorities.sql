-------------------------------------------------------
--     Append NSGI to authority references
-------------------------------------------------------
UPDATE authority_to_authority_preference
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

-------------------------------------------------------
--     Remove ESRI from authority references
-------------------------------------------------------
UPDATE
    authority_to_authority_preference
SET
    allowed_authorities = REPLACE(allowed_authorities,',ESRI','')
WHERE
    source_auth_name = 'EPSG'
    AND target_auth_name = 'EPSG';

DELETE FROM
    authority_to_authority_preference
WHERE
    source_auth_name = 'ESRI';
