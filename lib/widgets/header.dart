import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/nav_items.dart';
import 'package:my_portfolio/widgets/site_logo.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.onNavMenuTab});
  final Function(int) onNavMenuTab;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyMedium?.color ?? Colors.white;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            height: 70,
            margin: const EdgeInsets.only(bottom: 3),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),
              borderRadius: BorderRadius.circular(50),
              border: Border(
                bottom: BorderSide(color: Colors.white24),
                left: BorderSide(color: Colors.white24),
                right: BorderSide(color: Colors.white24),
                top: BorderSide(color: Colors.white24),
              ),
            ),
            child: Row(
              children: [
                SiteLogo(onTap: () {}),
                const Spacer(),
                for (int i = 0; i < navTitle.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Container(
                      decoration: BoxDecoration(
                        color: CustomColor.btns.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(12),
                        border: Border(
                          bottom: BorderSide(color: Colors.white24),
                          left: BorderSide(color: Colors.white24),
                          right: BorderSide(color: Colors.white24),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () => onNavMenuTab(i),
                        style: TextButton.styleFrom(
                          overlayColor: const Color.fromARGB(
                            255,
                            255,
                            0,
                            0,
                          ).withOpacity(0.7),
                        ),
                        child: Text(
                          navTitle[i],
                          style: GoogleFonts.caudex(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
