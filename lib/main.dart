import 'package:flutter/material.dart';
import 'signup_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/signup': (context) => const SignUpScreen(),
      },
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final ScrollController _tabsScrollController = ScrollController();

  static const List<String> _menuItems = <String>[
    'Home',
    'PlayGround',
    'AI-Ideation',
    'AI SHOP',
    'Excellence',
  ];

  static const List<Widget> _pages = <Widget>[
    HomeTab(),
    PlaygroundTab(),
    AiIdeationTab(),
    AiShopTab(),
    ExcellenceTab(),
  ];

  @override
  void dispose() {
    _tabsScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5EF),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 14, 24, 10),
              child: Scrollbar(
                controller: _tabsScrollController,
                thumbVisibility: true,
                interactive: true,
                child: SingleChildScrollView(
                  controller: _tabsScrollController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                    Container(
                      height: 44,
                      width: 108,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0A2D52),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'AI Agents Club',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      '- All Things AI, One Place',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2B2B2B),
                      ),
                    ),
                    const SizedBox(width: 40),
                    ...List<Widget>.generate(
                      _menuItems.length,
                      (int index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          child: Text(
                            _menuItems[index],
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: _selectedIndex == index
                                  ? const Color(0xFF1A1A1A)
                                  : const Color(0xFF2E2E2E),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB1784E),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          elevation: 0,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                  ),
                ),
              ),
            ),
            const Divider(height: 1, color: Color(0xFFE0DDD6)),
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: _pages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(34, 24, 34, 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            flex: 52,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Time',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2D2D2D),
                  ),
                ),
                SizedBox(height: 28),
                Text(
                  'Playground for Enthusiasts!',
                  style: TextStyle(
                    fontSize: 52,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6A6A6A),
                  ),
                ),
                SizedBox(height: 34),
                Text(
                  'The AI Agent Club will democratize AI agent usage by '
                  'providing a centralized, scalable, and monetizable '
                  'platform. It empowers developers, testers, and end users '
                  'alike, creating a thriving ecosystem for AI innovation.',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    color: Color(0xFF191919),
                  ),
                ),
                Spacer(),
                _FeedbackButton(),
              ],
            ),
          ),
          const SizedBox(width: 26),
          Expanded(
            flex: 48,
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.all(26),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Time is',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF54C8C6),
                      height: 0.9,
                    ),
                  ),
                  Text(
                    'Money',
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF54C8C6),
                      height: 0.86,
                    ),
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

class PlaygroundTab extends StatelessWidget {
  const PlaygroundTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const _TabPlaceholder(title: 'PlayGround');
  }
}

class AiIdeationTab extends StatelessWidget {
  const AiIdeationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const _TabPlaceholder(title: 'AI-Ideation');
  }
}

class AiShopTab extends StatelessWidget {
  const AiShopTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const _TabPlaceholder(title: 'AI SHOP');
  }
}

class ExcellenceTab extends StatelessWidget {
  const ExcellenceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const _TabPlaceholder(title: 'Excellence');
  }
}

class SignUpTab extends StatelessWidget {
  const SignUpTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class _FeedbackButton extends StatelessWidget {
  const _FeedbackButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: const Color(0xFFB1784E),
        borderRadius: BorderRadius.circular(28),
      ),
      alignment: Alignment.center,
      child: const Text(
        'Feedback /Suggestions',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _TabPlaceholder extends StatelessWidget {
  const _TabPlaceholder({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$title content coming soon',
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          color: Color(0xFF3A3A3A),
        ),
      ),
    );
  }
}
