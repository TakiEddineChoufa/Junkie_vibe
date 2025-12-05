import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';
import '../details/detail_screen.dart';
import '../profile/profile_screen.dart';

class ForYouScreen extends StatelessWidget {
  const ForYouScreen({super.key});

  List<Map<String, String>> get _picks => const [
        {
          "title": "Moonlit Run",
          "tag": "Mystery • 96% match",
          "poster": "assets/poster2.jpg",
        },
        {
          "title": "Noir City",
          "tag": "Neo noir • 92% match",
          "poster": "assets/poster7.jpg",
        },
        {
          "title": "Glass Tower",
          "tag": "Thriller • 94% match",
          "poster": "assets/poster10.jpg",
        },
        {
          "title": "Crimson Tide",
          "tag": "Drama • 91% match",
          "poster": "assets/poster14.jpg",
        },
        {
          "title": "Solar Drift",
          "tag": "Sci-fi • 95% match",
          "poster": "assets/poster20.jpg",
        },
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JunkieColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(context),
              const SizedBox(height: 16),
              _heroPick(context),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Curated For You",
                  style: const TextStyle(
                    color: JunkieColors.text,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ..._picks
                  .map(
                    (item) => _recommendationTile(
                      context,
                      title: item["title"]!,
                      tag: item["tag"]!,
                      posterPath: item["poster"]!,
                    ),
                  )
                  .expand((widget) => [widget, const SizedBox(height: 12)])
                  .toList()
                ..removeLast(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _bottomNav(context),
    );
  }

  Widget _header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: JunkieColors.text, size: 26),
            onPressed: () => Navigator.of(context).pop(),
          ),
          Row(
            children: [
              Image.asset("assets/logo.png", height: 44),
              const SizedBox(width: 12),
              const Text(
                "For You",
                style: TextStyle(
                  color: JunkieColors.text,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(width: 40), // spacer
        ],
      ),
    );
  }

  Widget _heroPick(BuildContext context) {
    final topPick = _picks.first;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DetailScreen(
              posterPath: topPick["poster"]!,
              title: topPick["title"],
            ),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: JunkieColors.card,
            border: Border.all(color: JunkieColors.accent.withOpacity(0.4), width: 1.5),
            boxShadow: [
              BoxShadow(
                color: JunkieColors.accent.withOpacity(0.18),
                blurRadius: 18,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 190,
                width: double.infinity,
                child: Image.asset(
                  topPick["poster"]!,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topPick["title"]!,
                      style: const TextStyle(
                        color: JunkieColors.text,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      topPick["tag"]!,
                      style: TextStyle(
                        color: JunkieColors.text.withOpacity(0.75),
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 4,
                      width: 120,
                      decoration: BoxDecoration(
                        color: JunkieColors.accent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _recommendationTile(
    BuildContext context, {
    required String title,
    required String tag,
    required String posterPath,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: JunkieColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: JunkieColors.text.withOpacity(0.12), width: 1),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => DetailScreen(posterPath: posterPath, title: title),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  posterPath,
                  height: 90,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: JunkieColors.text,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    tag,
                    style: TextStyle(
                      color: JunkieColors.text.withOpacity(0.7),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.auto_graph, color: JunkieColors.accent, size: 18),
                      const SizedBox(width: 6),
                      Text(
                        "Because you liked similar vibes",
                        style: TextStyle(
                          color: JunkieColors.text.withOpacity(0.65),
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: JunkieColors.accent, width: 2),
              ),
              child: IconButton(
                icon: const Icon(Icons.play_arrow, color: JunkieColors.accent),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(posterPath: posterPath, title: title),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNav(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: JunkieColors.background,
      selectedItemColor: JunkieColors.accent,
      unselectedItemColor: JunkieColors.text.withOpacity(0.6),
      currentIndex: 0,
      onTap: (index) {
        if (index == 0) {
          Navigator.of(context).pop();
        } else if (index == 1) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Soon & Hot coming soon"),
              behavior: SnackBarBehavior.floating,
              duration: Duration(seconds: 2),
            ),
          );
        } else if (index == 2) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const ProfileScreen()),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.change_history), label: "Soon&Hot"),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "My Junkie"),
      ],
    );
  }
}
