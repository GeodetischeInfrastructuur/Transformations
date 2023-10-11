-- Remove all entries added by the nl_nsgi.sql
UPDATE
    authority_to_authority_preference
SET
    allowed_authorities = REPLACE(allowed_authorities,',NSGI','')
WHERE
    source_auth_name = 'EPSG'
    AND target_auth_name = 'EPSG';

DELETE FROM
    authority_to_authority_preference
WHERE 
    source_auth_name = 'NSGI';

DELETE FROM
    other_transformation
WHERE
    auth_name = 'NSGI';

DELETE FROM
    usage
WHERE
    auth_name = 'NSGI';