import 'package:flutter/material.dart';

class ProfileItems extends StatelessWidget {
  const ProfileItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade800,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          profileItemsBuilder("Cargo", "CEO"),
        ],
      ),
    );
  }

  Widget profileItemsBuilder(String value, String label) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        Text(label,
            style: const TextStyle(color: Colors.white70, fontSize: 14)),
      ],
    );
  }
}
