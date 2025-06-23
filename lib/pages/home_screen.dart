import 'package:eleven_sync/pages/speed_train_screen.dart';
import 'package:eleven_sync/pages/tactics_screen.dart';
import 'package:flutter/material.dart';
import 'package:eleven_sync/theme/util.dart';
import 'package:eleven_sync/theme/theme.dart';
import 'package:eleven_sync/widgets/app_data.dart';
import 'package:provider/provider.dart';

enum UserRole { jugador, dt, preparador }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Inter", "Orbitron");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Eleven Sync',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(
              '11Sync',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            bottom: context.watch<Appdata>().tabBar(),
          ),
          body: context.watch<Appdata>().tabBarView(),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserRole userRole = UserRole.jugador;
  final String userName = 'Usuario';

  //_HomeScreenState({required this.userRole, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hola, $userName',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAgenda(userRole),
            const SizedBox(height: 16),
            _buildAccesosRapidos(userRole),
            const SizedBox(height: 16),
            _buildNovedades(userRole),
            const SizedBox(height: 16),
            _buildDatosPersonalizados(userRole),
          ],
        ),
      ),
    );
  }

  Widget _buildAgenda(UserRole role) {
    String agendaText;
    switch (role) {
      case UserRole.jugador:
        agendaText = 'Entrenamiento a las 18:00 en cancha 2';
        break;
      case UserRole.dt:
        agendaText = 'Reunión táctica con PF a las 16:00';
        break;
      case UserRole.preparador:
        agendaText = 'Evaluación física 10:00 - Cancha 1';
        break;
    }
    return Card(
      child: ListTile(
        leading: const Icon(Icons.calendar_today),
        title: Text(agendaText),
      ),
    );
  }

  Widget _buildAccesosRapidos(UserRole role) {
    List<Widget> botones;
    switch (role) {
      case UserRole.jugador:
        botones = [
          _actionButton(
            'Nuevo entrenamiento disponible: Velocidad',
            Icons.fitness_center,
            1,
          ),
          _actionButton('Ver tácticas', Icons.sports_soccer, 2),
          //_actionButton('Confirmar asistencia', Icons.check_circle),
        ];
        break;
      case UserRole.dt:
        botones = [
          _actionButton('Crear táctica', Icons.add_chart, 0),
          _actionButton('Editar equipo', Icons.group, 0),
          _actionButton('Enviar mensaje', Icons.message, 0),
        ];
        break;
      case UserRole.preparador:
        botones = [
          _actionButton('Asignar rutina', Icons.assignment, 0),
          _actionButton('Ver progreso', Icons.trending_up, 0),
          _actionButton('Plan semanal', Icons.calendar_view_week, 0),
        ];
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Accesos rápidos',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Wrap(spacing: 12, runSpacing: 12, children: botones),
      ],
    );
  }

  Widget _buildNovedades(UserRole role) {
    String novedadText;
    switch (role) {
      case UserRole.jugador:
        novedadText = 'Nueva táctica disponible';
        break;
      case UserRole.dt:
        novedadText = 'Asistencia de jugadores actualizada';
        break;
      case UserRole.preparador:
        novedadText = 'Nuevo informe de fatiga generado';
        break;
    }
    return Card(
      child: Column(
        children: [
          Text('Novedades', style: Theme.of(context).textTheme.headlineSmall),
          ListTile(
            leading: const Icon(Icons.new_releases),
            title: Text(novedadText),
          ),
        ],
      ),
    );
  }

  Widget _buildDatosPersonalizados(UserRole role) {
    String infoText;
    switch (role) {
      case UserRole.jugador:
        infoText = 'Posición: Defensa Central • Partidos jugados: 7';
        break;
      case UserRole.dt:
        infoText = 'Equipo: Sub-17 • Formación actual: 4-4-2';
        break;
      case UserRole.preparador:
        infoText = 'Jugadores con alerta física: 2';
        break;
    }
    return Card(
      child: ListTile(leading: const Icon(Icons.person), title: Text(infoText)),
    );
  }

  void _navigationAction(int page) {
    switch (page) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => SpeedTrainingScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => TacticaScreen()),
        );
        break;
      default:
        break;
    }
  }

  Widget _actionButton(String label, IconData icon, int act) {
    return FilledButton.icon(
      onPressed: () {
        switch (act) {
          case 1:
            _navigationAction(1);
            break;
          case 2:
            _navigationAction(2);
            break;
          default:
            break;
        }
      },
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
