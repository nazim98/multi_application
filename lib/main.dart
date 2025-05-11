import 'package:flutter/material.dart';
import 'package:flutter_workshop/screens/bmi_screen.dart';
import 'package:flutter_workshop/screens/calc_screen.dart';
import 'package:flutter_workshop/screens/color_screen.dart';
import 'package:flutter_workshop/screens/dialog_screen.dart';
import 'package:flutter_workshop/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = context.watch<ThemeProvider>().darkMode;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currIndex = 2;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = context.watch<ThemeProvider>().darkMode;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.read<ThemeProvider>().toggleTheme();
          },
          icon: isDarkMode ? Icon(Icons.light_mode) : Icon(Icons.dark_mode),
        ),
        title: Center(
          child: Text(
            'MULTI-APPLICATION',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo),
          ),
        ),
      ),
      body:
          [ColorScreen(), CalcScreen(), DialogScreen(), BmiScreen()][currIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currIndex,
        destinations: [
          NavigationDestination(icon: Icon(Icons.color_lens), label: 'Colors'),
          NavigationDestination(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
          NavigationDestination(icon: Icon(Icons.chat_bubble), label: 'Dialog'),
          NavigationDestination(icon: Icon(Icons.add_chart), label: 'BMI'),
        ],
        onDestinationSelected: (index) {
          setState(() {
            currIndex = index;
          });
        },
      ),
    );
  }
}
