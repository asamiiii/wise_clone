import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wise_clone/screens/main_view.dart';
import 'package:wise_clone/screens/widgets.dart';

HexColor mainColor = HexColor('#87EA5C');

void main() {
  image = null;
    imagePath = null;
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wise',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key,});

 

  @override
  State<SplashScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreen> {

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    checkFirstSeen();
  }

  Future checkFirstSeen() async {
    await Future.delayed(const Duration(seconds: 1));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const MainView(),));
   
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#87EA5C'),
      body:  Center(
        child: Image.asset('images/logo.webp',height: 120,width: 120,)
      ),
    );
  }
}
