import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController _nombreController = TextEditingController();

  final Map<String, List<Map<String, dynamic>>> _secciones = {
    'Usabilidad': [
      {
        'titulo': '¿Qué tan fácil fue navegar a través de la aplicación?',
        'valor': 0,
        'min': '0 estrellas: Fue muy difícil encontrar las funcionalidades.',
        'max': '5 estrellas: Navegación intuitiva y sin complicaciones.',
      },
      {
        'titulo':
            '¿Pudiste completar tus tareas en la aplicación sin problemas?',
        'valor': 0,
        'min': '0 estrellas: No pude completar las tareas.',
        'max': '5 estrellas: Pude completar todas las tareas eficientemente.',
      },
      {
        'titulo':
            '¿Cómo calificas la interfaz gráfica en términos de diseño y claridad?',
        'valor': 0,
        'min': '0 estrellas: Poco clara y difícil de entender.',
        'max': '5 estrellas: Clara, atractiva y facilita el uso.',
      },
    ],
    'Contenido': [
      {
        'titulo': '¿El contenido de la aplicación fue útil para ti?',
        'valor': 0,
        'min': '0 estrellas: No fue relevante ni útil.',
        'max': '5 estrellas: Muy útil y relevante.',
      },
      {
        'titulo': '¿Qué tan bien el contenido se adapta a tus expectativas?',
        'valor': 0,
        'min': '0 estrellas: No cumplió mis expectativas.',
        'max': '5 estrellas: Superó completamente mis expectativas.',
      },
      {
        'titulo':
            '¿El contenido está presentado de manera clara y comprensible?',
        'valor': 0,
        'min': '0 estrellas: Mal estructurado o confuso.',
        'max': '5 estrellas: Muy bien presentado y fácil de comprender.',
      },
    ],
    'Compartir': [
      {
        'titulo': '¿Qué tan probable es que recomiendes esta aplicación?',
        'valor': 0,
        'min': '0 estrellas: No la recomendaría en absoluto.',
        'max': '5 estrellas: Definitivamente la recomendaría.',
      },
      {
        'titulo': '¿Cómo te sentirías al compartir esta app con alguien más?',
        'valor': 0,
        'min': '0 estrellas: No me sentiría cómodo.',
        'max': '5 estrellas: Me sentiría muy cómodo.',
      },
      {
        'titulo': '¿Crees que esta app podría ser útil para personas cercanas?',
        'valor': 0,
        'min': '0 estrellas: No creo que sea útil.',
        'max': '5 estrellas: Estoy seguro de que sería muy útil.',
      },
    ],
  };

  void _compartirRespuestas() {
    final nombre = _nombreController.text.trim();
    String buffer = 'Encuesta de feedback de 11Sync\n';
    if (nombre.isNotEmpty) {
      buffer += 'Nombre: $nombre\n';
    }
    _secciones.forEach((seccion, preguntas) {
      buffer += '\n[$seccion]\n';
      for (final p in preguntas) {
        buffer += '- ${p['titulo']}: ${p['valor']} estrella(s)\n';
      }
    });
    Share.share(buffer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Encuesta de satisfacción')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Tu nombre (opcional):'),
          TextField(
            controller: _nombreController,
            decoration: const InputDecoration(hintText: 'Ej: Juan Pérez'),
          ),
          const SizedBox(height: 20),
          ..._secciones.entries.map((entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.key,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ...entry.value.asMap().entries.map((q) {
                  final pregunta = q.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pregunta['titulo'],
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
                      Slider(
                        min: 0,
                        max: 5,
                        divisions: 5,
                        value: (pregunta['valor'] as int).toDouble(),
                        label: pregunta['valor'].toString(),
                        onChanged: (val) {
                          setState(() => pregunta['valor'] = val.toInt());
                        },
                      ),
                      Text(
                        pregunta['min'],
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Text(
                        pregunta['max'],
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                }),
              ],
            );
          }),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _compartirRespuestas,
            icon: const Icon(Icons.share),
            label: const Text('Compartir respuestas'),
          ),
        ],
      ),
    );
  }
}
