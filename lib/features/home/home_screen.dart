import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JunkieColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
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
                        Image.asset("assets/logo.png", height: 40),
                        const SizedBox(width: 10),
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
                    const Icon(Icons.search, color: Colors.white, size: 32),
                  ],
                ),
              ),

            
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _categoryButton("Shows"),
                    _categoryButton("Movies"),
                    _categoryButton("For You"),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 3,
                  width: 90,
                  color: JunkieColors.accent,
                ),
              ),

              const SizedBox(height: 25),

              
              _sectionTitle("New On Junkie Vibes"),
              _posterList(),

              
              _sectionTitle("Trending"),
              _posterList(),

            
              _sectionTitle("You May Like"),
              _posterList(),

              const SizedBox(height: 20),
            ],
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

  Widget _posterList() {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Poster Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 160,
                  width: 110,
                  color: JunkieColors.card,
                  child: Image.asset(
                    "assets/poster${(index % 4) + 1}.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Orange line under poster
              Container(
                height: 3,
                width: 85,
                color: JunkieColors.accent,
              )
            ],
          );
        },
      ),
    );
  }

  Widget _bottomNav() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.change_history),
          label: "Soon&Hot",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "My Junkie"),
      ],
    );
  }
}
