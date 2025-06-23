import 'package:flutter/material.dart';
import 'package:eleven_sync/pages/speed_train_screen.dart';

class NavTrainings extends StatelessWidget {
  const NavTrainings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Entrenamientos',
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
            'Velocidad',
            Icons.directions_run,
            const SpeedTrainingScreen(),
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
