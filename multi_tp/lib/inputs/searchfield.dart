import 'package:flutter/material.dart';
import 'package:multi_tp/utils/colors.dart';
import 'package:multi_tp/utils/font.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
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
    return Container(
      height: 48,
      decoration: const BoxDecoration(color: ColorPalette.neutral0, boxShadow: [
        BoxShadow(
            blurRadius: 3,
            spreadRadius: 1,
            color: Color.fromRGBO(0, 0, 0, 0.15),
            offset: Offset(0, 1)),
        BoxShadow(
            blurRadius: 2,
            spreadRadius: 0,
            color: Color.fromRGBO(0, 0, 0, 0.3),
            offset: Offset(0, 1))
      ]),
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        decoration: InputDecoration(
          fillColor: ColorPalette.neutral0,
          contentPadding: const EdgeInsets.symmetric(horizontal: 48),
          hintText: "Buscar", // Add a placeholder text
          hintStyle: const CustomFont.subtitle01(ColorPalette.neutral50),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 16, right: 8),
            child: Icon(
              Icons.search,
              color: ColorPalette.neutral75,
            ),
          ),
          suffixIcon: const Padding(
            padding: EdgeInsets.only(left: 8, right: 16),
            child: Icon(Icons.map, color: ColorPalette.primary100),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(2.0),
          ),
        ),
      ),
    );
  }
}
