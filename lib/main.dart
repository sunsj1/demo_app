import 'package:demo_app/firebase_options.dart';
import 'package:demo_app/screens/stepper_form.screen.dart';
import 'package:demo_app/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      home:  RegisterRecords(),
    );
  }
}


