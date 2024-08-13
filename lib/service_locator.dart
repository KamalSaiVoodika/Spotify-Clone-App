import 'package:avis/data/repository/auth/auth_repository_impl.dart';
import 'package:avis/data/sources/auth/auth_firebase_service.dart';
import 'package:avis/data/sources/song/song_firebase_service.dart';
import 'package:avis/domain/repository/auth/auth.dart';
import 'package:avis/domain/usecases/auth/signin.dart';
import 'package:avis/domain/usecases/auth/signup.dart';
import 'package:avis/domain/usecases/song/song_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initilazeDependencies() async {
  //services
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );

  sl.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceImpl(),
  );

  //usecases

  sl.registerSingleton<SignupUsecase>(
    SignupUsecase(),
  );

  sl.registerSingleton<SigninUseCase>(
    SigninUseCase(),
  );

  sl.registerSingleton<SongUsecase>(
    SongUsecase(),
  );
}
