# my_splash_screen

A simple Flutter project to modify Flutter Splash and then show my own Splash before running the app.

## Getting Started

 * run pub to get packages
```bash
flutter pub get
```
 * edit pubspec.yaml file for change splash image:
 ```bash
 flutter_native_splash:
  color: "#ffffff"
  image: "assets/splash_image.png"
  android: true
  ios: true
  web: true
```
 * run to set splash image edited to using default splash image 
```bash
flutter pub run flutter_native_splash:create
```
## Change Advance Splash Files
 * add splash image/gif/lottie/video to assets folder
 * edit splash settings in config file
 ```bash
 //logo motion for naviagtion
const String LOGO_MOTION_LOTTIE = 'assets/gifs/data.json';
const String LOGO_MOTION_GIF = 'assets/gifs/loading.gif';
const String LOGO_MOTION_IMAGE = 'assets/gifs/loading.png';
const String LOGO_MOTION_VIDEO = 'assets/gifs/loading.mp4';
const String LOGO_MOTION = 'assets/gifs/loading.gif';
```