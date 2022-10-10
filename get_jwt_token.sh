#!/usr/bin/env bash

set -eu

AUTH_ENDPOINT=$INPUT_VECTARA_AUTH_ENDPOINT
if [ "" == "$AUTH_ENDPOINT" ]; then
    AUTH_ENDPOINT="https://vectara-prod-$INPUT_VECTARA_ACCOUNT_NUMBER.auth.us-west-2.amazoncognito.com"
fi
echo "::debug::Auth Endpoint: $AUTH_ENDPOINT"
VECTARA_RESPONSE=$(curl -XPOST -H 'Content-type: application/x-www-form-urlencoded' -d "grant_type=client_credentials&client_id=$INPUT_VECTARA_CLIENT_ID&client_secret=$INPUT_VECTARA_CLIENT_SECRET" "$AUTH_ENDPOINT/oauth2/token" | jq -r '.access_token' )
echo "JWT_TOKEN=$VECTARA_RESPONSE" >> $GITHUB_ENV