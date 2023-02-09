import 'package:flutter/material.dart';
import 'package:listinha/src/home/home_page.dart';

part 'package:listinha/src/shared/themes/color_schemes.g.dart';
part 'package:listinha/src/shared/themes/themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const HomePage(),
    );
  }
}
