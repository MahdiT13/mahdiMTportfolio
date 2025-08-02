class Project {
  final String title;
  final String description;
  final String tools;
  final String imageAsset;
  final String dialogImg;
  final String githubLink;

  Project({
    required this.title,
    required this.tools,
    required this.description,
    required this.imageAsset,
    required this.githubLink,
    required this.dialogImg,
  });
}

final List<Project> projects = [
  Project(
    title: 'Todo App',
    tools: ' Flutter, Dart, Firebase',
    description:
        '• Built a responsive task management app with add/edit/complete features.\n• Integrated Firebase for real-time sync and storage.\n• Used Flutter widgets for clean UI and smooth UX.\n• Applied structured code and best development practices.',
    imageAsset: 'assets/images/p1.png',
    dialogImg: 'assets/images/project1.png',
    githubLink: 'https://github.com/MahdiT13/flutter-todo-app',
  ),
];
