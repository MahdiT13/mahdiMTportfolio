import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/constants/certificate_items.dart';

class CertificatesSection extends StatelessWidget {
  const CertificatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Column(
      children: [
        for (int i = 0; i < certificates.length; i++)
          ExpandableNotifier(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: theme.cardColor.withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ScrollOnExpand(
                  child: ExpandablePanel(
                    header: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          certificates[i].title,
                          style: GoogleFonts.chakraPetch(
                            fontWeight: FontWeight.bold,
                            color: textTheme.bodyLarge?.color,
                          ),
                        ),
                      ),
                    ),
                    collapsed: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        certificates[i].details,
                        style: GoogleFonts.chakraPetch(
                          fontWeight: FontWeight.bold,
                          color: textTheme.bodyMedium?.color,
                        ),
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            certificates[i].date,
                            style: GoogleFonts.chakraPetch(
                              fontWeight: FontWeight.bold,
                              color: textTheme.bodyMedium?.color,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(certificates[i].img),
                        ),
                      ],
                    ),
                    theme: const ExpandableThemeData(
                      iconColor: Colors.white,
                      expandIcon: Icons.arrow_drop_down,
                      collapseIcon: Icons.arrow_drop_up,
                      bodyAlignment: ExpandablePanelBodyAlignment.center,
                      iconPlacement: ExpandablePanelIconPlacement.right,
                      iconPadding: EdgeInsets.only(
                        top: 15,
                        right: 20,
                        bottom: 10,
                      ),
                      tapBodyToCollapse: true,
                      iconSize: 30,
                      hasIcon: true,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
