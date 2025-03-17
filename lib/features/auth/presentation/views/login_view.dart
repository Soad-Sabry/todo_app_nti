import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/helper/my_navigator.dart';
import 'package:todo/core/utils/image_asset.dart';
import 'package:todo/core/widgets_core/btn_widgets.dart';
import 'package:todo/features/auth/presentation/views/register_view.dart';

import '../../../../core/localization/app_strings.dart';
import '../../../../core/widgets_core/custom_text_form_field.dart';
import '../../../home/views/home_view.dart';
import '../../manager/auth_cubit.dart';
import '../../manager/auth_state.dart';
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoginSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Login Successful!")));
          // Navigate to home screen
          MyNavigator.navigateTo(HomeView());
         } else if (state is AuthLoginError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);

        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height*.4,
                  child: Image.asset(ImageAsset.flagUrl, fit: BoxFit.cover),
                ),
                const SizedBox(height: 20),

                // Username Input
                CustomTextFormField(hintText:AppStrings.hintUserName,controller: AuthCubit.get(context).usernameController,),
                const SizedBox(height: 15),
                CustomTextFormField(hintText:AppStrings.password,controller: AuthCubit.get(context).passwordController,),

                const SizedBox(height: 20),
                BtnWidgets(text: AppStrings.login, onTap: state is AuthLoginLoading
                    ? null
                    : () {
                  cubit.onLoginPressed();
                },),

                // Register Prompt
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      AppStrings.noHaveAccount,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        MyNavigator.navigateTo( RegisterView());
                      },
                      child: const Text(
                      AppStrings.register,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

