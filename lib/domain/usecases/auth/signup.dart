import 'package:avis/core/usecase/usecase.dart';
import 'package:avis/data/models/auth/create_user_req.dart';
import 'package:avis/domain/repository/auth/auth.dart';
import 'package:avis/service_locator.dart';
import 'package:dartz/dartz.dart';

class SignupUsecase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) {
    return sl<AuthRepository>().signup(params!);
  }
}
