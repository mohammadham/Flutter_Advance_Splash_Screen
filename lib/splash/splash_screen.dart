import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_splash_screen/config.dart';

enum CustomSplashScreenType { lottie, image, gif, video }

class SplashScreen extends StatefulWidget {
  final CustomSplashScreenType typeOfSplashScreen;
  final String? lottoiePath;
  final String? imagePath;
  final String? gifPath;
  final String? videoPath;
  final int splashTimeout;

  const SplashScreen({
    Key? key,
    required this.typeOfSplashScreen,
    required this.splashTimeout,
    this.lottoiePath,
    this.imagePath,
    this.gifPath,
    this.videoPath,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _navigateToHome();
  }

  void _navigateToHome() async {
    // Wait for animation to complete or timeout
    await Future.wait([
      //   _controller.duration != null
      //       ?  _controller.toggle()
      //       :
      Future.delayed(Duration(seconds: widget.splashTimeout)),
    ]);

    if (mounted) {
      Navigator.pushReplacementNamed(context, '/sphome');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _buildSplashContent(),
      ),
    );
  }

  Widget _buildSplashContent() {
    switch (widget.typeOfSplashScreen) {
      case CustomSplashScreenType.lottie:
        return Lottie.asset(
          widget.lottoiePath ?? LOGO_MOTION_LOTTIE,
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.95,
          fit: BoxFit.contain,
          controller: _controller,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward();
          },
        );
      case CustomSplashScreenType.image:
        return Image.asset(
          widget.imagePath ?? LOGO_MOTION_IMAGE,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        );
      case CustomSplashScreenType.gif:
        return Image.asset(
          widget.gifPath ?? LOGO_MOTION_GIF,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        );
      case CustomSplashScreenType.video:
        return const Placeholder(); // Implement video player here
    }
  }
}
