import 'package:avis/common/widgets/appbar/app_bar.dart';
import 'package:avis/common/widgets/buttons/basic_app_button.dart';
import 'package:avis/core/config/assets/app_vectors.dart';
import 'package:avis/core/config/theme/app_colors.dart';
import 'package:avis/data/models/auth/create_user_req.dart';
import 'package:avis/domain/usecases/auth/signup.dart';
import 'package:avis/presentation/auth/pages/signin_view.dart';
import 'package:avis/presentation/home/pages/home_view.dart';
import 'package:avis/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Register',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Full Name',
                  ),
                  controller: fullName,
                ),
                const SizedBox(
                  height: 12,
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Enter Email',
                  ),
                  controller: email,
                ),
                const SizedBox(
                  height: 12,
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Enter Password',
                  ),
                  controller: password,
                ),
                const SizedBox(
                  height: 12,
                ),
                BasicAppButton(
                    onPressed: () async {
                      var result = await sl<SignupUsecase>().call(
                        params: CreateUserReq(
                            email: email.text,
                            fullName: fullName.text,
                            password: password.text),
                      );

                      result.fold(
                        (l) {
                          var snackbar = SnackBar(content: Text(l));
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        },
                        (r) {
                          var snackbar = SnackBar(
                            content: Text(r),
                            behavior: SnackBarBehavior.floating,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomeView(),
                            ),
                            (route) => false,
                          );
                        },
                      );
                    },
                    title: 'Create Account'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Do you have an account?',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SigninView(),
                      ),
                    );
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: AppColors.primary),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
