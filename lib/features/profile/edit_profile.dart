import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController(text: "Taki");
  final _lastNameController = TextEditingController(text: "Choufa");
  final _emailController = TextEditingController(text: "taki@junkie.dev");
  final _phoneController = TextEditingController(text: "+213 555 123 456");
  final _bioController = TextEditingController(text: "Movie addict, show binger.");

  final List<String> _genres = const [
    "Action",
    "Sci-Fi",
    "Drama",
    "Horror",
    "Comedy",
    "Romance",
    "Documentary",
    "Anime",
    "Thriller",
  ];

  final Set<String> _selectedGenres = {"Action", "Sci-Fi", "Thriller"};

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    super.dispose();
  }

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
          style: TextStyle(color: JunkieColors.text, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 12),
                _avatarPicker(),
                const SizedBox(height: 24),
                _buildTextField(
                  controller: _firstNameController,
                  label: "First name",
                  icon: Icons.badge_outlined,
                  validator: (value) => value == null || value.isEmpty ? "First name required" : null,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _lastNameController,
                  label: "Last name",
                  icon: Icons.badge,
                  validator: (value) => value == null || value.isEmpty ? "Last name required" : null,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _emailController,
                  label: "Email",
                  icon: Icons.mail_outline,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Email required";
                    if (!value.contains("@")) return "Enter a valid email";
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _phoneController,
                  label: "Phone number",
                  icon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  validator: (value) => value == null || value.isEmpty ? "Phone number required" : null,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _bioController,
                  label: "Bio",
                  icon: Icons.notes_outlined,
                  maxLines: 3,
                ),
                const SizedBox(height: 22),
                Text(
                  "Preferred genres",
                  style: TextStyle(
                    color: JunkieColors.text.withOpacity(0.9),
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: _genres.map((genre) {
                    final selected = _selectedGenres.contains(genre);
                    return ChoiceChip(
                      label: Text(genre),
                      selected: selected,
                      labelStyle: TextStyle(
                        color: selected ? Colors.black : JunkieColors.text,
                        fontWeight: FontWeight.w600,
                      ),
                      backgroundColor: JunkieColors.card,
                      selectedColor: JunkieColors.accent,
                      onSelected: (_) {
                        setState(() {
                          if (selected) {
                            _selectedGenres.remove(genre);
                          } else {
                            _selectedGenres.add(genre);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 28),
                SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: JunkieColors.accent,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    onPressed: _saveProfile,
                    child: const Text("Save changes"),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _avatarPicker() {
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      JunkieColors.accent.withOpacity(0.9),
                      JunkieColors.accent.withOpacity(0.55),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: JunkieColors.accent.withOpacity(0.25),
                      blurRadius: 16,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
              ),
              Container(
                height: 124,
                width: 124,
                decoration: BoxDecoration(
                  color: JunkieColors.card,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white12, width: 1.2),
                ),
                child: const Icon(Icons.person, size: 70, color: JunkieColors.subtext),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: _changePhoto,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: JunkieColors.accent,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.camera_alt_outlined, color: Colors.black, size: 20),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: _changePhoto,
            style: TextButton.styleFrom(foregroundColor: JunkieColors.accent),
            child: const Text("Change profile picture"),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      maxLines: maxLines,
      style: const TextStyle(color: JunkieColors.text, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: JunkieColors.subtext.withOpacity(0.9)),
        prefixIcon: Icon(icon, color: JunkieColors.accent),
        filled: true,
        fillColor: JunkieColors.card,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: JunkieColors.accent, width: 1.4),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.white10.withOpacity(0.2)),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      ),
    );
  }

  void _changePhoto() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Photo picker coming soon"),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _saveProfile() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Profile updated: ${_firstNameController.text} ${_lastNameController.text}",
            style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w700),
          ),
          backgroundColor: JunkieColors.accent,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}
