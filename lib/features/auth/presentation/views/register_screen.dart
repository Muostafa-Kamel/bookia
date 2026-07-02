import 'package:bookia/core/widgets/reusable_button.dart';
import 'package:bookia/core/widgets/reusable_text_form_f.dart';
import 'package:bookia/features/auth/data/data_source/remote_data_source.dart';
import 'package:bookia/features/auth/data/repository_impl/auth_repository_impl.dart';
import 'package:bookia/features/auth/domain/use_cases/register_use_case.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/thems/app_colors.dart';
import '../../domain/use_cases/login_use_case.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerName = TextEditingController();
    final TextEditingController controllerEmail = TextEditingController();
    final TextEditingController controllerPassword = TextEditingController();
    final TextEditingController controllerPasswordConfirmation =
    TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: BlocProvider(
        create: (context) =>
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
                  "Hello! Register to get\nstarted",
                  style: TextStyle(
                    fontFamily: "GoogleFonts",
                    color: AppColors.darkFontColor,
                    fontSize: 20,
                    fontWeight: .w400,
                  ),
                ),
                SizedBox(height: 32),
                ReusableTextFormF(controller: controllerName, hint: "Username",securedText: false,),
                SizedBox(height: 13),
                ReusableTextFormF(controller: controllerEmail, hint: "Email",securedText: false,),
                SizedBox(height: 13),
                ReusableTextFormF(
                  controller: controllerPassword,
                  hint: "Password",
                  securedText: true,
                ),
                SizedBox(height: 13),
                ReusableTextFormF(
                  controller: controllerPasswordConfirmation,
                  hint: "Confirm Password",
                  securedText: true,
                ),
                SizedBox(height: 30),
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
                      title: "Register",
                      buttonBGColor: AppColors.primaryColor,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().register(
                              name: controllerName.text.trim(),
                              email: controllerEmail.text.trim(),
                              password: controllerPassword.text.trim(),
                              passwordConfirmation: controllerPasswordConfirmation
                                  .text.trim());
                          controllerName.clear();
                          controllerEmail.clear();
                          controllerPassword.clear();
                          controllerPasswordConfirmation.clear();
                          Navigator.pop(context);
                        }
                      },
                      titleColor: Colors.white,
                    );
                  },

                ),
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text("Already have an account? "),
                    Text(
                      "Login Now",
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
