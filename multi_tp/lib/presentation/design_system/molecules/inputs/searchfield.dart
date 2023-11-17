import 'package:flutter/material.dart';
import 'package:multi_tp/presentation/design_system/tokens/colors.dart';
import 'package:multi_tp/presentation/design_system/tokens/font.dart';
import 'package:multi_tp/presentation/design_system/tokens/shadows.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key, required this.onChanged}) : super(key: key);

  final void Function(String) onChanged;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  bool _isEmpty = true;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
    _controller.addListener(() {
      if (_controller.text.isNotEmpty) {
        setState(() {
          _isEmpty = false;
        });
      } else {
        setState(() {
          _isEmpty = true;
        });
      }
    });
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
      decoration: const BoxDecoration(
          color: ColorPalette.neutral0,
          boxShadow: [CustomShadow.shadow01_1(), CustomShadow.shadow01_2()]),
      child: TextField(
        onChanged: widget.onChanged,
        controller: _controller,
        textAlignVertical: TextAlignVertical.center,
        focusNode: _focusNode,
        decoration: InputDecoration(
          fillColor: ColorPalette.neutral0,
          hintText: "Buscar", // Add a placeholder text
          hintStyle: const CustomFont.subtitle01(ColorPalette.neutral50),
          prefixIcon: (() {
            if (_isEmpty) {
              return const Padding(
                padding: EdgeInsets.only(left: 16, right: 8),
                child: Icon(
                  Icons.search,
                  color: ColorPalette.neutral75,
                ),
              );
            }
          }()),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(left: 8, right: 12),
            child: (() {
              if (_isFocused || !_isEmpty) {
                return InkWell(
                  onTap: clearText,
                  child: const Icon(Icons.close, color: ColorPalette.neutral75),
                );
              }
              return const Icon(Icons.map, color: ColorPalette.primary100);
            }()),
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
