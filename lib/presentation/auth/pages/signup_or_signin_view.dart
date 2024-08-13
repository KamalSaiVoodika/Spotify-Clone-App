import 'package:avis/common/helpers/is_dark_mode.dart';
import 'package:avis/common/widgets/appbar/app_bar.dart';
import 'package:avis/common/widgets/buttons/basic_app_button.dart';
import 'package:avis/core/config/assets/app_images.dart';
import 'package:avis/core/config/assets/app_vectors.dart';
import 'package:avis/core/config/theme/app_colors.dart';
import 'package:avis/presentation/auth/pages/signin_view.dart';
import 'package:avis/presentation/auth/pages/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignupOrSigninView extends StatelessWidget {
  const SignupOrSigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const BasicAppBar(),
        Align(
          alignment: Alignment.topRight,
          child: SvgPicture.asset(AppVectors.unioneTwo),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: SvgPicture.asset(AppVectors.unionOne),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset(AppImages.loginBg),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(AppVectors.logo),
                const SizedBox(
                  height: 21,
                ),
                const Text(
                  'Enjoy Listening To Music',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 21,
                ),
                const Text(
                  'Spotify is a proprietary Swedish audio streaming and media services provider ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: AppColors.grey),
                ),
                const SizedBox(
                  height: 21,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 1,
                        child: BasicAppButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => SignupView(),
                                ),
                              );
                            },
                            title: 'Register')),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SigninView(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: context.isDarkMode
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
