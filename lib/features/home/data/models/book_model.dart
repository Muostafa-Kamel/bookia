import 'package:bookia/features/home/domain/entities/book_entity.dart';

class BookModel extends BookEntity {
  BookModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.category,
    required super.imageUrl,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json["id"] is int
          ? json["id"]
          : int.tryParse(json["id"]?.toString() ?? "") ?? 0,
      title: json['title']?.toString() ?? json['name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      price: json['price']?.toString() ?? '0 \$',
      category: json['category']?.toString() ?? '',
      imageUrl: json['image']?.toString() ?? '',
    );
  }

  Map<String,dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'image': imageUrl,
    };
  }
}
