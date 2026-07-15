import 'package:bookia/features/home/domain/entities/book_entity.dart';

abstract class HomeRepository {
  Future<List<BookEntity>> getBook();
  Future<BookEntity> getBookDetails(int id);
}