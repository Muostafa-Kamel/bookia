class LoginRequestModel {
  final String email;
  final String password;
 
  LoginRequestModel({
    required this.email,
    required this.password,
  });

  Map<String,dynamic> addLoginDataToMap(){
    return {
      'email': email,
      'password': password,
    };
  }
}
