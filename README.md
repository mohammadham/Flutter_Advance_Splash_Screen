# Flutter Custom Splash Screen

An advanced Flutter package to seamlessly integrate native splash screens with customizable splash animations (Lottie, GIF, Image, Video) before transitioning to your main app.

![Demo](https://via.placeholder.com/600x400?text=Custom+Splash+Demo)

## Features ✨
- **Dual Splash Workflow**: Native splash → Custom splash → Main app
- **Multiple Media Types**: Lottie, GIF, Image, or Video splash screens
- **Dynamic Configuration**: Adjust duration, assets, and animation behavior
- **Platform Support**: Android, iOS, and Web ready
- **Smooth Transitions**: Preserved native splash prevents blank screens

## Installation 🚀

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/my_splash_screen.git
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Set up native splash** (required for initial loading):
```yaml
# Add to pubspec.yaml
flutter_native_splash:
  color: "#ffffff"
  image: "assets/splash_image.png"
  android: true
  ios: true
  web: true
```

4. **Generate native splash assets**
```bash
flutter pub run flutter_native_splash:create
```

## Configuration ⚙️

### Asset Setup
| Asset Type       | Recommended Location      | Supported Formats          |
|------------------|---------------------------|----------------------------|
| Lottie Animation | `assets/lottie/`          | .json                      |
| GIF              | `assets/gifs/`            | .gif                       |
| Images           | `assets/images/`          | .png, .jpg                 |
| Videos           | `assets/videos/`          | .mp4                       |

### Edit Configuration File
Modify `config.dart` to set default paths:
```dart
const String LOGO_MOTION_LOTTIE = 'assets/lottie/splash_animation.json';
const String LOGO_MOTION_GIF = 'assets/gifs/splash.gif';
const String LOGO_MOTION_IMAGE = 'assets/images/splash.png';
const String LOGO_MOTION_VIDEO = 'assets/videos/splash.mp4';
```

## Usage 🎮

### Basic Implementation
```dart
return const SplashScreen(
  typeOfSplashScreen: CustomSplashScreenType.lottie,
  splashTimeout: 5, // Seconds
);
```

### Advanced Usage
**1. Custom Asset Path**
```dart
SplashScreen(
  typeOfSplashScreen: CustomSplashScreenType.gif,
  gifPath: 'assets/custom/cool_loading.gif',
  splashTimeout: 3,
)
```

**2. Video Splash** *(Requires video player implementation)*
```dart
SplashScreen(
  typeOfSplashScreen: CustomSplashScreenType.video,
  videoPath: 'assets/videos/awesome_intro.mp4',
  splashTimeout: 10,
)
```

**3. Animation Control** (Lottie-specific)
```dart
_controller
  ..duration = composition.duration
  ..repeat(reverse: true); // For looping animation
```

## Customization Options 🎨

### Transition Timing
Control total splash duration using:
```dart
splashTimeout: 5 // Seconds
```

### Size & Positioning
```dart
Lottie.asset(
  LOGO_MOTION_LOTTIE,
  width: MediaQuery.of(context).size.width * 0.8,
  height: MediaQuery.of(context).size.height * 0.6,
  fit: BoxFit.contain,
)
```

### Background Color
```dart
Scaffold(
  backgroundColor: Colors.black, // Custom background
  body: Center(...)
)
```

## Navigation Control 🧭
Modify post-splash routing in `splash_screen.dart`:
```dart
Navigator.pushReplacementNamed(context, '/home'); // Change route name
```

## Troubleshooting 🔧

**Q: Assets not loading?**
- Verify paths in `config.dart`
- Check `pubspec.yaml` asset declarations
- Run `flutter clean && flutter pub get`

**Q: Black screen between splashes?**
- Ensure native splash is properly configured
- Verify `FlutterNativeSplash.remove()` is called

**Q: Animation stuttering?**
- Optimize asset sizes (Lottie <1MB, Images <500KB)
- Pre-cache large assets before splash screen

## Roadmap 🗺️
- [ ] Video player integration
- [ ] Network-based splash content
- [ ] Adaptive dark/light mode
- [ ] Splash progress indicators

## Contributing 🤝
Contributions welcome! Please follow:
1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License 📄
```text
MIT License
Copyright (c) 2025 Mohammad Ah
```

---

*Replace placeholder assets with your own media files for production use. For Lottie animations, consider using [LottieFiles](https://lottiefiles.com/) for optimized assets.*