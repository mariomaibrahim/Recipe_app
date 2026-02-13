class Recipe {
  final int id;
  final String name;
  final String image;
  final List<String> ingredients;
  final List<String> instructions;
  final double rating;
  final int cookTimeMinutes;

  Recipe({
    required this.id,
    required this.name,
    required this.image,
    required this.ingredients,
    required this.instructions,
    required this.rating,
    required this.cookTimeMinutes,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      image: json['image'] ?? '',
      ingredients: List<String>.from(json['ingredients'] ?? []),
      instructions: List<String>.from(json['instructions'] ?? []),
      rating: (json['rating'] is int)
          ? (json['rating'] as int).toDouble()
          : (json['rating'] is double)
          ? json['rating']
          : 0.0,
      cookTimeMinutes: json['cookTimeMinutes'] ?? 0,
    );
  }
}