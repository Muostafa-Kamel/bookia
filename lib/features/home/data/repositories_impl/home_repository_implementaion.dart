import 'package:bookia/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:bookia/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImplementation extends HomeRepository{

  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImplementation(this.remoteDataSource);

  @override
  Future<List<BookEntity>> getBook() {
    return remoteDataSource.getBooks();
  }

  @override
  Future<BookEntity> getBookDetails(int id) {
    return remoteDataSource.getBookDetails(id);
  }

}