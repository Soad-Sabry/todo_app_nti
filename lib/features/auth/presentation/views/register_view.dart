import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/localization/app_strings.dart';
import 'package:todo/core/utils/color_app.dart';
import 'package:todo/core/utils/image_asset.dart';
import 'package:todo/features/auth/presentation/views/login_view.dart';

import '../../../../core/widgets_core/btn_widgets.dart';
import '../../../../core/widgets_core/custom_text_form_field.dart';
import '../../../../generated/l10n.dart';
import '../../manager/auth_cubit.dart';
import '../../manager/auth_state.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthRegisterSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.msg)));
          // Navigate to login screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginView()),
          );
        } else if (state is AuthRegisterError) {
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
                  child: Image.asset(ImageAsset.flagUrl, fit: BoxFit.cover,height:298 ,),
                ),
                const SizedBox(height: 20),
                CustomTextFormField(hintText:S.of(context).hintUserName,controller: AuthCubit.get(context).usernameController,),
                const SizedBox(height: 15),
                CustomTextFormField(hintText:S.of(context).password,controller: AuthCubit.get(context).passwordController,),
                const SizedBox(height: 15),
                CustomTextFormField(hintText:S.of(context).passwordConfirm,controller: AuthCubit.get(context).passwordConfirmController,),

                const SizedBox(height: 20),
                BtnWidgets(text: S.of(context).register, onTap: state is AuthLoginLoading
                    ? null
                    : () {
                  cubit.onLoginPressed();
                },),

                const SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      S.of(context).haveAccount,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to Login Page
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ),
                        );
                      },
                      child:  Text(
                        S.of(context).login,
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorApp.kBlackColor_2c,
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
