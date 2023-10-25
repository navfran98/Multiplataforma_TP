import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';
import 'package:intl/intl.dart';

class CalendarTextField extends StatefulWidget {
  const CalendarTextField(
      {Key? key,
      required this.floatingLabel,
      required this.hintText,
      required this.labelText,
      required this.controller,
      this.validator})
      : super(key: key);

  final bool floatingLabel;
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<CalendarTextField> createState() => _CalendarTextFieldState();
}

class _CalendarTextFieldState extends State<CalendarTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  bool _isError = false;

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
      widget.controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      keyboardType: TextInputType.datetime,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
        LengthLimitingTextInputFormatter(10),
      ],
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
      decoration: InputDecoration(
        floatingLabelBehavior: widget.floatingLabel
            ? FloatingLabelBehavior.always
            : FloatingLabelBehavior.auto,
        hintText: widget.hintText, // Add a placeholder text
        hintStyle: const CustomFont.subtitle01(ColorPalette.neutral50),
        errorStyle: const CustomFont.body02(ColorPalette.error100),
        suffixIcon: const Icon(
          Icons.calendar_today,
          color: ColorPalette.primary100,
        ),
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
         errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: ColorPalette.error100,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        helperText: _isFocused ? "Día / Mes / Año" : null,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: ColorPalette.secondary200,
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
