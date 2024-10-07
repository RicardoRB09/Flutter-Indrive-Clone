import 'package:flutter/material.dart';

class CustomTextFieldOutline extends StatelessWidget {
  const CustomTextFieldOutline(
      {super.key,
      required this.text,
      required this.icon,
      required this.onChanged,
      this.margin = EdgeInsets.zero,
      this.validator});

  final String text;
  final IconData icon;
  final EdgeInsetsGeometry margin;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: const BorderRadius.all(Radius.circular(32)),
      ),
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          label: Text(text),
          contentPadding: EdgeInsets.zero,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
              color: Colors.grey.shade50,
              width: 2,
            ),
          ),
          prefixIcon: Icon(
            icon,
            size: 20,
          ),
        ),
      ),
    );
  }
}
