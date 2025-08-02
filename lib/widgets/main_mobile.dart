import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    final theme = Theme.of(context);
    // final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final String resumeUrl =
        'https://www.dropbox.com/scl/fi/r2mgzpqu8zw0kxc8zk5ho/Mahdi_Tawbe_CV.pdf?rlkey=mgohmugrp0eg9ksbn21iak4dg&st=7ifk0mpd&raw=1';

    Future<void> viewResume() async {
      final Uri url = Uri.parse(resumeUrl);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $resumeUrl';
      }
    }

    return Column(
      children: [
        Container(
          height: 700,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/bg1.jpg'),
            ),
            borderRadius: BorderRadius.all(Radius.circular(200)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 160,
                  width: screenWidth / 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: theme.cardColor.withOpacity(0.5),
                    border: Border.all(color: theme.dividerColor, width: 1),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Mahdi Tawbe',
                          style: GoogleFonts.caudex(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: textTheme.headlineLarge?.color,
                            letterSpacing: 5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Divider(
                          height: 1,
                          indent: screenWidth / 5,
                          endIndent: screenWidth / 5,
                          color: theme.dividerColor,
                        ),
                        const SizedBox(height: 8),
                        AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Flutter Developer',
                              speed: Duration(milliseconds: 100),
                              cursor: '📱',
                              textStyle: GoogleFonts.caudex(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color:
                                    textTheme.bodyLarge?.color ?? Colors.white,
                                letterSpacing: 5,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              OutlinedButton(
                onPressed: viewResume,
                style: theme.outlinedButtonTheme.style?.copyWith(
                  side: MaterialStateProperty.all(
                    BorderSide(color: theme.primaryColor, width: 2),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    theme.cardColor.withOpacity(0.6),
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(
                      vertical: screenSize.height / 40,
                      horizontal: screenWidth / 20,
                    ),
                  ),
                  elevation: MaterialStateProperty.all(7),
                ),
                child: Text(
                  'My Resume',
                  style: GoogleFonts.caudex(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5,
                    color: textTheme.bodyLarge?.color ?? Colors.white,
                    shadows: const [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 3,
                        offset: Offset(1, 5),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
