import 'package:eleven_sync/pages/about.dart';
import 'package:eleven_sync/pages/nav_team.dart';
import 'package:eleven_sync/pages/nav_trainings.dart';
import 'package:flutter/material.dart';
import 'package:eleven_sync/pages/player_stats.dart';
import 'package:eleven_sync/pages/preferences.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Navegación',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _navButton(
            context,
            'Mi Desempeño',
            Icons.bar_chart,
            const PlayerStatsScreen(),
          ),
          const SizedBox(height: 12),
          _navButton(
            context,
            'Entrenamientos',
            Icons.fitness_center,
            const NavTrainings(),
          ),
          const SizedBox(height: 12),
          _navButton(context, 'Equipo', Icons.group, const NavTeam()),
          const SizedBox(height: 12),
          _navButton(context, 'Sobre', Icons.info, const AboutScreen()),
          const SizedBox(height: 12),
          _navButton(
            context,
            'Preferencias',
            Icons.settings,
            const PreferencesScreen(),
          ),
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
