import 'package:flutter/material.dart';
import 'src/screens/driver_dispatch_screen.dart';

void main() {
  runApp(const RouteFlowApp());
}

class RouteFlowApp extends StatelessWidget {
  const RouteFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RouteFlow Driver Dispatch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        cardColor: const Color(0xFF1E293B),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF3B82F6),
          secondary: Color(0xFF10B981),
          surface: Color(0xFF1E293B),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0F172A),
          elevation: 0,
        ),
      ),
      home: const DriverDispatchScreen(),
    );
  }
}
