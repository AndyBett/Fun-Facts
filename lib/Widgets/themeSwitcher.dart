import 'package:flutter/material.dart';
import 'package:funfacts/Providers/themeProvider.dart';
import 'package:provider/provider.dart';

class Themeswitcher extends StatefulWidget {
  const Themeswitcher({super.key});

  @override
  State<Themeswitcher> createState() => _ThemeswitcherState();
}

class _ThemeswitcherState extends State<Themeswitcher> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Theme Mode",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Switch(
                  value: themeProvider.isDarkModeChecked,
                  onChanged: (value) {
                    themeProvider.updateMode(darkMode: value);
                  }),
              SizedBox(
                width: 20,
              ),
              Text(themeProvider.isDarkModeChecked ? "Dark Mode" : "Light Mode")
            ],
          ),
        ],
      ),
    );
  }
}
