import 'package:flutter/material.dart';

class IngredientChip extends StatefulWidget {
  final String text;
  final bool isSelected;
  final Function(String) onTap;

  const IngredientChip({super.key, required this.text, required this.isSelected, required this.onTap});

  @override
  _IngredientChipState createState() => _IngredientChipState();
}

class _IngredientChipState extends State<IngredientChip> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(widget.text),
      child: Chip(
        label: Text(
          widget.text,
          style: TextStyle(
            color: widget.isSelected ? Colors.white : Color(0xFF565D6D),
          ),
        ),
        backgroundColor: widget.isSelected ? Color(0xFFE1CEC4) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: Color(0xFFE1CEC4),
            width: 2,
          ),
        ),
      ),
    );
  }
}
