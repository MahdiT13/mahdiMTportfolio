import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    final theme = Theme.of(context);
    // final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final String resumeUrl =
        'https://www.dropbox.com/scl/fi/92xikjsfjre1w82yhiam2/Mahdi_Tawbe_Resume.pdf?rlkey=xyjkv08xdrje3vdiifrpxqc16&st=3nulhhuu&dl=0';

    Future<void> viewResume() async {
      final Uri url = Uri.parse(resumeUrl);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $resumeUrl';
      }
    }

    return Container(
      height: 700,
      width: double.infinity,
      decoration:  BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/bg1.jpg'),
        ),
        borderRadius: BorderRadius.all(Radius.circular(200)),
        border: Border.all(
          color: const Color.fromARGB(255, 40, 39, 39),
          width: 1
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 20,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: screenWidth / 1.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: theme.cardColor.withOpacity(0.5), // from ThemeData
                    border: Border.all(color: theme.dividerColor, width: 1),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Mahdi Tawbe',
                          style: GoogleFonts.caudex(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color:
                                textTheme.headlineLarge?.color ?? Colors.white,
                            letterSpacing: 10,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Divider(
                          height: 20,
                          thickness: 1.5,
                          indent: screenWidth / 10,
                          endIndent: screenWidth / 10,
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
                                fontSize: 34,
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
              ],
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
                  vertical: screenSize.height / 30,
                  horizontal: screenWidth / 10,
                ),
              ),
              elevation: MaterialStateProperty.all(7),
            ),
            child: Text(
              'My Resume',
              style: GoogleFonts.caudex(
                fontSize: 20,
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
    );
  }
}
