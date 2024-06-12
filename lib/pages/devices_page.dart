import 'package:espaco_cultural_2/components/custom_appbar.dart';
import 'package:espaco_cultural_2/components/custom_drawer.dart';
import 'package:espaco_cultural_2/components/dispositivo.dart';
import 'package:espaco_cultural_2/services/add_device.dart';
import 'package:espaco_cultural_2/services/database_service.dart';
import 'package:espaco_cultural_2/services/mqtt_service.dart'; // Importando o serviço MQTT
import 'package:flutter/material.dart';

class DevicesPage extends StatefulWidget {
  const DevicesPage({super.key});

  @override
  DevicesPageState createState() => DevicesPageState();
}

class DevicesPageState extends State<DevicesPage> {
  List<Map<String, dynamic>> devices = [];
  final DatabaseService _databaseService = DatabaseService();
  late MQTTService _mqttService;

  @override
  void initState() {
    super.initState();
    _mqttService = MQTTService('broker.hivemq.com', 'flutter_client'); // Substitua pelo seu broker e client ID
    _mqttService.connect();
    _loadDevices();
  }

  Future<void> _loadDevices() async {
    List<Map<String, dynamic>> loadedDevices = await _databaseService.getDevices();
    setState(() {
      devices = List<Map<String, dynamic>>.from(loadedDevices); // Garante que a lista é mutável
    });
  }

  void addDevice(String deviceName, String description) async {
    Map<String, dynamic> newDevice = {
      'name': deviceName,
      'description': description,
      'isOn': 0, // Representando "desligado" como 0
    };
    await _databaseService.insertDevice(newDevice);
    _loadDevices(); // Recarrega a lista de dispositivos após adicionar um novo
  }

  void updateDevice(int index, bool isOn) async {
    int id = devices[index]['id'];
    Map<String, dynamic> updatedDevice = {
      'name': devices[index]['name'],
      'description': devices[index]['description'],
      'isOn': isOn ? 1 : 0, // Representando "ligado" como 1
    };
    await _databaseService.updateDevice(id, updatedDevice);
    
    // Determinar o código a ser enviado com base no dispositivo e estado
    int messageCode;
    switch (devices[index]['name']) {
      case 'Ar-condicionado':
        messageCode = isOn ? 1 : 2;
        break;
      case 'Iluminação':
        messageCode = isOn ? 3 : 4;
        break;
      case 'Câmeras':
        messageCode = isOn ? 5 : 6;
        break;
      case 'Servidor':
        messageCode = isOn ? 7 : 8;
        break;
      default:
        messageCode = 0; // Código padrão para casos não previstos
        break;
    }

    // Publicar a mensagem no tópico MQTT
    _mqttService.publishMessage('heitorctm/mobile', messageCode.toString());

    _loadDevices(); // Recarrega a lista de dispositivos após atualizar um dispositivo
  }

  void confirmDeleteDevice(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmar Exclusão"),
          content: const Text("Você tem certeza que deseja excluir este dispositivo?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                removeDevice(index);
              },
              child: const Text("Excluir"),
            ),
          ],
        );
      },
    );
  }

  void removeDevice(int index) async {
    int id = devices[index]['id'];
    await _databaseService.deleteDevice(id);
    _loadDevices(); // Recarrega a lista de dispositivos após remover um dispositivo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Dispositivos',
      ),
      drawer: const CustomDrawer(),
      body: ListView.builder(
        itemCount: devices.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(devices[index]['id'].toString()),
            direction: DismissDirection.endToStart,
            confirmDismiss: (direction) async {
              confirmDeleteDevice(index);
              return false;
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: Device(
              name: devices[index]['name'],
              description: devices[index]['description'], // Adiciona a descrição
              isOn: devices[index]['isOn'] == 1,
              onChanged: (bool value) {
                setState(() {
                  devices[index] = Map<String, dynamic>.from(devices[index]); // Garante que cada dispositivo é mutável
                  devices[index]['isOn'] = value ? 1 : 0;
                  updateDevice(index, value);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => AddDevices.showAddDeviceDialog(context, addDevice),
        tooltip: 'Adicionar dispositivo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
