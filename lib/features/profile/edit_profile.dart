import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JunkieColors.background,
      appBar: AppBar(
        backgroundColor: JunkieColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: JunkieColors.text),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: JunkieColors.text),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Edit profile coming soon",
          style: TextStyle(color: JunkieColors.text),
        ),
      ),
    );
  }
}
