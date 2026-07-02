import 'package:bookia/core/thems/app_colors.dart';
import 'package:bookia/core/widgets/reusable_button.dart';
import 'package:bookia/features/auth/data/data_source/remote_data_source.dart';
import 'package:bookia/features/auth/data/repository_impl/auth_repository_impl.dart';
import 'package:bookia/features/auth/domain/use_cases/login_use_case.dart';
import 'package:bookia/features/auth/domain/use_cases/register_use_case.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_states.dart';
import 'package:bookia/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/reusable_card.dart';
import '../../../../core/widgets/reusable_text_form_f.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController controllerEmail = TextEditingController();
    final TextEditingController controllerPassword = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: BlocProvider(
        create: (BuildContext context) =>
            AuthCubit(
              registerUseCase: RegisterUseCase(
                AuthRepositoryImpl(AuthRemoteDataSource()),
              ),
              loginUseCase: LoginUseCase(
                AuthRepositoryImpl(AuthRemoteDataSource()),
              ),
            ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: .start,
              crossAxisAlignment: .start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios),
                ),
                SizedBox(height: 10),
                Text(
                  "Welcome back! Glad\nto see you, Again!",
                  style: TextStyle(
                    fontFamily: "GoogleFonts",
                    color: AppColors.darkFontColor,
                    fontSize: 20,
                    fontWeight: .w400,
                  ),
                ),
                SizedBox(height: 32),
                ReusableTextFormF(
                  controller: controllerEmail,
                  hint: "Enter your email",
                  securedText: false,
                ),
                SizedBox(height: 15),
                ReusableTextFormF(
                  controller: controllerPassword,
                  hint: "Enter your password",
                  securedText: true,
                ),
                SizedBox(height: 5),
                Text(
                  "Forget Password?",
                  style: TextStyle(
                    color: Colors.blue,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(height: 32),
                BlocConsumer<AuthCubit, AuthStates>(
                  listener: (context, state) {
                    if (state is AuthSuccessState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.message,)));
                    }
                    if (state is AuthErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.error,)));
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoadingState) {
                      return const CircularProgressIndicator(
                        color: Colors.red,);
                    }
                    return ReusableButton(
                      title: "Login",
                      buttonBGColor: AppColors.primaryColor,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().login(
                            email: controllerEmail.text.trim(),
                            password: controllerPassword.text.trim(),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                          controllerEmail.clear();
                          controllerPassword.clear();
                        }

                      },
                      titleColor: AppColors.whiteFontColor,
                    );
                  },
                ),
                SizedBox(height: 10),
                Center(
                  child: Column(
                    children: [
                      Text("Or", style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10),
                      ReusableCard(
                        iconPath: "assets/images/google.png",
                        title: "Sign in with Google",
                      ),
                      SizedBox(height: 15),
                      ReusableCard(
                        iconPath: "assets/images/apple-logo.png",
                        title: "Sign in with Apple",
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: .center,
                        children: [
                          Text("Don’t have an account? "),
                          Text(
                            " Register Now",
                            style: TextStyle(color: AppColors.primaryColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
