import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;

class SpeedTrainingScreen extends StatefulWidget {
  const SpeedTrainingScreen({super.key});

  @override
  State<SpeedTrainingScreen> createState() => _SpeedTrainingScreenState();
}

class _SpeedTrainingScreenState extends State<SpeedTrainingScreen> {
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  double _acceleration = 0;
  double _maxAcceleration = 0;
  late StreamSubscription<AccelerometerEvent> _accelSub;
  bool _isRunning = false;
  bool _useImperial = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
    _accelSub = accelerometerEventStream().listen((AccelerometerEvent event) {
      double acc = math.sqrt(
        math.pow(event.x, 2) + math.pow(event.y, 2) + math.pow(event.z, 2),
      );
      double netAcc = (acc - 9.8).abs();
      if (_isRunning) {
        setState(() {
          _acceleration = netAcc;
          if (netAcc > _maxAcceleration) {
            _maxAcceleration = netAcc;
          }
        });
      }
    });
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _useImperial = prefs.getBool('useImperial') ?? false;
    });
  }

  @override
  void dispose() {
    _accelSub.cancel();
    _timer?.cancel();
    super.dispose();
  }

  void _startTraining() {
    _stopwatch.reset();
    _stopwatch.start();
    _maxAcceleration = 0;
    _isRunning = true;
    _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      setState(() {});
    });
  }

  void _stopTraining() async {
    _stopwatch.stop();
    _timer?.cancel();
    _isRunning = false;

    final prefs = await SharedPreferences.getInstance();
    final previousRecord = prefs.getDouble('recordAcceleration') ?? 0.0;
    final previousSprint = prefs.getDouble('recordSprintTime') ?? 0.0;
    if (_maxAcceleration > previousRecord) {
      await prefs.setDouble('recordAcceleration', _maxAcceleration);
    }
    if (_stopwatch.elapsed.inSeconds > previousSprint) {
      await prefs.setDouble(
        'recordSprintTime',
        _stopwatch.elapsed.inSeconds * 1.0,
      );
      await prefs.setString(
        'recordSprint',
        '${_stopwatch.elapsed.inSeconds} Segundos de Sprint',
      );
    }

    double maxDisplay =
        _useImperial ? _maxAcceleration * 3.28084 : _maxAcceleration;
    String unit = _useImperial ? 'ft/s²' : 'm/s²';

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Entrenamiento finalizado'),
            content: Text(
              'Aceleración máxima registrada: ${maxDisplay.toStringAsFixed(2)} $unit',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Aceptar'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final elapsed = _stopwatch.elapsed;
    final timeStr =
        '${elapsed.inMinutes.toString().padLeft(2, '0')}:${(elapsed.inSeconds % 60).toString().padLeft(2, '0')}.${(elapsed.inMilliseconds % 1000).toString().padLeft(3, '0')}';

    double currentDisplay =
        _useImperial ? _acceleration * 3.28084 : _acceleration;
    String unit = _useImperial ? 'ft/s²' : 'm/s²';

    return Scaffold(
      appBar: AppBar(title: const Text('Entrenamiento: Velocidad')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Cronómetro', style: TextStyle(fontSize: 20)),
            Text(
              timeStr,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            const Text('Aceleración actual', style: TextStyle(fontSize: 20)),
            Text(
              '${currentDisplay.toStringAsFixed(2)} $unit',
              style: const TextStyle(fontSize: 32, color: Colors.blue),
            ),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _startTraining,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Iniciar'),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: _stopTraining,
                  icon: const Icon(Icons.stop),
                  label: const Text('Detener'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
