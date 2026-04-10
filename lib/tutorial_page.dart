import 'package:flutter/material.dart';
import 'steps_data.dart';
import 'tutorial_step.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({super.key});

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  // Controlador del PageView para navegar entre pasos
  final PageController _controller = PageController();
  int _currentIndex = 0; // Índice del paso actual

  @override
  void dispose() {
    _controller.dispose(); // Libera el controlador al salir
    super.dispose();
  }

  // Navega al paso siguiente si no es el último
  void _next() {
    if (_currentIndex < tutorialSteps.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // Navega al paso anterior si no es el primero
  void _prev() {
    if (_currentIndex > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E), // Fondo oscuro temático RPG
      appBar: AppBar(
        backgroundColor: const Color(0xFF16213E),
        title: const Text(
          '⚔️ ShinyVillage — Tutorial',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Indicador de progreso (puntos)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                tutorialSteps.length,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: i == _currentIndex ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: i == _currentIndex
                        ? Colors.amber
                        : Colors.white24,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),

          // Área deslizable con los pasos del tutorial
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: tutorialSteps.length,
              onPageChanged: (i) => setState(() => _currentIndex = i),
              itemBuilder: (context, index) {
                return _StepCard(step: tutorialSteps[index]);
              },
            ),
          ),

          // Botones de navegación
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Botón anterior (oculto en el primer paso)
                _currentIndex > 0
                    ? ElevatedButton.icon(
                        onPressed: _prev,
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Anterior'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white12,
                          foregroundColor: Colors.white,
                        ),
                      )
                    : const SizedBox(width: 110),

                // Texto de paso actual
                Text(
                  '${_currentIndex + 1} / ${tutorialSteps.length}',
                  style: const TextStyle(color: Colors.white54),
                ),

                // Botón siguiente / Finalizar en el último paso
                ElevatedButton.icon(
                  onPressed: _currentIndex < tutorialSteps.length - 1
                      ? _next
                      : null, // Desactivado al llegar al final
                  icon: Icon(
                    _currentIndex < tutorialSteps.length - 1
                        ? Icons.arrow_forward
                        : Icons.check,
                  ),
                  label: Text(
                    _currentIndex < tutorialSteps.length - 1
                        ? 'Siguiente'
                        : '¡Listo!',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget para la tarjeta de cada paso del tutorial
class _StepCard extends StatelessWidget {
  final TutorialStep step;

  const _StepCard({required this.step});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Card(
        color: const Color(0xFF0F3460),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icono grande representativo
              Text(step.icon, style: const TextStyle(fontSize: 64)),
              const SizedBox(height: 20),

              // Título del paso
              Text(
                step.title,
                style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Descripción de la mecánica
              Text(
                step.description,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // Caja de consejo (tip)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.amber.withOpacity(0.3)),
                ),
                child: Text(
                  step.tip,
                  style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}