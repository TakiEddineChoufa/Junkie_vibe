import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';

class DetailScreen extends StatelessWidget {
  final String posterPath;
  final String? title;
  final String? typeLabel;

  const DetailScreen({
    super.key,
    required this.posterPath,
    this.title,
    this.typeLabel,
  });

  String get _displayTitle => title ?? "The last kingdom";
  String get _displayType => typeLabel ?? "TV SHOW";

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
              _topBar(context),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        _displayTitle,
                        style: const TextStyle(
                          color: JunkieColors.text,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      _displayType,
                      style: const TextStyle(
                        color: JunkieColors.text,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              _heroImage(),
              const SizedBox(height: 14),
              _statusRow(),
              const SizedBox(height: 16),
              _ratingRow(),
              const SizedBox(height: 16),
              _descriptionBlock(),
              const SizedBox(height: 16),
              _dropdownRow(),
              const SizedBox(height: 28),
              _bottomActions(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _bottomNav(context),
    );
  }

  Widget _topBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: JunkieColors.text, size: 28),
            onPressed: () => Navigator.of(context).pop(),
          ),
          Image.asset("assets/logo.png", height: 52),
          const SizedBox(width: 40), // spacer to mirror back button width
        ],
      ),
    );
  }

  Widget _heroImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Image.asset(
        posterPath,
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _statusRow() {
    final items = [
      (Icons.favorite_border, "Add To My Vibes"),
      (Icons.check_circle, "I Finished"),
      (Icons.task_alt, "On My Way"),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items
            .map(
              (item) => Column(
                children: [
                  Icon(item.$1, color: JunkieColors.accent, size: 32),
                  const SizedBox(height: 6),
                  Text(
                    item.$2,
                    style: TextStyle(
                      color: JunkieColors.text.withOpacity(0.85),
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _ratingRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _percentBadge(label: "89 %", icon: Icons.thumb_up_alt_outlined),
          _percentBadge(label: "11 %", icon: Icons.thumb_down_alt_outlined),
        ],
      ),
    );
  }

  Widget _percentBadge({required String label, required IconData icon}) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: JunkieColors.text,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 8),
        Icon(icon, color: JunkieColors.accent, size: 22),
      ],
    );
  }

  Widget _descriptionBlock() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "description",
            style: TextStyle(
              color: JunkieColors.text,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: JunkieColors.text.withOpacity(0.25), width: 1),
            ),
            child: const Text(
              "The Last Kingdom is a series of novels by Bernard Cornwell and a popular television show that tells the story of Uhtred of Bebbanburg, a Saxon lord who was raised by Danish Vikings. Set in 9th-century England during the Viking invasions, the narrative follows Uhtred as he is torn between his dual loyalties to the Anglo-Saxons and the Danes, ultimately becoming a pivotal figure in the efforts to unite England under King Alfred.",
              style: TextStyle(
                color: JunkieColors.text,
                height: 1.4,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dropdownRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _pillButton(label: "seasons"),
          _pillButton(label: "episodes"),
        ],
      ),
    );
  }

  Widget _pillButton({required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: JunkieColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: JunkieColors.text.withOpacity(0.35), width: 1),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: JunkieColors.text,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 10),
          Icon(Icons.keyboard_arrow_down, color: JunkieColors.text.withOpacity(0.7)),
        ],
      ),
    );
  }

  Widget _bottomActions() {
    final items = [
      (Icons.add_circle_outline, "Add A\nREVIEW"),
      (Icons.forum_outlined, "Check  The\nReviews"),
      (Icons.groups, "Community Of\nThe Show"),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items
            .map(
              (item) => Column(
                children: [
                  Icon(item.$1, color: JunkieColors.accent, size: 32),
                  const SizedBox(height: 8),
                  Container(
                    height: 3,
                    width: 60,
                    decoration: BoxDecoration(
                      color: JunkieColors.accent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.$2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: JunkieColors.text.withOpacity(0.85),
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _bottomNav(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: JunkieColors.background,
      selectedItemColor: JunkieColors.accent,
      unselectedItemColor: JunkieColors.text.withOpacity(0.6),
      currentIndex: 1,
      onTap: (index) {
        if (index == 0) {
          Navigator.of(context).popUntil((route) => route.isFirst);
        } else if (index == 2) {
          Navigator.of(context).pop();
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
