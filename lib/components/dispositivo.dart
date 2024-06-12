import 'package:flutter/material.dart';

class Device extends StatelessWidget {
  final String name;
  final String description;
  final bool isOn;
  final ValueChanged<bool> onChanged;

  const Device({
    super.key,
    required this.name,
    required this.description,
    required this.isOn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),  
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300), 
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 2), 
          ),
        ],
      ),
      child: ListTile(
        title: Text(name),
        subtitle: Text(description),  // Mostra a descrição do dispositivo
        trailing: Switch(
          value: isOn,
          onChanged: onChanged,
          activeTrackColor: Colors.green.shade200, // cor da trilha quando ligado
          activeColor: Colors.green, // cor da bolinha quando ligado
          inactiveTrackColor: Colors.red.shade200, // cor da trilha quando desligado
          inactiveThumbColor: Colors.red, // cor da bolinha quando desligado
        ),
      ),
    );
  }
}
