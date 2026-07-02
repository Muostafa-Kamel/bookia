import 'package:bookia/features/auth/data/data_source/remote_data_source.dart';
import 'package:bookia/features/auth/data/models/login_request_model.dart';
import 'package:bookia/features/auth/data/models/register_request_model.dart';
import 'package:bookia/features/auth/domain/entities/user_entity.dart';
import 'package:bookia/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserEntity> login({
    required String email,
    required String password,
  }) async {
    return await remoteDataSource.login(
      LoginRequestModel(email: email, password: password),
    );
  }

  @override
  Future<UserEntity> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    return await remoteDataSource.register(
      RegisterRequestModel(
        email: email,
        password: password,
        name: name,
        passwordConfirmation: passwordConfirmation,
      ),
    );
  }
}
