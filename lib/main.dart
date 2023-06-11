import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_x_launches/domain/page_provider.dart';
import 'package:space_x_launches/presentation/main_page.dart';


void main() {
  runApp(const MyApp());
}

///Start of application with main settings
class MyApp extends StatelessWidget {
  ///Constructor
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PageNumberProvider(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
            background: Colors.black,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            titleTextStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          useMaterial3: true,
        ),
        home: const MainPage(),
      ),
    );
  }
}
