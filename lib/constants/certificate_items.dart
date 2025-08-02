class Certificates {
  final String title;
  final String details;
  final String date;
  final String img;

  Certificates({
    required this.title,
    required this.details,
    required this.date,
    required this.img,
  });
}

final List<Certificates> certificates = [
  Certificates(
    title: 'Responsive Web Design ',
    details: 'Certified in Responsive Web Design (3 months) .',
    date: 'November 2021',
    img: 'assets/certificates/responsiveWeb.png',
  ),

  Certificates(
    title: 'Communication Skills',
    details: 'Completed a soft skills training course (39 hours / 1 month).',
    date: 'Dec 2023',
    img: 'assets/certificates/comunication.png',
  ),

  Certificates(
    title: 'Flutter & Dart Udemy (Academind by Maximilian Schwarzmüller)',
    details:
        'Certified in Flutter & Dart app development after completing Academinds 30-hour in-depth course,\n enhancing skills in cross-platform mobile development (1 month).',
    date: 'Dec 2023',
    img: 'assets/certificates/flutter.jpg',
  ),

  Certificates(
    title: 'Mobile App Development Internship (CAC)',
    details:
        'Completed a 1-month internship focused on Flutter-based mobile app development.\n Gained hands-on experience in the full development lifecycle, \nincluding UI design, teamwork, and agile development practices (1 month).                            ',
    date: 'May 2025 - June2025',
    img: 'assets/certificates/cacIntern.png',
  ),
];
