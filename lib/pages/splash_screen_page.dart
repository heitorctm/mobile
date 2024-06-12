import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:espaco_cultural_2/pages/login_page.dart';
import 'package:flutter/material.dart';


class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  SplashScreenPageState createState() => SplashScreenPageState();
}

class SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: Colors.white,
      onInit: () {
        debugPrint("On Init");
      },
      onEnd: () {
        debugPrint("On End");
      },
      childWidget: SizedBox(
        height: 200,
        width: 200,
        child: Image.asset("assets/imagens/images.png"),
      ),
      onAnimationEnd: () => debugPrint("On Fade In End"),
      nextScreen: const LoginPage(),
      duration: const Duration(milliseconds: 3515),
    );
  }
}
