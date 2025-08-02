import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/constants/project_items.dart';
import 'dart:js_interop';

@JS('window.open')
external void openInNewTab(String url);

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({super.key, required this.project});
  final Project project;

  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(), // close on tap
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      clipBehavior: Clip.antiAlias,
      height: 420,
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colorScheme.secondaryContainer.withOpacity(0.9), // glassy-like
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Image.asset(
            project.imageAsset,
            height: 140,
            width: 260,
            fit: BoxFit.cover,
          ),

          // Title
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 3),
            child: Text(
              project.title,
              style: GoogleFonts.caudex(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: textTheme.titleLarge?.color ?? Colors.white,
              ),
            ),
          ),

          // Tools
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
            child: Text(
              project.tools,
              style: GoogleFonts.caudex(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color:
                    textTheme.bodySmall?.color?.withOpacity(0.6) ??
                    Colors.white60,
              ),
            ),
          ),

          // Description
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              project.description,
              textAlign: TextAlign.justify,
              style: GoogleFonts.caudex(
                fontSize: 12,
                color: textTheme.bodyMedium?.color ?? Colors.white,
              ),
            ),
          ),

          const Spacer(),

          // Footer with buttons
          Container(
            color: colorScheme.outline.withOpacity(0.2),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () => _showImageDialog(context, project.dialogImg),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF0D47A1),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    shape: BeveledRectangleBorder(
                      side: BorderSide(color: Colors.white, width: 0.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'See Mockup',
                    style: GoogleFonts.caudex(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    Future.microtask(() {
                      openInNewTab(project.githubLink);
                    });
                  },
                  child: Image.asset('assets/logos/github.png', width: 45),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
