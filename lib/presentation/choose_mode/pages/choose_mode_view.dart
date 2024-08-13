import 'dart:ui';

import 'package:avis/common/widgets/buttons/basic_app_button.dart';
import 'package:avis/core/config/assets/app_images.dart';
import 'package:avis/core/config/assets/app_vectors.dart';
import 'package:avis/core/config/theme/app_colors.dart';
import 'package:avis/presentation/auth/pages/signup_or_signin_view.dart';
import 'package:avis/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ChooseModeView extends StatelessWidget {
  const ChooseModeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.chooseModeBg),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(AppVectors.logo),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Choose Mode',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  context
                                      .read<ThemeCubit>()
                                      .updateTheme(ThemeMode.dark);
                                },
                                child: ClipOval(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10, sigmaY: 10),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color(0xff30393c)
                                            .withOpacity(0.5),
                                      ),
                                      child: SvgPicture.asset(
                                        AppVectors.darkMode,
                                        fit: BoxFit.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                'Dark Mode',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  context
                                      .read<ThemeCubit>()
                                      .updateTheme(ThemeMode.light);
                                },
                                child: ClipOval(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10, sigmaY: 10),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color(0xff30393c)
                                            .withOpacity(0.5),
                                      ),
                                      child: SvgPicture.asset(
                                        AppVectors.lightMode,
                                        fit: BoxFit.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                'Light Mode',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      BasicAppButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SignupOrSigninView(),
                              ),
                            );
                          },
                          title: 'Continue')
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
