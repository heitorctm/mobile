import 'package:flutter/material.dart';

class AddDevices {
  static void showAddDeviceDialog(
      BuildContext context, Function(String, String) onAddDevice) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Adicionar Dispositivo"),
          content: const Text("Você deseja adicionar um novo dispositivo?"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Não"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                showDeviceNameDialog(context, onAddDevice);
              },
              child: const Text("Sim"),
            ),
          ],
        );
      },
    );
  }

  static void showDeviceNameDialog(
      BuildContext context, Function(String, String) onAddDevice) {
    TextEditingController descriptionController = TextEditingController();
    String? selectedDevice;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Nome do Dispositivo"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DropdownButtonFormField<String>(
                value: selectedDevice,
                onChanged: (String? newValue) {
                  selectedDevice = newValue;
                },
                items: <String>['Ar-condicionado', 'Iluminação', 'Câmeras', 'Servidor']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: const InputDecoration(hintText: "Selecione o dispositivo"),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(hintText: "Digite a localização"),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                if (selectedDevice != null && descriptionController.text.isNotEmpty) {
                  onAddDevice(selectedDevice!, descriptionController.text);
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Adicionar"),
            ),
          ],
        );
      },
    );
  }
}
