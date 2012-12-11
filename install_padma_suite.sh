#!/bin/bash

# This script will generate this file structure:
# .
# services
#	accounts
#	activity_stream
# 	contacts
#	crm
#	
# clients

mkdir clients
mkdir services
cd services

# Contacts ws
git clone git@github.com:dwaynemac/contacts.git
cd contacts
git remote add staging git@heroku.com:padma-contacts-staging.git
cd ..

# Accounts ws
git clone git@github.com:dwaynemac/padma-accounts-ws.git
mv padma-accounts-ws accounts
cd accounts
git remote add staging git@heroku.com:padma-accounts-staging.git
cd ..

# Activity Stream ws
git clone git@github.com:dwaynemac/activity_stream.git
cd activity_stream
git remote add staging git@heroku.com:padma-activity-stream-staging.git
cd ..

# CRM
git clone git@github.com:dwaynemac/crm-hub.git
mv crm-hub crm
cd crm
git remote add staging git@heroku.com:padma-crm-staging.git
cd ..