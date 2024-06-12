import 'package:flutter/material.dart';

import '../utils/app_routes.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  void login() {}

  @override
  Widget build(BuildContext context) {
    Map<String, String> loginData = {
      'email': '',
      'senha': '',
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          onSaved: (email) => loginData['email'] = email ?? '',
          obscureText: false,

          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            labelText: 'Matrícula',
            labelStyle: TextStyle(color: Colors.white70),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
            ),
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          onSaved: (senha) => loginData['senha'] = senha ?? '',
          obscureText: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: 'Senha',
            labelStyle: const TextStyle(color: Colors.white70),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.visibility_off, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
          ),
          onPressed: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.perfil),
          child: const Text(
            'Acessar',
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.w900, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
