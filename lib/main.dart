import 'package:espaco_cultural_2/pages/calendario_page.dart';
import 'package:espaco_cultural_2/pages/devices_page.dart';
import 'package:espaco_cultural_2/pages/home_page.dart';
import 'package:espaco_cultural_2/pages/login_page.dart';
import 'package:espaco_cultural_2/pages/pesquisa_page.dart';
import 'package:espaco_cultural_2/pages/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:espaco_cultural_2/pages/perfil_page.dart';
import 'package:espaco_cultural_2/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => const SplashScreenPage(),
        AppRoutes.login: (context) => const LoginPage(),
        AppRoutes.perfil: (context) => const PerfilPage(),
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.devices: (context) => const DevicesPage(),
        AppRoutes.calendario: (context) => const CalendarioPage(),
        AppRoutes.pesquisa: (context) => const PesquisaPage(),
        
        
      },
    );
  }
}
