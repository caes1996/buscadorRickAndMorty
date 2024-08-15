import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class SearchComponent extends StatefulWidget {
  const SearchComponent({super.key,
    required this.hint,
    required this.controller,
    this.onChanged,
  });

  final String hint;
  final TextEditingController controller;
  final void Function(String value)? onChanged;

  @override
  State<SearchComponent> createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8)
      ),
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(Symbols.search_rounded, color: Colors.grey.shade400),
          border: InputBorder.none,
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
          )
        ),
      ),
    );
  }
}

