import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {

  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search recipes...',
        hintStyle: TextStyle(
          color: Color(0xFF888888),
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Color(0xFF171A1F),
        ),
        filled: true,
        fillColor: Color(0xFFF3F4F6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12.0),
      ),
    );
  }
}
