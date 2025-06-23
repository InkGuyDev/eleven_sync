import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
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

  Future<void> _updateUnitPreference(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('useImperial', value);
    setState(() {
      _useImperial = value;
    });
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
        ],
      ),
    );
  }
}
