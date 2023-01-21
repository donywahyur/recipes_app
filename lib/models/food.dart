class Food {
  final String id;
  final String title;
  final String category;
  final List<String> ingredients;
  final int duration;
  final String imageUrl;

  Food({
    required this.id,
    required this.title,
    required this.category,
    required this.ingredients,
    required this.duration,
    required this.imageUrl,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      ingredients: List<String>.from(json['ingredients']),
      duration: json['duration'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'ingredients': ingredients,
      'duration': duration,
      'imageUrl': imageUrl,
    };
  }
}
