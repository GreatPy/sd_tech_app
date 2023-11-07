import 'package:flutter/material.dart';
import 'package:sd_tech/models/styles.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({
    super.key,
    required this.onFocus,
    required this.formKey,
  });
  final GlobalKey formKey;
  final void Function() onFocus;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      widget.onFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        // color: neutralLigth,
        Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        focusNode: _focusNode,
        autofocus: true,
        cursorColor: primaryColorLigth,
        cursorWidth: 4,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: primaryColorLigth),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColorLigth)),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: primaryColorLigth),
          ),
        ),
      ),
    );
  }
}
