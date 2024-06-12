import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTService {
  final MqttServerClient client;

  MQTTService(String server, String clientIdentifier)
      : client = MqttServerClient(server, clientIdentifier);

  Future<void> connect() async {
    client.logging(on: true);
    client.keepAlivePeriod = 20;
    client.onDisconnected = onDisconnected;
    client.onConnected = onConnected;
    client.onSubscribed = onSubscribed;

    final connMess = MqttConnectMessage()
        .withClientIdentifier(client.clientIdentifier)
        .withWillTopic('willtopic') // Se desejar um tópico de "last will"
        .withWillMessage('My Will message')
        .startClean() // Tenta uma conexão limpa
        .withWillQos(MqttQos.atLeastOnce);

    client.connectionMessage = connMess;

    try {
      await client.connect();
    } catch (e) {
      print('Exception: $e');
      disconnect();
    }

    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print('MQTT client connected');
    } else {
      print(
          'ERROR: MQTT client connection failed - disconnecting, status is ${client.connectionStatus}');
      disconnect();
    }
  }

  void disconnect() {
    client.disconnect();
  }

  void onSubscribed(String topic) {
    print('Subscribed to $topic');
  }

  void onDisconnected() {
    print('MQTT client disconnected');
  }

  void onConnected() {
    print('MQTT client connected');
  }

  void publishMessage(String topic, String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
  }
}
