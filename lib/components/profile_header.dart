import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade800,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/imagens/profile.jpeg'),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("HEITOR DE CASTRO TEIXEIRA",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18)),
                Text("Ciência da Computação",
                    style: TextStyle(color: Colors.white70, fontSize: 16)),
                Text("2220276",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
