class RegisterRequestModel {
  final String email;
  final String name;
  final String password;
  final String passwordConfirmation;

  RegisterRequestModel({
    required this.email,
    required this.password,
    required this.name,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> addRegisterDataToMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }
}
