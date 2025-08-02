import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/skill_item.dart';

class SkillsMobile extends StatefulWidget {
  final List<Skills> skills;

  const SkillsMobile({super.key, required this.skills});

  @override
  SkillsMobileState createState() => SkillsMobileState();
}

class SkillsMobileState extends State<SkillsMobile>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final AnimationController _animationController;

  bool _scrollingForward = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..addListener(() {
      if (_scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final minScroll = _scrollController.position.minScrollExtent;
        final currentOffset = _scrollController.offset;

        double newOffset;
        if (_scrollingForward) {
          newOffset = currentOffset + 1;
          if (newOffset >= maxScroll) {
            _scrollingForward = false;
          }
        } else {
          newOffset = currentOffset - 1;
          if (newOffset <= minScroll) {
            _scrollingForward = true;
          }
        }

        _scrollController.jumpTo(newOffset.clamp(minScroll, maxScroll));
      }
    });

    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final colorScheme = theme.colorScheme;

    return SizedBox(
      height: 140,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        itemCount: widget.skills.length,
        itemBuilder: (context, index) {
          final skill = widget.skills[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              gradient: CustomColor.clr,
              borderRadius: BorderRadius.circular(11),
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                skill.icon,
                const SizedBox(width: 8),
                Text(
                  skill.title,
                  style: GoogleFonts.caudex(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // was Colors.white
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
