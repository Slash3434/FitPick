import 'package:fitpick/constants/colors.dart';
import 'package:fitpick/widgets/Preferences_submit.dart';
import 'package:flutter/material.dart';

class PreferencesLayout extends StatefulWidget {
  const PreferencesLayout({super.key});

  @override
  State<PreferencesLayout> createState() => _PreferencesLayoutState();
}

class _PreferencesLayoutState extends State<PreferencesLayout> {

  String? Gender;
  String? Size;
  String? PriceRange;
  String? Type;
  String? Age;

  final List<String> gender = ["Male", "Female", "Other"];
  final List<String> size = ["S", "M", "L", "XL", "XXL", "XXL+"];
  final List<String> priceRange = ["\$10-\$25", "\$30-\$50", "\$50-\$100", "\$100+"];
  final List<String> type = ["Sports Wear", "Luxery", "Casual", "Accessories"];
  final List<String> age = ["13-18", "18-25", "25-40", "40-60", "60+"];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ShaderMask(
          shaderCallback: (bounds) =>
              AppColors.secondaryGradient.createShader(bounds),
          child: const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "FitPick",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "What are you like?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Select Gender:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              hint: const Text("Choose..."),
              value: Gender,
              isExpanded: true, // ✅ Makes the dropdown take full width
              items: gender.map(buildMenuItem).toList(),
              onChanged: (value) => setState(() => this.Gender = value),
            ),
            const Text(
              "Select Size:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              hint: const Text("Choose..."),
              value: Size,
              isExpanded: true, // ✅ Makes the dropdown take full width
              items: size.map(buildMenuItem).toList(),
              onChanged: (value) => setState(() => this.Size = value),
            ),
            const Text(
              "Select Price Range:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              hint: const Text("Choose..."),
              value: PriceRange,
              isExpanded: true, // ✅ Makes the dropdown take full width
              items: priceRange.map(buildMenuItem).toList(),
              onChanged: (value) => setState(() => this.PriceRange = value),
            ),
            const Text(
              "Select Type:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              hint: const Text("Choose..."),
              value: Type,
              isExpanded: true, // ✅ Makes the dropdown take full width
              items: type.map(buildMenuItem).toList(),
              onChanged: (value) => setState(() => this.Type = value),
            ),
            const Text(
              "Select Age Group:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              hint: const Text("Choose..."),
              value: Age,
              isExpanded: true, // ✅ Makes the dropdown take full width
              items: age.map(buildMenuItem).toList(),
              onChanged: (value) => setState(() => this.Age = value),
            ),
            const SizedBox(height: 20),
            PreferencesSubmit()
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}
