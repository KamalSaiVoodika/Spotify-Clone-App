import 'package:avis/data/models/auth/create_user_req.dart';
import 'package:avis/data/models/auth/signin_user_req.dart';
import 'package:avis/domain/entities/auth/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> signin(SigninUserReq signinUserReq);
}
