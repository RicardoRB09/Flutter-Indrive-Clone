import 'package:flutter/material.dart';
import 'package:indriver_clone/presentation/widgets/custom_button.dart';
import 'package:indriver_clone/presentation/widgets/custom_text_field.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    Color darkGrey = const Color(0xFF4B4B4B);
    Color lightGrey = const Color(0XFFCECECE);

    return Stack(
      children: [
        Container(
          width: screenWidth,
          height: screenHeight,
          color: const Color(0XFFCECECE),
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _textLoginRotated(),
              const SizedBox(height: 56),
              _textRegisterRotated(),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 64, bottom: 48),
          decoration: BoxDecoration(
            // color: darkGrey,
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topCenter,
              stops: const [0.2, 0.9],
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
                const CustomTextField(
                  text: 'Email',
                  icon: Icons.email_outlined,
                ),
                const SizedBox(height: 24),
                const CustomTextField(
                  text: 'Password',
                  icon: Icons.lock_outline,
                ),
                const Spacer(),
                const CustomButton(text: 'SIGN IN'),
                const SizedBox(height: 8),
                _textOr(),
                const SizedBox(height: 8),
                _textDontHaveAccount(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _textDontHaveAccount() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Dont have an account? ',
          style: TextStyle(
            fontSize: 12,
            color: Color(0XFFCECECE),
          ),
        ),
        Text(
          'Register',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0XFFCECECE),
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
    return Container(
      alignment: Alignment.centerRight,
      width: double.infinity,
      height: 176,
      child: Image.asset('assets/img/car.png'),
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
          color: Color(0xFF4B4B4B),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _textRegisterRotated() {
    return const RotatedBox(
      quarterTurns: 1,
      child: Text(
        'Register',
        style: TextStyle(
          color: Color(0xFF4B4B4B),
          fontSize: 24,
          // fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
