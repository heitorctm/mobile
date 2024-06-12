import 'package:espaco_cultural_2/components/evento.dart';
import 'package:flutter/material.dart';
import 'package:espaco_cultural_2/components/custom_appbar.dart';
import 'package:espaco_cultural_2/components/custom_drawer.dart';
import 'package:espaco_cultural_2/components/profile_header.dart';
import 'package:espaco_cultural_2/components/profile_itens.dart';
import 'package:espaco_cultural_2/services/database_service.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final DatabaseService _databaseService = DatabaseService();
  List<Evento> _eventos = [];

  @override
  void initState() {
    super.initState();
    _loadEventos();
  }

  Future<void> _loadEventos() async {
    List<Evento> eventos = await _databaseService.getEventos();
    setState(() {
      _eventos = eventos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Perfil',
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeader(),
            const ProfileItems(),
            ..._eventos.map((evento) => Evento(
              id: evento.id,
              title: evento.title,
              description: evento.description,
              date: evento.date,
            )).toList(),
          ],
        ),
      ),
    );
  }
}
