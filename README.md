# resume

## Firebase config
- curl -sL https://firebase.tools | bash
- firebase login
- dart pub global activate flutterfire_cli
- flutter pub add firebase_core
- flutterfire configure --project=jess-yen
  (make sure the latest firebase version, and *get firebase_options.dart)

## Run
- (if need to update sdk) 
  flutter upgrade
- flutter pub get

## CORS
- for images
- install gsutil
  ```
    curl https://sdk.cloud.google.com | bash
    exec -l $SHELL
    gcloud init
  ```
- verify
  `gsutil --version`
- config 
  ```
    gcloud auth login
    gcloud config set project jess-yen
    gsutil ls      
  ```
- gsutil cors set cors.json gs://your-project-id.appspot.com

## Firebase Hosting
- brew install npm
- npm install -g firebase-tools

## Deploy
- flutter build web
- firebase deploy --only hosting

## Reference
- [radyhaggag](https://github.com/radyhaggag/web_portfolio_with_flutter?ref=flutterawesome.com)
- [nimbus](https://github.com/david-legend/nimbus)
- [material_3_demo](https://github.com/flutter/samples/tree/main/material_3_demo)
