import 'package:flutter/material.dart';
import 'package:multi_tp/utils/colors.dart';
import 'package:multi_tp/utils/font.dart';
import 'package:multi_tp/buttons/cta_button.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({Key? key, required this.isDisabled, required this.isError, required this.floatingLabel, this.hintText, required this.labelText}) : super(key: key);
  final bool isDisabled;
  final bool isError;
  final bool floatingLabel;
  final String? hintText;
  final String labelText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus) {
      setState(() {
        _isFocused = true;
      });
    } else {
      setState(() {
        _isFocused = false;
      });
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void clearText() {
    setState(() {
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      decoration: InputDecoration(
        floatingLabelBehavior: widget.floatingLabel ? FloatingLabelBehavior.always : FloatingLabelBehavior.auto,
        enabled: !widget.isDisabled,
        hintText: widget.hintText, // Add a placeholder text
        hintStyle: const CustomFont.subtitle01(ColorPalette.neutral50),
        errorText: widget.isError ? "Suporting text" : null,
        errorStyle: const CustomFont.body02(ColorPalette.error100),
        suffixIcon: widget.isError ? const Icon(Icons.error_rounded, color: ColorPalette.error100,): _isFocused ? InkWell(onTap: clearText,child: const Icon(Icons.close, color: ColorPalette.primary100,)) :  null,
        contentPadding: const EdgeInsets.only(left: 16),
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: _isFocused && widget.isError ? ColorPalette.error100 : _isFocused ? ColorPalette.secondary200 : ColorPalette.neutral75,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: ColorPalette.neutral75,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: ColorPalette.secondary200,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: ColorPalette.error100,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: ColorPalette.neutral50,
          ),
          borderRadius: BorderRadius.circular(4),
        )
      ),
    );
  }
}
