diff --git a/c:\Users\takie\OneDrive\Desktop\junkie_vibe\lib/features/search/search_screen.dart b/c:\Users\takie\OneDrive\Desktop\junkie_vibe\lib/features/search/search_screen.dart
new file mode 100644
--- /dev/null
+++ b/c:\Users\takie\OneDrive\Desktop\junkie_vibe\lib/features/search/search_screen.dart
@@ -0,0 +1,213 @@
+import 'package:flutter/material.dart';
+
+import '../../core/theme/colors.dart';
+import '../details/detail_screen.dart';
+import '../profile/profile_screen.dart';
+
+class SearchScreen extends StatelessWidget {
+  const SearchScreen({super.key});
+
+  List<Map<String, String>> get _recommendedTitles => const [
+        {"title": "Chilling Adventures Of Sabrina", "poster": "assets/poster4.jpg"},
+        {"title": "Sweet Tooth", "poster": "assets/poster5.jpg"},
+        {"title": "The Conjuring", "poster": "assets/poster6.jpg"},
+      ];
+
+  @override
+  Widget build(BuildContext context) {
+    return Scaffold(
+      backgroundColor: JunkieColors.background,
+      body: SafeArea(
+        child: SingleChildScrollView(
+          padding: const EdgeInsets.only(bottom: 24),
+          child: Column(
+            crossAxisAlignment: CrossAxisAlignment.start,
+            children: [
+              _header(context),
+              const SizedBox(height: 12),
+              _searchField(),
+              const SizedBox(height: 16),
+              Padding(
+                padding: const EdgeInsets.symmetric(horizontal: 20),
+                child: Text(
+                  "Recommended On Junkie Vibes",
+                  style: const TextStyle(
+                    color: JunkieColors.text,
+                    fontWeight: FontWeight.w800,
+                    fontSize: 16,
+                  ),
+                ),
+              ),
+              const SizedBox(height: 12),
+              ..._recommendedTitles
+                  .map(
+                    (item) => _searchResultTile(
+                      context,
+                      title: item["title"]!,
+                      posterPath: item["poster"]!,
+                    ),
+                  )
+                  .expand((widget) => [widget, const SizedBox(height: 12)])
+                  .toList()
+                ..removeLast(),
+            ],
+          ),
+        ),
+      ),
+      bottomNavigationBar: _bottomNav(context),
+    );
+  }
+
+  Widget _header(BuildContext context) {
+    return Padding(
+      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
+      child: Row(
+        mainAxisAlignment: MainAxisAlignment.spaceBetween,
+        children: [
+          Column(
+            crossAxisAlignment: CrossAxisAlignment.start,
+            children: [
+              Text(
+                "search page",
+                style: TextStyle(
+                  color: JunkieColors.text.withOpacity(0.65),
+                  fontWeight: FontWeight.w600,
+                  fontSize: 13,
+                ),
+              ),
+              const SizedBox(height: 8),
+              Image.asset("assets/logo.png", height: 70),
+            ],
+          ),
+          IconButton(
+            icon: const Icon(Icons.close, color: JunkieColors.text, size: 26),
+            onPressed: () => Navigator.of(context).pop(),
+          ),
+        ],
+      ),
+    );
+  }
+
+  Widget _searchField() {
+    return Padding(
+      padding: const EdgeInsets.symmetric(horizontal: 20),
+      child: Container(
+        decoration: BoxDecoration(
+          color: JunkieColors.card,
+          borderRadius: BorderRadius.circular(24),
+          border: Border.all(color: JunkieColors.text.withOpacity(0.15), width: 1),
+        ),
+        padding: const EdgeInsets.symmetric(horizontal: 16),
+        child: const TextField(
+          style: TextStyle(color: JunkieColors.text),
+          decoration: InputDecoration(
+            icon: Icon(Icons.search, color: JunkieColors.text, size: 22),
+            hintText: "Search",
+            hintStyle: TextStyle(color: JunkieColors.subtext),
+            border: InputBorder.none,
+          ),
+        ),
+      ),
+    );
+  }
+
+  Widget _searchResultTile(
+    BuildContext context, {
+    required String title,
+    required String posterPath,
+  }) {
+    return Padding(
+      padding: const EdgeInsets.symmetric(horizontal: 20),
+      child: Column(
+        crossAxisAlignment: CrossAxisAlignment.start,
+        children: [
+          Row(
+            children: [
+              GestureDetector(
+                onTap: () => Navigator.of(context).push(
+                  MaterialPageRoute(
+                    builder: (_) => DetailScreen(posterPath: posterPath, title: title),
+                  ),
+                ),
+                child: ClipRRect(
+                  borderRadius: BorderRadius.circular(6),
+                  child: Image.asset(
+                    posterPath,
+                    height: 100,
+                    width: 140,
+                    fit: BoxFit.cover,
+                  ),
+                ),
+              ),
+              const SizedBox(width: 14),
+              Expanded(
+                child: Text(
+                  title,
+                  style: const TextStyle(
+                    color: JunkieColors.text,
+                    fontSize: 15,
+                    fontWeight: FontWeight.w700,
+                  ),
+                ),
+              ),
+              Container(
+                decoration: BoxDecoration(
+                  shape: BoxShape.circle,
+                  border: Border.all(color: JunkieColors.accent, width: 2),
+                ),
+                child: IconButton(
+                  icon: const Icon(Icons.play_arrow, color: JunkieColors.accent),
+                  onPressed: () => Navigator.of(context).push(
+                    MaterialPageRoute(
+                      builder: (_) => DetailScreen(posterPath: posterPath, title: title),
+                    ),
+                  ),
+                ),
+              ),
+            ],
+          ),
+          const SizedBox(height: 12),
+          Container(
+            height: 4,
+            width: double.infinity,
+            decoration: BoxDecoration(
+              color: JunkieColors.accent,
+              borderRadius: BorderRadius.circular(10),
+            ),
+          ),
+        ],
+      ),
+    );
+  }
+
+  Widget _bottomNav(BuildContext context) {
+    return BottomNavigationBar(
+      backgroundColor: JunkieColors.background,
+      selectedItemColor: JunkieColors.accent,
+      unselectedItemColor: JunkieColors.text.withOpacity(0.6),
+      currentIndex: 0,
+      onTap: (index) {
+        if (index == 0) {
+          Navigator.of(context).pop();
+        } else if (index == 1) {
+          ScaffoldMessenger.of(context).showSnackBar(
+            const SnackBar(
+              content: Text("Soon & Hot coming soon"),
+              behavior: SnackBarBehavior.floating,
+              duration: Duration(seconds: 2),
+            ),
+          );
+        } else if (index == 2) {
+          Navigator.of(context).push(
+            MaterialPageRoute(builder: (_) => const ProfileScreen()),
+          );
+        }
+      },
+      items: const [
+        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
+        BottomNavigationBarItem(icon: Icon(Icons.change_history), label: "Soon&Hot"),
+        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "My Junkie"),
+      ],
+    );
+  }
+}
