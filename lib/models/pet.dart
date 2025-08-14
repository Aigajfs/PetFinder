class Pet {
  final String id;
  final String name;
  final String category;
  final String breed;
  final String age;
  final String gender;
  final String weight;
  final String description;
  final String imageUrl;
  final String addedOn;
  bool isAvailable;

  Pet({
    required this.id,
    required this.name,
    required this.category,
    required this.breed,
    required this.age,
    required this.gender,
    required this.weight,
    required this.description,
    required this.imageUrl,
    required this.addedOn,
    this.isAvailable = true,
  });
}