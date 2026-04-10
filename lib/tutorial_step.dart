// Modelo que representa cada paso del tutorial
class TutorialStep {
  final String title;       // Título del paso
  final String description; // Explicación de la mecánica
  final String icon;        // Emoji representativo (sin assets externos)
  final String tip;         // Consejo rápido

  const TutorialStep({
    required this.title,
    required this.description,
    required this.icon,
    required this.tip,
  });
}