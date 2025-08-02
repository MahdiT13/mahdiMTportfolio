import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/constants/nav_items.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key, required this.onNavItemTab});

  final Function(int) onNavItemTab;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      child: Stack(
        children: [
          // Glass effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
            ),
          ),
          // Drawer content
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  padding: const EdgeInsets.all(20),
                  icon: Icon(
                    Icons.close,
                    color: theme.iconTheme.color ?? Colors.white,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  tooltip: 'Close Menu',
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: navIcons.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.of(context).pop();
                        onNavItemTab(index);
                      },
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      leading: Icon(
                        navIcons[index],
                        color: theme.iconTheme.color ?? Colors.white,
                      ),
                      title: Text(
                        navTitle[index],
                        style: GoogleFonts.caudex(
                          color:
                              theme.textTheme.bodyLarge?.color ?? Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
