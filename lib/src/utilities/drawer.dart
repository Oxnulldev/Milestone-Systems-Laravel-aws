import 'package:codex/src/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/idaip.png',
                ),
                // fit: BoxFit.cover,
                scale: 0.5,
              ),
            ),
          ),
          const SizedBox(height: 40),
          ListTile(
            leading: Icon(Icons.home, color: Colors.red[300], size: 25),
            title: const Text('Inicio', style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.red[300], size: 25),
            title: const Text('Ajustes', style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.help_center, color: Colors.red[300], size: 25),
            title: const Text('Ayuda', style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.red[300], size: 25),
            title: const Text('Nosotros', style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
