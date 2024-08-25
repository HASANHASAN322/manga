class TeamModel {
  final String author;
  final String drawer;
  final String characterDesigner;

  TeamModel({
    required this.author,
    required this.drawer,
    this.characterDesigner = '',
  });

  /// Convert the TeamModel to JSON format
  Map<String, dynamic> toJson() {
    return {
      'Author': author,
      'Drawer': drawer,
      'CharacterDesigner': characterDesigner,
    };
  }

  /// Create a TeamModel instance from JSON
  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      author: json['Author'],
      drawer: json['Drawer'],
      characterDesigner: json['CharacterDesigner'] ?? '', // Handle null value with default empty string
    );
  }
}
