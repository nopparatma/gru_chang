import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:gru_chang/shared/colors.dart';
import 'package:gru_chang/shared/theme.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String hintText;

  const CustomTextFieldWidget({super.key, required this.hintText});

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFieldWidgetState createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.small.copyWith(color: Colors.grey),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.grey),
        ),
        focusedBorder: const GradientOutlineInputBorder(
          gradient: LinearGradient(colors: colorGoldGradients),
          width: 2,
        ),
      ),
    );
  }
}
