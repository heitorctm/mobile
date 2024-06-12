import 'package:flutter/material.dart';
import 'package:espaco_cultural_2/utils/app_routes.dart';
import 'package:espaco_cultural_2/services/logout.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 80,
            color: Colors.blue,
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Opções',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.blue),
            title: const Text('Home', style: TextStyle(fontSize: 20)),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.home),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today, color: Colors.blue),
            title: const Text('Calendário', style: TextStyle(fontSize: 20)),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(AppRoutes.calendario),
          ),
          ListTile(
            leading: const Icon(Icons.search, color: Colors.blue),
            title: const Text('Pesquisa', style: TextStyle(fontSize: 20)),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.pesquisa),
          ),
          ListTile(
            leading: const Icon(Icons.tungsten, color: Colors.blue),
            title: const Text('Dispositivos', style: TextStyle(fontSize: 20)),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.devices),
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.blue),
            title: const Text('Perfil', style: TextStyle(fontSize: 20)),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.perfil),
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.blue),
            title: const Text('Logout', style: TextStyle(fontSize: 20)),
            onTap: () => LogOut.showLogoutDialog(context),
          ),
        ],
      ),
    );
  }
}
