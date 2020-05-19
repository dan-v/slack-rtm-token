#!/usr/bin/env bash

if [ -z "${SLACK_CLIENT_ID}" ]; then
  read -p "Enter SLACK_CLIENT_ID: " SLACK_CLIENT_ID
  export SLACK_CLIENT_ID=${SLACK_CLIENT_ID}
fi
if [ -z "${SLACK_CLIENT_SECRET}" ]; then
  read -p "Enter SLACK_CLIENT_SECRET: " SLACK_CLIENT_SECRET
  export SLACK_CLIENT_SECRET=${SLACK_CLIENT_SECRET}
fi
if [ -z "${SLACK_SIGNING_SECRET}" ]; then
  read -p "Enter SLACK_SIGNING_SECRET: " SLACK_SIGNING_SECRET
  export SLACK_SIGNING_SECRET=${SLACK_SIGNING_SECRET}
fi
if [ -z "${SCOPE}" ]; then
  export SCOPE="client"
fi
if [ -z "${OUTPUT_FILE}" ]; then
  export OUTPUT_FILE="auth.txt"
fi

echo
echo "#####################################################################################"
echo "Click here to get your token:"
echo "    https://slack.com/oauth/authorize?scope=${SCOPE}&client_id=${SLACK_CLIENT_ID}"
echo "#####################################################################################"
echo

flask run --host=0.0.0.0

echo
echo "#####################################################################################"
echo "Your token:"
echo "    $(cat ${OUTPUT_FILE})"
echo "#####################################################################################"
echo
