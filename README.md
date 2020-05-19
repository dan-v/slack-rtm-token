`slack-rtm-token` allows you to generate a personal OAuth token for use with the Slack [RTM API](https://api.slack.com/rtm) now that [the creation of legacy tokens has been disabled](https://api.slack.com/changelog/2020-02-legacy-test-token-creation-to-retire). Please note that while this is still supported, it's not the recommended approach moving forward. Slack recommends moving to the Events API, but this requires hosting a public facing HTTP service to consume events which is not ideal for all situations.

## Overview
This process will require setting up a new Slack app and also requires permission to install apps into your organization. Once the app has been installed, any users in this organization can use this process to acquire their own OAuth token. 

## Create Slack App
* Create a new [Classic app](https://api.slack.com/apps?new_classic_app=1).
* After creating the app, you should be in the **Basic Information** section. Scroll down to section 'App Credentials' and jot down `Client ID`, `Client Secret`, and `Signing Secret`.
* Go to **OAuth & Permissions**
  * In section 'Redirect URL' add `http://localhost:5000`
  * In section 'Scopes' add `users:read`
  * Scroll back up and click `Install App to Workspace`

## Build and Run Script
Build the docker image
```
docker build -t slack-rtm-token .
```
Execute `slack-rtm-token`
```
docker run -it --rm -p 5000:5000 slack-rtm-token

Enter SLACK_CLIENT_ID: xxxxxxxxxxxx.xxxxxxxxxxxxx
Enter SLACK_CLIENT_SECRET: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Enter SLACK_SIGNING_SECRET: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#####################################################################################
Click here to get your token:
    https://slack.com/oauth/authorize?scope=client&client_id=xxxxxxxxxxxx.xxxxxxxxxxxxx
#####################################################################################

 * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
172.17.0.1 - - [19/May/2020 07:38:25] "GET /?code=xxxxxxxxxxx.xxxxxxxxxxxxx.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx&state= HTTP/1.1" 200 -

#####################################################################################
Your token:
    xoxp-xxxxxxxxxxxx-xxxxxxxxxxxx-xxxxxxxxxxxx-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#####################################################################################
```
