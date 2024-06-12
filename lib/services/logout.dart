import 'package:flutter/material.dart';

class LogOut {
  static void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text("Confirmação"),
          content: const Text("Você deseja realmente sair?"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Não"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.of(context).pushReplacementNamed('/');
              },
              child: const Text("Sim"),
            ),
          ],
        );
      },
    );
  }
}
