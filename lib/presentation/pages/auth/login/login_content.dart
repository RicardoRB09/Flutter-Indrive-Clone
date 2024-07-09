import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:indriver_clone/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:indriver_clone/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:indriver_clone/presentation/utils/bloc_form_item.dart';
import 'package:indriver_clone/presentation/widgets/custom_button.dart';
import 'package:indriver_clone/presentation/widgets/custom_text_field.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({this.state, super.key});

  final LoginState? state;

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
            // color: const Color(0XFFCECECE),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.center,
                // stops: const [0.2, 0.9],
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
                _textLoginRotated(),
                const SizedBox(height: 56),
                _textRegisterRotated(context),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 64, bottom: 48),
            decoration: BoxDecoration(
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
            child: Container(
              margin: const EdgeInsets.only(left: 24, right: 24, top: 64),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _textWelcome('Welcome'),
                    _textWelcome('back!'),
                    const SizedBox(height: 32),
                    _imageCar(),
                    const SizedBox(height: 24),
                    _textLogin(),
                    const SizedBox(height: 24),
                    CustomTextField(
                      text: 'Email',
                      icon: Icons.email_outlined,
                      onChanged: (text) {
                        context.read<LoginBloc>().add(
                              EmailChanged(email: BlocFormItem(value: text)),
                            );
                      },
                      validator: (value) {
                        return context.read<LoginBloc>().state.email.error;
                      },
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      text: 'Password',
                      icon: Icons.lock_outline,
                      onChanged: (text) {
                        context.read<LoginBloc>().add(
                              PasswordChanged(
                                  password: BlocFormItem(value: text)),
                            );
                      },
                      validator: (value) {
                        return context.read<LoginBloc>().state.password.error;
                      },
                    ),
                    // const Spacer(),
                    SizedBox(
                      height: screenHeight * 0.2,
                    ),
                    CustomButton(
                      text: 'SIGN IN',
                      onPressed: () {
                        if (state!.formKey!.currentState!.validate()) {
                          context.read<LoginBloc>().add(FormSubmit());
                        } else {
                          print('Form invalid');
                        }

                        context.read<LoginBloc>().add(FormSubmit());
                      },
                    ),
                    const SizedBox(height: 8),
                    _textOr(),
                    const SizedBox(height: 8),
                    _textDontHaveAccount(context),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textDontHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Dont have an account? ',
          style: TextStyle(
            fontSize: 12,
            color: Color(0XFFCECECE),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'register');
          },
          child: const Text(
            'Register',
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
    return Row(
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
    );
  }

  Widget _textLogin() {
    return const Text(
      'Log in',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF4B4B4B),
      ),
    );
  }

  Widget _imageCar() {
    return SizedBox(
      // alignment: Alignment.centerRight,
      width: double.infinity,
      height: 176,
      child: Image.asset('assets/img/car_white.png'),
    );
  }

  Widget _textWelcome(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xFF4B4B4B),
      ),
    );
  }

  Widget _textLoginRotated() {
    return const RotatedBox(
      quarterTurns: 1,
      child: Text(
        'Login',
        style: TextStyle(
          // color: Color(0xFF4B4B4B),
          color: Color(0XFFCECECE),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _textRegisterRotated(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'register');
      },
      child: const RotatedBox(
        quarterTurns: 1,
        child: Text(
          'Register',
          style: TextStyle(
            // color: Color(0xFF4B4B4B),
            color: Color(0XFFCECECE),
            fontSize: 24,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
