import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';
import 'package:party_pal2/peresentation/pages/home_page.dart';
import 'package:party_pal2/peresentation/pages/sign_up_page.dart';
import '../../core/constants/theme/app_localizations.dart';
import '../bloc/auth_bloc.dart';
import 'forgot_password_page.dart';

class SignInPage extends StatelessWidget {
  static const String routeName = 'sign in';

  ///
  /// i love programming....
  /// someday i will back
  ///
  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white54, Colors.white38],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white.withOpacity(0.95),
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      /// ===== Welcome Back =====
                      FadeInDown(
                        duration: const Duration(milliseconds: 600),
                        child: Text(
                          text.translate('welcome_back'),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF333333),
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// ===== Subtitle =====
                      FadeIn(
                        delay: const Duration(milliseconds: 200),
                        child: Text(
                          text.translate('sign_in_continue'),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF666666),
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      /// ===== Email Field =====
                      SlideInUp(
                        duration: const Duration(milliseconds: 500),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: text.translate('email'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// ===== Password Field =====
                      SlideInUp(
                        delay: const Duration(milliseconds: 150),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: text.translate('password'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      /// ===== Sign In Button =====
                      BounceInUp(
                        child: BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: () {
                                context.read<AuthBloc>().add(LoginPressed());
                                Navigator.pushNamed(
                                  context,
                                  PartyPalHomeScreen.routeName,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 18,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: state is AuthLoading
                                  ? const SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      text.translate('sign_in'),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 16),

                      /// ===== Forgot Password =====
                      FadeIn(
                        delay: const Duration(milliseconds: 300),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              ForgetPassWord.routeName,
                            );
                          },
                          child: Text(text.translate('forgot_password')),
                        ),
                      ),

                      const SizedBox(height: 24),

                      /// ===== Sign Up =====
                      FadeInUp(
                        delay: const Duration(milliseconds: 400),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              text.translate('no_account'),
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  SignUpPage.routeName,
                                );
                              },
                              child: Text(
                                text.translate('sign_up'),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String howToBeHappy(String beAlone) {
    return beAlone == "alone" ? "u will be happy" : "u will not happy";
  }
}
