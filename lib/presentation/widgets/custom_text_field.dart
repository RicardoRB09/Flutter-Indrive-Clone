import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    required this.icon,
    this.margin = EdgeInsets.zero,
    required this.onChanged,
    this.validator,
  });

  final String text;
  final IconData icon;
  final EdgeInsetsGeometry margin;
  final Function(String text) onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: margin,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          label: Text(text),
          prefixIcon: Icon(
            icon,
            size: 20,
          ),
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
