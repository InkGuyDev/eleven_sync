import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  bool _useImperial = false;
  String _startDay = 'Lunes';
  bool _permisoDT = true;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _useImperial = prefs.getBool('useImperial') ?? false;
      _startDay = prefs.getString('startDay') ?? 'Lunes';
      _permisoDT = prefs.getBool('permisoDT') ?? true;
    });
  }

  Future<void> _updateUnitPreference(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('useImperial', value);
    setState(() {
      _useImperial = value;
    });
  }

  Future<void> _updateStartDay(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('startDay', value);
    setState(() {
      _startDay = value;
    });
  }

  Future<void> _updatePermisoDT(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('permisoDT', value);
    setState(() {
      _permisoDT = value;
    });
  }

  Future<void> _resetStats() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('recordAcceleration');
    await prefs.remove('recordSprint');
    await prefs.remove('recordSpeed');
    await prefs.remove('recordDistance');
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Estadísticas reiniciadas')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preferencias')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: const Text('Usar sistema imperial (millas, pies, etc.)'),
            value: _useImperial,
            onChanged: _updateUnitPreference,
            secondary: const Icon(Icons.swap_horiz),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Día de inicio de semana'),
            subtitle: Text(_startDay),
            onTap: () async {
              final opciones = ['Lunes', 'Domingo'];
              final seleccion = await showDialog<String>(
                context: context,
                builder:
                    (ctx) => SimpleDialog(
                      title: const Text('Selecciona el día de inicio'),
                      children:
                          opciones.map((opcion) {
                            return SimpleDialogOption(
                              onPressed: () => Navigator.pop(ctx, opcion),
                              child: Text(opcion),
                            );
                          }).toList(),
                    ),
              );
              if (seleccion != null) _updateStartDay(seleccion);
            },
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Permisos de DT'),
            subtitle: const Text('Permite crear, editar y eliminar tácticas'),
            value: _permisoDT,
            onChanged: _updatePermisoDT,
            secondary: const Icon(Icons.manage_accounts),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.refresh),
            title: const Text('Reiniciar estadísticas'),
            subtitle: const Text('Borrar récords de desempeño guardados'),
            onTap: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder:
                    (ctx) => AlertDialog(
                      title: const Text('¿Reiniciar estadísticas?'),
                      content: const Text('Esta acción no se puede deshacer.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx, false),
                          child: const Text('Cancelar'),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(ctx, true),
                          child: const Text('Reiniciar'),
                        ),
                      ],
                    ),
              );
              if (confirm == true) _resetStats();
            },
          ),
        ],
      ),
    );
  }
}
