import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JunkieColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _topBar(context),
              const SizedBox(height: 20),
              _avatar(),
              const SizedBox(height: 18),
              Text(
                "TakiEddineChoufa , 25 / 84",
                style: TextStyle(
                  color: JunkieColors.text.withOpacity(0.75),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Taki Eddine Choufa",
                style: TextStyle(
                  color: JunkieColors.text,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "+  Add Bio",
                style: TextStyle(
                  color: JunkieColors.text.withOpacity(0.7),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 26),
              Container(
                height: 4,
                width: 120,
                decoration: BoxDecoration(
                  color: JunkieColors.accent.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 32),
              _quickActionsGrid(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _bottomNav(context),
    );
  }

  Widget _topBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.notifications_none, color: JunkieColors.accent, size: 28),
          onPressed: () {},
        ),
        Image.asset("assets/logo.png", height: 44),
        IconButton(
          icon: Icon(Icons.edit, color: JunkieColors.accent, size: 26),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const EditProfileScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget _avatar() {
    return Container(
      height: 170,
      width: 170,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            JunkieColors.accent.withOpacity(0.9),
            JunkieColors.accent.withOpacity(0.6),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: JunkieColors.accent.withOpacity(0.2),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: const Center(
        child: Icon(Icons.person, size: 90, color: Colors.black87),
      ),
    );
  }

  Widget _quickActionsGrid() {
    final items = [
      (Icons.people, "Community"),
      (Icons.favorite, "My Vibes"),
      (Icons.chat, "Chat"),
      (Icons.add, "Add A Post"),
      (Icons.star, "My Reviews"),
      (Icons.bar_chart, "My Stats"),
    ];

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 18,
      runSpacing: 18,
      children: items
          .map(
            (item) => _actionButton(
              icon: item.$1,
              label: item.$2,
            ),
          )
          .toList(),
    );
  }

  Widget _actionButton({required IconData icon, required String label}) {
    return Container(
      width: 100,
      height: 90,
      decoration: BoxDecoration(
        color: JunkieColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: JunkieColors.accent.withOpacity(0.5), width: 1.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 26, color: JunkieColors.accent),
          const SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: JunkieColors.text,
              fontWeight: FontWeight.w600,
              fontSize: 12,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomNav(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: JunkieColors.background,
      selectedItemColor: JunkieColors.accent,
      unselectedItemColor: JunkieColors.text.withOpacity(0.6),
      currentIndex: 2,
      onTap: (index) {
        if (index == 0) {
          Navigator.of(context).pop();
        } else if (index == 1) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Menu coming soon"),
              behavior: SnackBarBehavior.floating,
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.change_history), label: "Menu"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "My Junkie"),
      ],
    );
  }
}
