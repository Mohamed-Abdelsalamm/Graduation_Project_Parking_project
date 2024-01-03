import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:parking/core/utils/app_router.dart';
import 'package:parking/core/utils/colors_styles.dart';
import 'package:parking/core/utils/custom_snack_bar.dart';
import 'package:parking/core/utils/text_styles.dart';
import 'package:parking/core/widgets/custom_button.dart';
import 'package:parking/core/widgets/custom_text_form_field.dart';
import 'package:parking/featuers/authentication/presentation/manager/login_cubit/login_cubit.dart';
import 'package:parking/featuers/authentication/presentation/manager/login_cubit/login_states.dart';
import 'package:parking/generated/assets.dart';
import 'package:string_validator/string_validator.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginSuccess) {
          await GoRouter.of(context).push(AppRouter.kHomeView);
          emailController.clear();
          passwordController.clear();
          loading = false;
          if (context.mounted) {
            CustomSnackBar.showCustomSnackBar(
              context,
              state.successMessage,
            );
          }
        } else if (state is LoginFailure) {
          loading = false;
          CustomSnackBar.showCustomSnackBar(
            context,
            state.errorMessage,
          );
        } else if (state is LoginLoading) {
          loading = true;
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: loading,
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.all(16.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 200.h,
                      ),
                      Text(
                        'Login to your',
                        style: TextStyles().textStyle30Bold,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        'Account',
                        style: TextStyles()
                            .textStyle30Bold
                            .copyWith(color: ColorStyles.blue700),
                      ),
                      SizedBox(
                        height: 48.h,
                      ),
                      CustomTextFormField(
                        hintText2: 'Email',
                        textEditingController: emailController,
                        prefixIcon: SvgPicture.asset(
                          Assets.svgEmail,
                          color: ColorStyles.grey,
                          width: 16.w,
                          height: 16.w,
                        ),
                        validator: (value) {
                          return isEmail(value ?? "")
                              ? null
                              : "Invalid email format!";
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        hintText2: 'Password',
                        textEditingController: passwordController,
                        prefixIcon: SvgPicture.asset(
                          Assets.svgLock,
                          color: ColorStyles.grey,
                          width: 16.w,
                          height: 16.w,
                        ),
                        obscureText: true,
                        suffixIcon: SvgPicture.asset(
                          Assets.svgShowPassword,
                          color: ColorStyles.grey,
                          width: 16.w,
                          height: 16.w,
                        ),
                        validator: (value) {
                          return value == null ||
                                  value.isEmpty ||
                                  value.length < 6
                              ? "Password cann't be less than 6 characters."
                              : null;
                        },
                      ),
                      SizedBox(
                        height: 48.h,
                      ),
                      CustomButton(
                        title: 'Sign In',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context).login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Forgot the password?',
                              style: TextStyles()
                                  .textStyle12Bold
                                  .copyWith(color: ColorStyles.blue700),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 100.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyles()
                                .textStyle12Bold
                                .copyWith(color: ColorStyles.grey500),
                          ),
                          Text(
                            "Sign Up",
                            style: TextStyles()
                                .textStyle12Bold
                                .copyWith(color: ColorStyles.blue700),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      )
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
