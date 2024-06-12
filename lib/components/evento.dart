import 'package:flutter/material.dart';

class Evento extends StatelessWidget {
  final int? id;
  final String title;
  final String description;
  final DateTime date;
  final VoidCallback? onRemove;
  final bool showRemoveIcon;

  const Evento({
    super.key,
    this.id,
    required this.title,
    required this.description,
    required this.date,
    this.onRemove,
    this.showRemoveIcon = false, // Padrão é não mostrar o ícone de remoção
  });

  // Adicionando o método toMap
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(Icons.notifications, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                description,
                style: const TextStyle(fontSize: 14.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                '${date.day}/${date.month}/${date.year}',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
        trailing: showRemoveIcon
            ? IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: onRemove,
              )
            : null,
      ),
    );
  }
}
