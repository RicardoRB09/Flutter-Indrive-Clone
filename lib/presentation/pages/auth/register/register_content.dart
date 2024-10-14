import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone/presentation/pages/auth/register/bloc/register_bloc.dart';
import 'package:indriver_clone/presentation/pages/auth/register/bloc/register_event.dart';
import 'package:indriver_clone/presentation/pages/auth/register/bloc/register_state.dart';
import 'package:indriver_clone/presentation/utils/bloc_form_item.dart';
import 'package:indriver_clone/presentation/widgets/custom_button.dart';
import 'package:indriver_clone/presentation/widgets/custom_text_field_outline.dart';

class RegisterContent extends StatelessWidget {
  final RegisterState? state;

  const RegisterContent({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    Color darkGrey = const Color(0xFF4B4B4B);
    Color lightGrey = const Color(0XFFCECECE);

    return Form(
      key: state?.formKey,
      child: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.topCenter,
                stops: const [0.2, 0.9],
                colors: [
                  darkGrey,
                  lightGrey,
                ],
              ),
            ),
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _textLoginRotated(context),
                const SizedBox(height: 56),
                _textRegisterRotated(context),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 64, bottom: 48),
            decoration: BoxDecoration(
              color: lightGrey,
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                stops: const [0.1, 0.9],
                colors: [
                  darkGrey,
                  lightGrey,
                ],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                bottomLeft: Radius.circular(40),
              ),
            ),
            child: Stack(
              children: [
                _imageBackground(context),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 24, right: 24, top: 64),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _textRegister(),
                        CustomTextFieldOutline(
                          text: 'Name',
                          icon: Icons.person_outlined,
                          margin: const EdgeInsets.only(top: 32, bottom: 8),
                          onChanged: (text) {
                            context.read<RegisterBloc>().add(
                                  NameChanged(
                                    name: BlocFormItem(value: text),
                                  ),
                                );
                          },
                          validator: (value) {
                            return context
                                .read<RegisterBloc>()
                                .state
                                .name
                                .error;
                          },
                        ),
                        CustomTextFieldOutline(
                          text: 'Lastname',
                          icon: Icons.person_2_outlined,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          onChanged: (text) {
                            context.read<RegisterBloc>().add(
                                  LastNameChanged(
                                    lastName: BlocFormItem(value: text),
                                  ),
                                );
                          },
                          validator: (value) {
                            return context
                                .read<RegisterBloc>()
                                .state
                                .lastName
                                .error;
                          },
                        ),
                        CustomTextFieldOutline(
                          text: 'Email',
                          icon: Icons.email_outlined,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          onChanged: (text) {
                            context.read<RegisterBloc>().add(
                                  EmailChanged(
                                    email: BlocFormItem(value: text),
                                  ),
                                );
                          },
                          validator: (value) {
                            return state?.email.error;
                          },
                        ),
                        CustomTextFieldOutline(
                          text: 'Phone',
                          icon: Icons.phone_outlined,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          onChanged: (text) {
                            context.read<RegisterBloc>().add(
                                  PhoneChanged(
                                    phone: BlocFormItem(value: text),
                                  ),
                                );
                          },
                          validator: (value) {
                            return context
                                .read<RegisterBloc>()
                                .state
                                .phone
                                .error;
                          },
                        ),
                        CustomTextFieldOutline(
                          text: 'Password',
                          icon: Icons.lock_outline,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          onChanged: (text) {
                            context.read<RegisterBloc>().add(
                                  PasswordChanged(
                                    password: BlocFormItem(value: text),
                                  ),
                                );
                          },
                          validator: (value) {
                            return context
                                .read<RegisterBloc>()
                                .state
                                .password
                                .error;
                          },
                        ),
                        CustomTextFieldOutline(
                          text: 'Confirm Password',
                          icon: Icons.lock_outline,
                          margin: const EdgeInsets.only(top: 8, bottom: 32),
                          onChanged: (text) {
                            context.read<RegisterBloc>().add(
                                  ConfirmPasswordChanged(
                                    confirmPassword: BlocFormItem(value: text),
                                  ),
                                );
                          },
                          validator: (value) {
                            return context
                                .read<RegisterBloc>()
                                .state
                                .confirmPassword
                                .error;
                          },
                        ),
                        CustomButton(
                          text: 'Create User',
                          onPressed: () {
                            if (state!.formKey!.currentState!.validate()) {
                              context.read<RegisterBloc>().add(FormSubmit());
                              // context.read<RegisterBloc>().add(FormReset());
                            }
                          },
                        ),
                        _textOr(),
                        _textAlreadyHaveAccount(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textRegister() {
    return const Text(
      'Register',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF4B4B4B),
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/img/car_pin.png',
        opacity: const AlwaysStoppedAnimation(0.2),
        scale: 0.5,
      ),
    );
  }

  Widget _textAlreadyHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account? ',
          style: TextStyle(
            fontSize: 12,
            color: Color(0XFFCECECE),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.popAndPushNamed(context, 'login');
          },
          child: const Text(
            'Login',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0XFFCECECE),
            ),
          ),
        ),
      ],
    );
  }

  _textOr() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 20,
            height: 1,
            color: const Color(0XFFCECECE),
          ),
          const Text(
            ' OR ',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0XFFCECECE),
            ),
          ),
          Container(
            width: 20,
            height: 1,
            color: const Color(0XFFCECECE),
          ),
        ],
      ),
    );
  }

  // Widget _imageBanner() {
  //   return Container(
  //     margin: const EdgeInsets.only(top: 48),
  //     width: double.infinity,
  //     height: 176,
  //     child: Image.asset('assets/img/car_white.png'),
  //   );
  // }

  Widget _textLoginRotated(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.popAndPushNamed(context, 'login');
      },
      child: const RotatedBox(
        quarterTurns: 1,
        child: Text(
          'Login',
          style: TextStyle(
            color: Color(0XFFCECECE),
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  Widget _textRegisterRotated(BuildContext context) {
    return const RotatedBox(
      quarterTurns: 1,
      child: Text(
        'Register',
        style: TextStyle(
          color: Color(0XFFCECECE),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
