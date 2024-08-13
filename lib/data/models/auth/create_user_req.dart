class CreateUserReq {
  String fullName;
  String email;
  String password;
  CreateUserReq({
    required this.email,
    required this.fullName,
    required this.password,
  });
}
