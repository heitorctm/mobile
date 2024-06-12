import 'package:espaco_cultural_2/components/form_login.dart';
import 'package:flutter/material.dart';
import 'package:espaco_cultural_2/components/custom_appbar.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Login',
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/imagens/capa_login3.jpg'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Container(
              color: Colors.blue.withOpacity(0.5), 
              height: MediaQuery.of(context).size.height,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/imagens/unifor-logo-horizontal.svg',
                    width: 80,
                    color: Colors.white,
                  ),
                  const Text(
                    'Espaço Cultural',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Color.fromARGB(255, 233, 232, 232),
                    ),
                  ),
                  const Text(
                    'Mobile',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color.fromARGB(255, 233, 232, 232),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const LoginForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
