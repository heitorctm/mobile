import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      print('Erro ao lançar a URL: $e');
      throw 'Não foi possível abrir a URL $url';
    }
  }
}
