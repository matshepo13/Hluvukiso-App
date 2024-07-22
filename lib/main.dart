import 'package:flutter/material.dart';

import './pages/ChatWithMomPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lifts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchBar(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleButton(
                  icon: Icons.add,
                  label: 'New',
                  onPressed: () {},
                ),
                CircleImageButton(
                  imagePath: 'assets/mom.png',
                  label: 'Mom',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatWithMomPage(),
                      ),
                    );
                  },
                ),
                CircleImageButton(
                  imagePath: 'assets/sister.png',
                  label: 'Sister',
                  onPressed: () {},
                ),
                CircleImageButton(
                  imagePath: 'assets/bot.png',
                  label: 'Bot',
                  onPressed: () {},
                ),
                CircleImageButton(
                  imagePath: 'assets/united.png',
                  label: 'Group',
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 32), // Move buttons down a bit
            ToggleButtonGroup(),
            const SizedBox(height: 32), // Move buttons down a bit
            GradientButton(
              text: 'Join our\nReach out for support',
              subText: 'Get help',
              icon: Icons.people,
              count: 2,
            ),
            const SizedBox(height: 16),
            GradientButton(
              text: 'Connect with\nSeek legal advice and support',
              subText: 'Get',
              icon: Icons.gavel,
            ),
            const SizedBox(height: 16),
            GradientButton(
              text: 'Share your\nGet guidance and support',
              subText: 'Stay',
              icon: Icons.people,
            ),
            const SizedBox(height: 16),
            GradientButton(
              text: '24/7\nSuicide Support',
              subText: '',
              icon: Icons.favorite,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Hluvukiso',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          foreground: Paint()
            ..shader = const LinearGradient(
              colors: <Color>[Colors.white, Color.fromARGB(255, 159, 109, 168)],
            ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1.5,
          color: Colors.transparent,
        ),
        gradient: const LinearGradient(
          colors: [Colors.white, Color.fromARGB(255, 159, 109, 168)],
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type to search resources',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const CircleButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2.0,
                color: Color.fromARGB(255, 159, 109, 168),
              ),
              color: Colors.transparent,
            ),
            child: Icon(icon, size: 30, color: Color.fromARGB(255, 159, 109, 168)),
          ),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}

class CircleImageButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onPressed;

  const CircleImageButton({
    required this.imagePath,
    required this.label,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2.0,
                color: Color.fromARGB(255, 159, 109, 168),
              ),
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  final String subText;
  final IconData icon;
  final int? count;

  const GradientButton({
    required this.text,
    required this.subText,
    required this.icon,
    this.count,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.transparent,
        border: Border.all(
          width: 2.0,
          color: Color.fromARGB(255, 159, 109, 168),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 40, color: Color.fromARGB(255, 159, 109, 168)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subText,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          if (count != null)
            CircleAvatar(
              radius: 12,
              child: Text(
                '$count',
                style: const TextStyle(fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}

class ToggleButtonGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50, // Increase the size of the toggle buttons
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1.5,
          color: Colors.transparent,
        ),
        gradient: const LinearGradient(
          colors: [Color.fromARGB(255, 159, 109, 168), Colors.white, Color.fromARGB(255, 159, 109, 168)],
          stops: [0.1, 0.5, 0.9],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: const Center(
                child: Text(
                  'Report',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color.fromARGB(255, 159, 109, 168),
              ),
              child: const Center(
                child: Text(
                  'Connect',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
