import 'package:flutter/material.dart';

class Skills {
  final String title;
  final Image icon;

  Skills({required this.icon, required this.title});
}

final List<Skills> skills = [
  Skills(
    title: 'flutter',
    icon: Image.asset("assets/logos/flutter.png", width: 20),
  ),
  Skills(title: 'Dart', icon: Image.asset("assets/logos/dart.png", width: 20)),
  Skills(title: 'Vs Code', icon: Image.asset("assets/logos/vs.png", width: 20)),
  Skills(title: 'HTML', icon: Image.asset("assets/logos/html.png", width: 20)),
  Skills(title: 'CSS3', icon: Image.asset("assets/logos/css3.png", width: 20)),
  Skills(
    title: 'JavaScript',
    icon: Image.asset("assets/logos/js.png", width: 20),
  ),
  Skills(
    title: 'Firebase',
    icon: Image.asset("assets/logos/firebase.png", width: 20),
  ),
  Skills(
    title: 'GitHub',
    icon: Image.asset("assets/logos/github.png", width: 20),
  ),
  Skills(
    title: 'MicroSoft Office',
    icon: Image.asset("assets/logos/mof.png", width: 20),
  ),
  Skills(
    title: 'Problem Solving',
    icon: Image.asset("assets/logos/ps.png", width: 20),
  ),
  Skills(
    title: 'Communication',
    icon: Image.asset("assets/logos/com.png", width: 20),
  ),
  Skills(
    title: 'Team Work',
    icon: Image.asset("assets/logos/tm.png", width: 20),
  ),
];




// const List<Map> skillsItems = [

//   {
//     "img": "assets/logos/flutterr.png",
//     "title": "flutter"
//   },

//   {
//     "img": "assets/logos/dart.png",
//     "title": "Dart",
//   },

//   {
//     "img": "assets/logos/cross.png",
//     "title": "Cross-Platform Mobile application",
//   },

//   {
//     "img": "assets/logos/html.png",
//     "title": "HTML",
//   },

//   {
//     "img": "assets/logos/css3.png",
//     "title": "CSS3",
//   },

//   {
//     "img": "assets/logos/js.png",
//     "title": "JavaScript",
//   },

//   {
//     "img": "assets/logos/firebase.png",
//     "title": "Firebase",
//   },

//   {
//     "img": "assets/logos/github.png",
//     "title": "GitHub",
//   },

//   {
//     "img": "assets/logos/mof.png",
//     "title": "Microsoft Office",
//   },

//   {
//     "img": "assets/logos/ps.png",
//     "title": "Problem Solving",
//   },

//   {
//     "img": "assets/logos/com.png",
//     "title": "Communication",
//   },

//   {
//     "img": "assets/logos/tm.png",
//     "title": "Team Work",
//   },

//   {
//     "img": "assets/logos/vs.png",
//     "title": "VS Code",
//   },

// ];