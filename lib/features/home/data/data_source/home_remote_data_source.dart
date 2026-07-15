
import 'package:bookia/core/constant/api_constant.dart';
import 'package:bookia/features/home/data/models/book_model.dart';
import 'package:dio/dio.dart';

class HomeRemoteDataSource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConstant.apiUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  Future<List<BookModel>> getBooks() async {
    try {
      final response = await _dio.get(
        'books',
        options: Options(headers: {'Accept': 'application/json'}),
      );
      final responseMap = response.data as Map<String, dynamic>;
      final dataList = responseMap['data'] as List<dynamic>? ?? [];
      return dataList
          .map((json) => BookModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<BookModel> getBookDetails(int id) async {
    try {
      final response = await _dio.get(
        'books/$id',
        options: Options(headers: {'Accept': 'application/json'}),
      );
      final responseMap = response.data as Map<String,dynamic>;
      final bookData = responseMap['data'] as Map<String,dynamic>;

      return BookModel.fromJson(bookData);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Exception _handleDioError (DioException e){
    if(e.response !=null){
      return Exception(e.response?.data['message'] ?? 'حدث خطأ أثناء تحميل البيانات من الخادم' );
    }
    return Exception('Network Error');
  }

}
