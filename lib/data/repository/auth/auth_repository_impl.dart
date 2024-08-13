import 'package:avis/data/models/auth/create_user_req.dart';
import 'package:avis/data/models/auth/signin_user_req.dart';
import 'package:avis/data/sources/auth/auth_firebase_service.dart';
import 'package:avis/domain/repository/auth/auth.dart';
import 'package:avis/service_locator.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }

  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await sl<AuthFirebaseService>().signin(signinUserReq);
  }
}
