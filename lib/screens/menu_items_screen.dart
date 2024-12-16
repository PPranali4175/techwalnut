import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CategoryButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryButton({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 10.0,
            )
          ]
              : [],
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.orange : Colors.white),
            SizedBox(width: 8.0),
            Text(
              title,
              style: GoogleFonts.poppins(
                color: isSelected ? Colors.orange : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
