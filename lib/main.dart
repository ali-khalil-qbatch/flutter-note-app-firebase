import 'package:flutter/material.dart';
import 'package:learning_flutter/constants/routes.dart' as routes;
import 'package:learning_flutter/views/dashboard.dart';
import 'package:learning_flutter/views/forgot_password.dart';
import 'package:learning_flutter/views/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        routes.loginRoute: (context) => const LoginView(),
        routes.dashboardRoute: (context) => const DashboardView(),
        routes.forgotPassRoute: (context) => const ForgotPasswordView(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // future: Future.delayed(const Duration(seconds: 2)),
      future: Future.value(1),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return const LoginView();
          default:
            return getLoader();
        }
      },
    );
  }
}

Widget getLoader() {
  return Container(
    color: Colors.white,
    child: const Center(
      child: CircularProgressIndicator(color: Colors.green),
    ),
  );
}
