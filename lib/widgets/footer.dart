import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyMedium?.color ?? Colors.white;

    return Container(
      height: 40,
      width: double.infinity,
      color: Colors.black.withOpacity(0.6),
      child: Center(
        child: Text(
          'Made by Mahdi Tawbe with Flutter',
          style: GoogleFonts.caudex(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            wordSpacing: 10,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
