import 'package:flutter/material.dart';
import 'package:espaco_cultural_2/components/evento.dart';
import 'package:espaco_cultural_2/services/database_service.dart';

class AddEventoService {
  final Map<DateTime, List<Evento>> events;
  final DatabaseService _databaseService = DatabaseService();

  AddEventoService(this.events);

  void addEvent(BuildContext context, DateTime selectedDay, Function(void) onEventAdded) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Adicionar Evento"),
          content: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: "Título do Evento"),
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(labelText: "Descrição do Evento"),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () async {
                if (titleController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
                  final newEvent = Evento(
                    title: titleController.text,
                    description: descriptionController.text,
                    date: selectedDay,
                  );
                  if (events[selectedDay] == null) {
                    events[selectedDay] = [];
                  }
                  events[selectedDay]!.add(newEvent);
                  await _databaseService.insertEvento(newEvent);
                  Navigator.of(context).pop();
                  onEventAdded(null);
                }
              },
              child: Text("Adicionar"),
            ),
          ],
        );
      },
    );
  }

  void removeEvent(BuildContext context, Evento evento, Function(void) onEventRemoved) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Remover Evento"),
          content: Text("Você tem certeza que deseja remover este evento?"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () async {
                await _databaseService.deleteEvento(evento.id!);
                events[evento.date]?.remove(evento);
                Navigator.of(context).pop();
                onEventRemoved(null);
              },
              child: Text("Remover"),
            ),
          ],
        );
      },
    );
  }
}
