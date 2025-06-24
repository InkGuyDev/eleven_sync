import 'package:eleven_sync/pages/survey.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre la aplicación'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.secondaryFixed,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text('11Sync', style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(height: 12),
            Text(
              'Versión 1.0.0',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 24),
            Text(
              'Descripción:',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 8),
            Text(
              '11Sync es una aplicación pensada para la planificación y administración de equipos de fútbol. Cada usuario puede acceder según su rol (jugador, DT, preparador físico, etc.) y colaborar en la gestión de tácticas, entrenamientos y datos de rendimiento.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 24),
            Text(
              'Tecnologías utilizadas:',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 8),
            Text('- Flutter', style: Theme.of(context).textTheme.bodyLarge),
            Text(
              '- SharedPreferences',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              '- SQLite (sqflite)',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              '- sensors_plus',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 24),
            Text(
              'Desarrollado por:',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 8),
            Text(
              'Rodrigo "IncGuy" Díaz',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              'Contactanos a: Diaz35scrodrigo@gmail.com',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 15),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 16),
              ),
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => FeedbackScreen()),
                  ),
              icon: Icon(Icons.error_outline),
              label: Text('RESPONDER ENCUESTA DE SATISFACCIÓN!!'),
            ),
          ],
        ),
      ),
    );
  }
}
