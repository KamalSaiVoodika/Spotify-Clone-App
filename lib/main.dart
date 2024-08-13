import 'package:avis/core/config/theme/app_theme.dart';
import 'package:avis/firebase_options.dart';
import 'package:avis/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:avis/presentation/splash/pages/splash_view.dart';
import 'package:avis/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await initilazeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit(),
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) => MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          debugShowCheckedModeBanner: false,
          home: const SafeArea(child: SplashView()),
        ),
      ),
    );
  }
}
