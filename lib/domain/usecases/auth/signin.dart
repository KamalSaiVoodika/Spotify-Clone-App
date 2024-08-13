import 'package:avis/core/usecase/usecase.dart';
import 'package:avis/data/models/auth/signin_user_req.dart';
import 'package:avis/domain/repository/auth/auth.dart';
import 'package:avis/service_locator.dart';
import 'package:dartz/dartz.dart';

class SigninUseCase implements UseCase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) {
    return sl<AuthRepository>().signin(params!);
  }
}
