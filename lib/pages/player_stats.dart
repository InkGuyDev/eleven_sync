import 'package:eleven_sync/pages/speed_train_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayerStatsScreen extends StatefulWidget {
  const PlayerStatsScreen({super.key});

  @override
  State<PlayerStatsScreen> createState() => _PlayerStatsScreenState();
}

class _PlayerStatsScreenState extends State<PlayerStatsScreen> {
  bool _useImperial = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _useImperial = prefs.getBool('useImperial') ?? false;
    });
  }

  String _formatDistance(double km) =>
      _useImperial
          ? '${(km * 0.621371).toStringAsFixed(2)} mi'
          : '${km.toStringAsFixed(2)} km';

  String _formatSpeed(double kph) =>
      _useImperial
          ? '${(kph * 0.621371).toStringAsFixed(2)} mph'
          : '${kph.toStringAsFixed(2)} km/h';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Desempeño')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Resumen físico',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildStatCard('Velocidad máxima', _formatSpeed(29.7), Icons.speed),
            _buildStatCard(
              'Distancia total',
              _formatDistance(7.2),
              Icons.directions_run,
            ),
            _buildStatCard(
              'Tiempo en zona roja',
              '12 min',
              Icons.local_fire_department,
            ),
            const SizedBox(height: 24),
            const Text(
              'Mejores desempeños',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildHighlight('Mejor sprint', '6.4 seg en 40m'),
            _buildHighlight(
              'Mayor carga de entrenamiento',
              'lunes 10 de junio',
            ),
            _buildHighlight('Mayor participación', 'vs. U17 Águilas - 90 min'),
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SpeedTrainingScreen(),
              ),
            );
          },
          child: Icon(Icons.directions, size: 90),
        ),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(label),
        trailing: Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildHighlight(String title, String subtitle) {
    return ListTile(
      leading: const Icon(Icons.star, color: Colors.amber),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
