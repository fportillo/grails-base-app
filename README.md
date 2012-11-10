Grails Base App
===============

This is a simple new Grails 2.1.1 app. However, it already has some tweaks to match my own needs and tastes. For example:

- some initial i18n localization to Brazilian Portuguese;
- springsecurity already installed;
- springsecurity UI login and register pages modified to match the standard Grails visual identity;
- springsecurity configured to use database-based authorizations;
- Added a 'contract' domain class -- usually a 'Terms of Service' is required for new applications;
- suggestions of authorization rules inside 'sql_scripts' folder, assuming tree basic roles: application administrators, operators and common users;

MySQL actions needed
--------------------

- In order for this application to run out-of-the-box it's necessary to add the mysql database and user as defined in the DataSource.groovy config file;
- Make sure you have the 'Role' springsecurity table is populated with the roles 'ROLE_ADMIN' and 'ROLE_OPS' (as references are on sql-scripts/request_map.sql) file. Otherwise constraint checking will fail;

TODO
----
- Automate database and user creation;
- Manage a script to populate the initial roles;

