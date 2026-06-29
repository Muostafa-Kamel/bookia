class LoginRequestModel {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  LoginRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String,dynamic> addLoginDataToMap(){
    return {
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }
}
