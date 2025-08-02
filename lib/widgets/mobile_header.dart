import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/site_logo.dart';

class MobileHeader extends StatelessWidget {
  const MobileHeader({super.key, this.onLogoTap, this.onMenuTap});

  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          height: 50,
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            border: Border.all(color: Colors.white24),
          ),
          child: Row(
            children: [
              SiteLogo(onTap: onLogoTap),
              const Spacer(),
              IconButton(
                onPressed: onMenuTap,
                icon: const Icon(Icons.menu, color: Colors.white),
              ),
              const SizedBox(width: 15),
            ],
          ),
        ),
      ),
    );
  }
}
