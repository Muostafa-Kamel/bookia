class BookEntity {
  final int id;
  final String title;
  final String description;
  final String category;
  final String imageUrl;
  final String price;

  BookEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
  });
}
