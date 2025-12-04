import 'dart:math';
import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Random _random = Random();
  final List<String> _allPosters = List.generate(
    22,
    (index) => "assets/poster${index + 1}.jpg",
  );

  final List<String> _categories = const ["Shows", "Movies", "For You"];
  late final List<String> _newOnPosters;
  late final List<String> _youMayLikeTop;
  late final List<String> _youMayLikeBottom;
  int _selectedCategoryIndex = 1;

  @override
  void initState() {
    super.initState();
    _newOnPosters = _buildPosterSequence();
    _youMayLikeTop = _buildPosterSequence();
    _youMayLikeBottom = _buildPosterSequence();
  }

  List<String> _buildPosterSequence({int count = 12}) {
    final shuffled = List.of(_allPosters)..shuffle(_random);
    return List<String>.generate(
      count,
      (index) => shuffled[index % shuffled.length],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JunkieColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/logo.png", height: 44),
                          const SizedBox(width: 12),
                          const Text(
                            "Home",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: JunkieColors.text,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: JunkieColors.text.withOpacity(0.4), width: 1.4),
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(Icons.search, color: Colors.white, size: 26),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      _categories.length,
                      (index) => _categoryButton(
                        _categories[index],
                        selected: index == _selectedCategoryIndex,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 3,
                      width: 110,
                      decoration: BoxDecoration(
                        color: JunkieColors.accent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 26),
                _sectionTitle("New On Junkie Vibes"),
                _posterRail(_newOnPosters),
                _sectionTitle("You May Like"),
                _posterRail(_youMayLikeTop),
                _sectionTitle("You May Like"),
                _posterRail(_youMayLikeBottom),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _bottomNav(),
    );
  }

  Widget _categoryButton(String text, {bool selected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: JunkieColors.accent, width: 2),
        color: selected ? JunkieColors.accent.withOpacity(0.2) : Colors.transparent,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? JunkieColors.accent : JunkieColors.text,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: JunkieColors.text,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("See More", style: TextStyle(color: JunkieColors.accent)),
        ],
      ),
    );
  }

  Widget _posterRail(List<String> posters) {
    return SizedBox(
      height: 240,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: posters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) => _posterCard(posters[index]),
      ),
    );
  }

  Widget _posterCard(String assetPath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 180,
            width: 130,
            color: JunkieColors.card,
            child: Image.asset(assetPath, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 3,
          width: 80,
          decoration: BoxDecoration(
            color: JunkieColors.accent,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }

  Widget _bottomNav() {
    return BottomNavigationBar(
      backgroundColor: JunkieColors.background,
      selectedItemColor: JunkieColors.accent,
      unselectedItemColor: JunkieColors.text.withOpacity(0.6),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.change_history),
          label: "Soon&Hot",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "My Junkie"),
      ],
    );
  }
}
