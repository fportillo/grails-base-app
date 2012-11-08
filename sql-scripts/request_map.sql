use grails_db;

INSERT INTO request_map(id, version, config_attribute, url) values ( 1,  0,  'IS_AUTHENTICATED_FULLY',        '/**');
INSERT INTO request_map(id, version, config_attribute, url) values ( 2,  0,  'ROLE_ADMIN',                    '/user/**');
INSERT INTO request_map(id, version, config_attribute, url) values ( 3,  0,  'ROLE_ADMIN',                    '/role/**');
INSERT INTO request_map(id, version, config_attribute, url) values ( 4,  0,  'IS_AUTHENTICATED_ANONYMOUSLY',  '/register/**');
INSERT INTO request_map(id, version, config_attribute, url) values ( 5,  0,  'IS_AUTHENTICATED_ANONYMOUSLY',  '/login/**');
INSERT INTO request_map(id, version, config_attribute, url) values ( 6,  0,  'ROLE_ADMIN',                    '/requestMap/**');
INSERT INTO request_map(id, version, config_attribute, url) values ( 7,  0,  'ROLE_ADMIN',                    '/securityInfo/**');
INSERT INTO request_map(id, version, config_attribute, url) values ( 8,  0,  'ROLE_ADMIN',                    '/registrationCode/**');
INSERT INTO request_map(id, version, config_attribute, url) values ( 9,  0,  'ROLE_ADMIN',                    '/aclClass/**');
INSERT INTO request_map(id, version, config_attribute, url) values ( 10, 0,  'ROLE_ADMIN',                    '/aclEntry/**');
INSERT INTO request_map(id, version, config_attribute, url) values ( 11, 0,  'ROLE_ADMIN',                    '/aclObjectIdentity/**');
INSERT INTO request_map(id, version, config_attribute, url) values ( 12, 0,  'ROLE_ADMIN',                    '/aclSid/**');
INSERT INTO request_map(id, version, config_attribute, url) values ( 13, 0,  'ROLE_ADMIN',                    '/persistentLogin/**');
INSERT INTO request_map(id, version, config_attribute, url) values ( 14, 0,  'ROLE_ADMIN',                    '/dbdoc/**');
INSERT INTO request_map(id, version, config_attribute, url) values ( 15, 0,  'ROLE_ADMIN,ROLE_OPS',           '/contract/**');
INSERT INTO request_map(id, version, config_attribute, url) values ( 16, 0,  'ROLE_ADMIN,ROLE_OPS',           '/contractAudit/**');

COMMIT;
