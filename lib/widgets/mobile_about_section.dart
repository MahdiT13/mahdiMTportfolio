import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/constants/links.dart';
import 'dart:js_interop';

@JS('window.open')
external void openInNewTab(String url);

class MobileAboutSection extends StatelessWidget {
  const MobileAboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
              ShaderMask(
                shaderCallback: (bounds) {
                  return const LinearGradient(
                    colors: [
                      Color.fromARGB(102, 0, 0, 0),
                      Color.fromARGB(147, 0, 0, 0),
                    ],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
                child: Container(
                  height: 180,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                      bottomLeft: Radius.circular(3),
                      bottomRight: Radius.circular(3),
                    ),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Color.fromARGB(76, 0, 0, 0),
                        BlendMode.darken,
                      ),
                      image: AssetImage('assets/images/mypic.jpeg'),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),

              // About + Socials
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: theme.cardColor.withOpacity(0.6),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'About Me:',
                                style: textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  fontFamily: GoogleFonts.caudex().fontFamily,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'I am an Information Technology graduate with a strong passion for mobile app development. I specialize in building cross-platform applications using Flutter, creating smooth, responsive, and user-friendly experiences for both Android and iOS.',
                              textAlign: TextAlign.justify,
                              style: textTheme.bodySmall?.copyWith(
                                fontSize: 9,
                                height: 1.5,
                                fontFamily:
                                    GoogleFonts.chakraPetch().fontFamily,
                              ),
                            ),
                            const SizedBox(height: 10),

                            // Social Icons
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 10,
                              children: [
                                for (int i = 0; i < links.length; i++) ...[
                                  InkWell(
                                    onTap: () => openInNewTab(links[i].fbLink),
                                    child: Image.asset(
                                      'assets/logos/fb.png',
                                      width: 30,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () =>
                                        openInNewTab(links[i].instaLink),
                                    child: Image.asset(
                                      'assets/logos/insta.png',
                                      width: 30,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () =>
                                        openInNewTab(links[i].githubLink),
                                    child: Image.asset(
                                      'assets/logos/git.png',
                                      width: 30,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Resume Button
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
