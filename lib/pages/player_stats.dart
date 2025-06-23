import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayerStatsScreen extends StatefulWidget {
  const PlayerStatsScreen({super.key});

  @override
  State<PlayerStatsScreen> createState() => _PlayerStatsScreenState();
}

class _PlayerStatsScreenState extends State<PlayerStatsScreen> {
  bool _useImperial = false;
  double _recordAcceleration = 0.0;
  String _recordSprint = '';

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _useImperial = prefs.getBool('useImperial') ?? false;
      _recordAcceleration = prefs.getDouble('recordAcceleration') ?? 0.0;
      _recordSprint = prefs.getString('recordSprint') ?? '';
    });
  }

  String _formatAcceleration(double acc) =>
      _useImperial
          ? '${(acc * 3.28084).toStringAsFixed(2)} ft/s²'
          : '${acc.toStringAsFixed(2)} m/s²';

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
            _buildStatCard(
              'Aceleración máxima',
              _formatAcceleration(_recordAcceleration),
              Icons.trending_up,
            ),
            const SizedBox(height: 24),
            const Text(
              'Mejores desempeños',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildHighlight(
              'Mejor sprint',
              _recordSprint.isNotEmpty ? _recordSprint : 'No registrado',
            ),
          ],
        ),
      ),
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
