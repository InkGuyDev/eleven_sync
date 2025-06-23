import 'package:flutter/material.dart';
import 'package:eleven_sync/domain/entities/tactic.dart';
import 'package:eleven_sync/data/services/database_helper.dart';

class TacticaScreen extends StatefulWidget {
  const TacticaScreen({super.key});

  @override
  State<TacticaScreen> createState() => _TacticaScreenState();
}

class _TacticaScreenState extends State<TacticaScreen> {
  List<Tactica> _tacticas = [];
  final List<String> formaciones = ['4-3-3', '4-4-2', '3-4-3', '4-5-1'];

  @override
  void initState() {
    super.initState();
    _loadTacticas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tácticas')),
      body: ListView.builder(
        itemCount: _tacticas.length,
        itemBuilder: (context, index) {
          final tactica = _tacticas[index];
          return ListTile(
            title: Text(tactica.titulo),
            subtitle: Text(
              '${tactica.descripcion}\nFormación: ${tactica.formacion}',
            ),
            isThreeLine: true,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _editarTactica(tactica, context),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _eliminarTactica(tactica.id!),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _addTactica(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _loadTacticas() async {
    final data = await TacticaDatabase.getTacticas();
    setState(() {
      _tacticas = data;
    });
  }

  Future<void> _addTactica(BuildContext context) async {
    final tituloController = TextEditingController();
    final descController = TextEditingController();
    String formacionSeleccionada = formaciones.first;

    await showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Nueva Táctica'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: tituloController,
                  decoration: const InputDecoration(labelText: 'Título'),
                ),
                TextField(
                  controller: descController,
                  decoration: const InputDecoration(labelText: 'Descripción'),
                ),
                DropdownButtonFormField<String>(
                  value: formacionSeleccionada,
                  items:
                      formaciones
                          .map(
                            (f) => DropdownMenuItem(value: f, child: Text(f)),
                          )
                          .toList(),
                  onChanged: (value) => formacionSeleccionada = value!,
                  decoration: const InputDecoration(labelText: 'Formación'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final nueva = Tactica(
                    titulo: tituloController.text,
                    descripcion: descController.text,
                    formacion: formacionSeleccionada,
                  );
                  await TacticaDatabase.insertTactica(nueva);
                  Navigator.pop(context);
                  _loadTacticas();
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
    );
  }

  Future<void> _editarTactica(Tactica tactica, BuildContext context) async {
    final tituloController = TextEditingController(text: tactica.titulo);
    final descController = TextEditingController(text: tactica.descripcion);
    String formacionSeleccionada = tactica.formacion;

    await showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Editar Táctica'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: tituloController,
                  decoration: const InputDecoration(labelText: 'Título'),
                ),
                TextField(
                  controller: descController,
                  decoration: const InputDecoration(labelText: 'Descripción'),
                ),
                DropdownButtonFormField<String>(
                  value: formacionSeleccionada,
                  items:
                      formaciones
                          .map(
                            (f) => DropdownMenuItem(value: f, child: Text(f)),
                          )
                          .toList(),
                  onChanged: (value) => formacionSeleccionada = value!,
                  decoration: const InputDecoration(labelText: 'Formación'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final actualizada = Tactica(
                    id: tactica.id,
                    titulo: tituloController.text,
                    descripcion: descController.text,
                    formacion: formacionSeleccionada,
                  );
                  await TacticaDatabase.updateTactica(actualizada);
                  Navigator.pop(context);
                  _loadTacticas();
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
    );
  }

  Future<void> _eliminarTactica(int id) async {
    await TacticaDatabase.deleteTactica(id);
    _loadTacticas();
  }
}
