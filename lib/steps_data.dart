import 'tutorial_step.dart';

// Lista de pasos basados en las mecánicas reales de ShinyVillage
const List<TutorialStep> tutorialSteps = [
  TutorialStep(
    title: 'Movimiento',
    icon: '🕹️',
    description:
        'Se utiliza WASD o las teclas de dirección para mover al personaje por el mapa. '
        'El personaje se anima automáticamente según la dirección.',
    tip: 'Tip: El movimiento usa Rigidbody2D para física suave.',
  ),
  TutorialStep(
    title: 'Recoger Ítems',
    icon: '📦',
    description:
        'Al caminar sobre un ítem del suelo, se recoge automáticamente '
        'por colisión (trigger). Se añade al inventario si hay espacio.',
    tip: 'Tip: Cada slot tiene un máximo de ítems apilables.',
  ),
  TutorialStep(
    title: 'Inventario',
    icon: '🎒',
    description:
        'Se abre y cierra el inventario con la tecla I (o el botón en pantalla). '
        'Se puede soltar un ítem haciendo clic derecho sobre su slot.',
    tip: 'Tip: El inventario tiene slots con nombre, cantidad e icono.',
  ),
  TutorialStep(
    title: 'Tiles Interactuables',
    icon: '🗺️',
    description:
        'Algunos tiles del mapa son interactuables. Al acercarse, '
        'se pueden activar. Una vez interactuados, cambian de apariencia.',
    tip: 'Tip: El TileManager gestiona qué tiles están activos.',
  ),
  TutorialStep(
    title: 'Guardar Partida',
    icon: '💾',
    description:
        'El juego guarda automáticamente el progreso usando una base de datos '
        'SQLite local. Los datos persisten entre sesiones.',
    tip: 'Tip: La DB se guarda en Application.persistentDataPath.',
  ),
];