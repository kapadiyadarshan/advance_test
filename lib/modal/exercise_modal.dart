class ExcerciseModal {
  String name;
  String type;
  String muscle;
  String equipment;
  String difficulty;
  String instructions;

  ExcerciseModal({
    required this.name,
    required this.type,
    required this.muscle,
    required this.equipment,
    required this.difficulty,
    required this.instructions,
  });

  factory ExcerciseModal.fromMap({required Map data}) {
    return ExcerciseModal(
      name: data["name"],
      type: data["type"],
      muscle: data["muscle"],
      equipment: data["equipment"],
      difficulty: data["difficulty"],
      instructions: data["instructions"],
    );
  }
}
