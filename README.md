# resume

## Flutter environment
- There's flashing issue on 3.35.4, so change to 3.29.0.
```
  dart pub global activate fvm
  fvm install 3.29.0
  fvm use 3.29.0
  fvm flutter doctor
```

## Firebase config
- curl -sL https://firebase.tools | bash
- firebase login
- dart pub global activate flutterfire_cli
- fvm flutter pub add firebase_core
- fvm flutterfire configure --project=jess-yen
  (make sure the latest firebase version, and *get firebase_options.dart)

## Run
- (if need to update sdk) 
  fvm flutter upgrade
- fvm flutter pub get

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
- fvm flutter build web --release
- firebase deploy --only hosting

## Local Run
- Run on web
  `fvm flutter run -d chrome --web-port 5000 --web-hostname 0.0.0.0`
- Run a server for mobiile or other web to link
  `fvm flutter run -d web-server --web-port 5000 --web-hostname 0.0.0.0`

## Reference
- [radyhaggag](https://github.com/radyhaggag/web_portfolio_with_flutter?ref=flutterawesome.com)
- [nimbus](https://github.com/david-legend/nimbus)
- [material_3_demo](https://github.com/flutter/samples/tree/main/material_3_demo)
