import 'package:http/http.dart' as http;
import 'dart:convert';

class PesquisaService {
  final String apiKey = '4dd5a968-284f-4c51-adc2-169e0bed36de';

  Future<Artista?> fetchObrasByAutor(String autor) async {
    var encodedAuthor = Uri.encodeComponent(autor);
    var url = Uri.parse('https://api.harvardartmuseums.org/person?q=displayname:$encodedAuthor&apikey=$apiKey');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['records'] != null && data['records'].isNotEmpty) {
        return Artista.fromJson(data['records'][0]);
      } else {
        throw Exception('Nenhum resultado encontrado.');
      }
    } else {
      throw Exception('Falha ao carregar dados. Status code: ${response.statusCode}');
    }
  }
}


class Artista {
  final String displayName;
  final String displayDate;
  final String url;

  Artista({
    required this.displayName,
    required this.displayDate,
    required this.url,
  });

  factory Artista.fromJson(Map<String, dynamic> json) {
    return Artista(
      displayName: json['displayname'] as String,
      displayDate: json['displaydate'] as String? ?? 'Data desconhecida',
      url: json['url'] as String,
    );
  }
}

