import 'package:flutter/material.dart';

class CustomTextFieldOutline extends StatelessWidget {
  const CustomTextFieldOutline(
      {super.key,
      required this.text,
      required this.icon,
      this.margin = EdgeInsets.zero});

  final String text;
  final IconData icon;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    Color lightGrey = const Color(0XFFCECECE);

    return Container(
      height: 40,
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: const BorderRadius.all(Radius.circular(32)),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          label: Text(text),
          // isCollapsed: true,
          // isDense: true,
          contentPadding: EdgeInsets.zero,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
              color: Colors.grey.shade50,
              width: 2,
            ),
          ),
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(32),
          //   borderSide: BorderSide(
          //     color: Colors.blue,
          //     width: 2,
          //   ),
          // ),
          prefixIcon: Icon(
            icon,
            size: 20,
          ),
        ),
      ),
    );
  }
}
