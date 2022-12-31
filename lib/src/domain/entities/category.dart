class Category {
  Category({
    required this.name,
  });

  final String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["strCategory"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
