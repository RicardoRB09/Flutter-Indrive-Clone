import 'package:flutter/material.dart';
import 'package:indriver_clone/presentation/widgets/custom_button.dart';
import 'package:indriver_clone/presentation/widgets/custom_text_field.dart';
import 'package:indriver_clone/presentation/widgets/custom_text_field_outline.dart';

class RegisterContent extends StatelessWidget {
  const RegisterContent({super.key});

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
          // color: const Color(0XFFCECECE),
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
                      // _imageBanner(),
                      _textRegister(),
                      const CustomTextFieldOutline(
                        text: 'Name',
                        icon: Icons.person_outlined,
                        margin: EdgeInsets.only(top: 32, bottom: 8),
                      ),
                      const CustomTextFieldOutline(
                        text: 'Lastname',
                        icon: Icons.person_2_outlined,
                        margin: EdgeInsets.symmetric(vertical: 8),
                      ),
                      const CustomTextFieldOutline(
                        text: 'Email',
                        icon: Icons.email_outlined,
                        margin: EdgeInsets.symmetric(vertical: 8),
                      ),
                      const CustomTextFieldOutline(
                        text: 'Phone',
                        icon: Icons.phone_outlined,
                        margin: EdgeInsets.symmetric(vertical: 8),
                      ),
                      const CustomTextFieldOutline(
                        text: 'Password',
                        icon: Icons.lock_outline,
                        margin: EdgeInsets.symmetric(vertical: 8),
                      ),
                      const CustomTextFieldOutline(
                        text: 'Confirm Password',
                        icon: Icons.lock_outline,
                        margin: EdgeInsets.only(top: 8, bottom: 32),
                      ),
                      CustomButton(
                        text: 'Create User',
                        onPressed: () {},
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
    final screenSize = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      // width: screenSize.width * 1.5,
      // margin: EdgeInsets.only(top: screenSize.height * 0.01),
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
            Navigator.pushNamed(context, 'login');
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

  Widget _imageBanner() {
    return Container(
      // alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top: 48),
      width: double.infinity,
      height: 176,
      child: Image.asset('assets/img/car_white.png'),
    );
  }

  Widget _textLoginRotated(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'login');
      },
      child: const RotatedBox(
        quarterTurns: 1,
        child: Text(
          'Login',
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

  Widget _textRegisterRotated(BuildContext context) {
    return const RotatedBox(
      quarterTurns: 1,
      child: Text(
        'Register',
        style: TextStyle(
          // color: Color(0xFF4B4B4B),
          color: Color(0XFFCECECE),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
