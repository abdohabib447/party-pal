import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:party_pal2/peresentation/bloc/auth_bloc.dart';
import 'package:party_pal2/peresentation/pages/sign_in_page.dart';
import '../../core/constants/theme/app_localizations.dart';

class SignUpPage extends StatelessWidget {
  static const String routeName = 'sign up';

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
                      // Create an Account
                      FadeInDown(
                        duration: Duration(milliseconds: 600),
                        child: Text(
                          text.translate('create_account'),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF333333),
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Join to cherish the little moments
                      FadeIn(
                        duration: Duration(milliseconds: 200),
                        child: Text(
                          text.translate('join_moments'),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF666666),
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Full Name Field
                      SlideInUp(
                        duration: Duration(milliseconds: 500),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: text.translate('full_name'),
                            labelStyle: const TextStyle(
                              color: Color(0xFF666666),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFFDDDDDD),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 18,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Email Field
                      SlideInUp(
                        duration: Duration(milliseconds: 400),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: text.translate('email') ,
                            labelStyle: const TextStyle(
                              color: Color(0xFF666666),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFFDDDDDD),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 18,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Password Field
                      SlideInUp(
                        duration: Duration(milliseconds: 300),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: text.translate('password') ,
                            labelStyle: const TextStyle(
                              color: Color(0xFF666666),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFFDDDDDD),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 18,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Confirm Password Field
                      SlideInUp(
                        duration: Duration(milliseconds: 250),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: text.translate('confirm_password'),
                            labelStyle: const TextStyle(
                              color: Color(0xFF666666),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFFDDDDDD),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 18,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Terms and Privacy Policy
                      FadeIn(
                        duration: Duration(milliseconds: 200),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF666666),
                            ),
                            children: [
                              TextSpan(text: ('by signing up')),
                              TextSpan(
                                text: ('terms of service'),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(text: ' and '),
                              TextSpan(
                                text: ('privacy policy'),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Sign Up Button
                      BounceInUp(
                        child: BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: state is AuthLoading
                                  ? null
                                  : () {
                                      context.read<AuthBloc>().add(
                                        SignUpPressed(),
                                      );
                                    },
                              child: state is AuthLoading
                                  ? const CircularProgressIndicator()
                                  : Text(text.translate('sign_up')),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Already have an account? Sign In
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            text.translate('already_have'),
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                SignInPage.routeName,
                              );
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(50, 30),
                            ),
                            child: FadeIn(
                              duration: Duration(milliseconds: 400),
                              child: Text(
                                text.translate('sign_in'),
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(color: Colors.amber),
                              ),
                            ),
                          ),
                        ],
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
}
