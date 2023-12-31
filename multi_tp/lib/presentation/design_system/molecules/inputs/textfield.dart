import 'package:flutter/material.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      required this.isDisabled,
      required this.floatingLabel,
      this.hintText,
      required this.labelText,
      this.isObscure,
      required this.controller,
      this.validator})
      : super(key: key);

  final bool isDisabled;
  final bool floatingLabel;
  final String? hintText;
  final String labelText;
  final bool? isObscure;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  late bool _isObscure;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
    _isObscure = widget.isObscure == true ? true : false;
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
      widget.controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if(widget.validator != null) {
          final s = widget.validator!(value);
          setState(() {
            _isError = s != null;
          });
          return s;
        } else {
          return null;
        }
      },
      controller: widget.controller,
      focusNode: _focusNode,
      obscureText: _isObscure,
      decoration: InputDecoration(
          floatingLabelBehavior: widget.floatingLabel
              ? FloatingLabelBehavior.always
              : FloatingLabelBehavior.auto,
          enabled: !widget.isDisabled,
          hintText: widget.hintText, // Add a placeholder text
          hintStyle: const CustomFont.subtitle01(ColorPalette.neutral50),
          errorStyle: const CustomFont.body02(ColorPalette.error100),
          suffixIcon: (() {
            if (_isError) {
              return const Icon(Icons.error_rounded,
                  color: ColorPalette.error100);
            }
            if (widget.isObscure != null) {
              return InkWell(
                onTap: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                child: Icon(
                  _isObscure == true ? Icons.visibility_off : Icons.visibility,
                  color: ColorPalette.neutral75,
                ),
              );
            }
            if (_isFocused) {
              return InkWell(
                onTap: clearText,
                child: const Icon(Icons.close, color: ColorPalette.primary100),
              );
            }
            return null;
          }()),
          contentPadding: const EdgeInsets.only(left: 16),
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: _isFocused && _isError
                ? ColorPalette.error100
                : _isFocused
                    ? ColorPalette.secondary200
                    : ColorPalette.neutral75,
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
          ),
      ),
      onTapOutside: (e) {
        _focusNode.unfocus();
      },
      onEditingComplete: () {
        _focusNode.unfocus();
      },
      onFieldSubmitted: (value) {
        _focusNode.unfocus();
      },

    );
  }
}
