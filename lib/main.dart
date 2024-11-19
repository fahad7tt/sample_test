import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: const [
        // ChangeNotifierProvider(create: (_) => BeneficiaryProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        // '/home': (context) => HomeScreen(),
      },
    );
  }
}
