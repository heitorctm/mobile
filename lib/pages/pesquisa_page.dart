import 'package:espaco_cultural_2/services/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:espaco_cultural_2/components/custom_appbar.dart';
import 'package:espaco_cultural_2/components/custom_drawer.dart';
import 'package:espaco_cultural_2/services/pesquisa.dart';

class PesquisaPage extends StatefulWidget {
  const PesquisaPage({super.key});

  @override
  PesquisaPageState createState() => PesquisaPageState();
}

class PesquisaPageState extends State<PesquisaPage> {
  final TextEditingController _searchController = TextEditingController();
  final PesquisaService _pesquisaService = PesquisaService();
  Artista? _artista;
  bool _isLoading = false;
  String? _errorMessage;

  void search(String query) async {
    if (query.isEmpty) {
      setState(() {
        _errorMessage = 'Por favor, insira um termo de busca.';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _artista = null;
      _errorMessage = null;
    });

    try {
      var result = await _pesquisaService.fetchObrasByAutor(query);
      setState(() {
        if (result == null) {
          _errorMessage = 'Nenhum resultado encontrado.';
        } else {
          _artista = result;
        }
      });
    } catch (e) {
      print('Erro ao buscar dados: $e');
      setState(() {
        _errorMessage = 'Erro ao buscar dados. Tente novamente.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Pesquisa',
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Buscar por autor',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => search(_searchController.text),
                ),
              ),
              onSubmitted: (value) => search(value),
            ),
          ),
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _errorMessage != null
                  ? Text(_errorMessage!)
                  : _artista != null
                      ? ListTile(
                          title: Text(_artista!.displayName),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_artista!.displayDate),
                              InkWell(
                                onTap: () =>
                                    UrlLauncher.launchURL(_artista!.url),
                                child: Text(
                                  _artista!.url,
                                  style: TextStyle(color: Colors.blue),
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(),
        ],
      ),
    );
  }
}
