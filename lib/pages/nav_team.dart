import 'package:eleven_sync/pages/tactics_screen.dart';
import 'package:flutter/material.dart';

class NavTeam extends StatelessWidget {
  const NavTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Equipo',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _navButton(context, 'Tacticas', Icons.sports, const TacticaScreen()),
        ],
      ),
    );
  }

  Widget _navButton(
    BuildContext context,
    String label,
    IconData icon,
    Widget destination,
  ) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: const TextStyle(fontSize: 16),
      ),
      onPressed:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => destination),
          ),
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
