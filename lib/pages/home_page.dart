import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/constants/contact.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/constants/skill_item.dart';
import 'package:my_portfolio/widgets/about_me_section.dart';
import 'package:my_portfolio/widgets/certificates_section.dart';
import 'package:my_portfolio/widgets/footer.dart';
import 'package:my_portfolio/widgets/header.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/main_mobile.dart';
import 'package:my_portfolio/widgets/mobile_about_section.dart';
import 'package:my_portfolio/widgets/mobile_drawer.dart';
import 'package:my_portfolio/widgets/mobile_header.dart';
import 'package:my_portfolio/widgets/project_section.dart';
import 'package:my_portfolio/widgets/skills_desktop.dart';
import 'package:my_portfolio/widgets/skills_mobile.dart';
import 'dart:js_interop' as js;

@js.JS('window.open')
external void openInNewTab(String url);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(5, (index) => GlobalKey());

  void scrollToTop() {
    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    void scrollToSection(int navIndex) {
      if (navIndex == 5) {
        Future.microtask(() {
          openInNewTab(Contact.contact);
        });
        return;
      }
      final key = navbarKeys[navIndex];
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          body: SizedBox(
            height: screenHeight,
            child: Stack(
              children: [
                constraints.maxWidth >= 700
                    ? Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset(
                        'assets/images/island.jpg',
                        fit: BoxFit.cover,
                      ),
                    )
                    : Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 5, 43, 100),
                            Color.fromARGB(255, 11, 66, 148),
                            Color.fromARGB(255, 9, 32, 67),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                        child: Container(color: Colors.black.withOpacity(0.05)),
                      ),
                    ),
                SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      constraints.maxWidth >= kMinDesktopWidth
                          ? Header(onNavMenuTab: scrollToSection)
                          : MobileHeader(
                            onLogoTap: () {},
                            onMenuTap:
                                () => scaffoldKey.currentState?.openEndDrawer(),
                          ),
                      // Main section
                      Container(
                        key: navbarKeys[0],
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 40,
                        ),
                        child: _GlassSection(
                          child:
                              constraints.maxWidth >= kMinDesktopWidth
                                  ? MainDesktop()
                                  : MainMobile(),
                        ),
                      ),
                      const Divider(color: Colors.white24, thickness: 0.3),
                      // Skills section
                      Container(
                        key: navbarKeys[1],
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 40,
                        ),
                        child: _GlassSection(
                          child: Column(
                            children: [
                              _sectionTitle('Skills'),
                              const SizedBox(height: 30),
                              constraints.maxWidth >= kMinDesktopWidth
                                  ? SkillsDesktop(skills: skills)
                                  : SkillsMobile(skills: skills),
                            ],
                          ),
                        ),
                      ),
                      const Divider(color: Colors.white24, thickness: 0.3),
                      // Project section
                      ProjectsSection(key: navbarKeys[2]),
                      const Divider(color: Colors.white24, thickness: 0.3),
                      // Certificate section
                      Container(
                        key: navbarKeys[3],
                        padding: const EdgeInsets.all(20),
                        child: _GlassSection(
                          child: Column(
                            children: [
                              _sectionTitle('Certificates'),
                              const SizedBox(height: 30),
                              CertificatesSection(),
                            ],
                          ),
                        ),
                      ),
                      const Divider(color: Colors.white24, thickness: 0.3),

                      // About section
                      Container(
                        key: navbarKeys[4],
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          vertical: 50,
                          horizontal: 20,
                        ),
                        child: _GlassSection(
                          child:
                              constraints.maxWidth >= kMinDesktopWidth
                                  ? const AboutMeSection()
                                  : const MobileAboutSection(),
                        ),
                      ),
                      //footer
                      const Footer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          endDrawer:
              constraints.maxWidth >= kMinDesktopWidth
                  ? null
                  : MobileDrawer(
                    onNavItemTab: (index) {
                      scaffoldKey.currentState?.closeEndDrawer();
                      scrollToSection(index);
                    },
                  ),
          floatingActionButton: FloatingActionButton(
            onPressed: scrollToTop,
            backgroundColor: const Color(0xFF0D47A1),
            shape: const CircleBorder(),
            hoverColor: const Color.fromARGB(255, 76, 123, 193),
            splashColor: const Color.fromARGB(255, 203, 14, 0),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: const Icon(Icons.arrow_upward_rounded),
          ),
        );
      },
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.caudex(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).textTheme.headlineLarge?.color,
      ),
    );
  }
}

class _GlassSection extends StatelessWidget {
  final Widget child;

  const _GlassSection({required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: const Color.fromARGB(85, 255, 255, 255)),
          ),
          child: child,
        ),
      ),
    );
  }
}
