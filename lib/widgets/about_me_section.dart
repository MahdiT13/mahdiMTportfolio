import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/constants/links.dart';
import 'dart:js_interop';

@JS('window.open')
external void openInNewTab(String url);

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Profile Image
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 5),
              borderRadius: BorderRadius.circular(200),
              image: const DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
                fit: BoxFit.cover,
                image: AssetImage('assets/images/mypic.jpeg'),
              ),
            ),
          ),

          // About Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenWidth / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: theme.cardColor.withOpacity(0.7),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Row(
                        children: [
                          Text(
                            ' About Me :',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.caudex().fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'I am an Information Technology graduate with a strong passion for mobile app development. I specialize in building cross-platform applications using Flutter, creating smooth, responsive, and user-friendly experiences for both Android and iOS.',
                        textAlign: TextAlign.justify,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          height: 1.5,
                          fontFamily: GoogleFonts.chakraPetch().fontFamily,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Wrap(
                        spacing: 15,
                        alignment: WrapAlignment.center,
                        children: [
                          for (int i = 0; i < links.length; i++) ...[
                            InkWell(
                              onTap: () => openInNewTab(links[i].fbLink),
                              child: Image.asset(
                                'assets/logos/fb.png',
                                width: 35,
                              ),
                            ),
                            InkWell(
                              onTap: () => openInNewTab(links[i].instaLink),
                              child: Image.asset(
                                'assets/logos/insta.png',
                                width: 35,
                              ),
                            ),
                            InkWell(
                              onTap: () => openInNewTab(links[i].githubLink),
                              child: Image.asset(
                                'assets/logos/git.png',
                                width: 35,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
