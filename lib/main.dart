import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive/hive.dart';
import 'package:wise_clone/models/trans.dart';
import 'package:wise_clone/screens/home.dart';
import 'package:wise_clone/screens/main_view.dart';
import 'package:wise_clone/screens/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

FToast? fToast;
HexColor mainColor = HexColor('#87EA5C');
Box<DetailsData>? persons;

void main() async {
  image = null;
  imagePath = null;

  await Hive.initFlutter();
  Hive.registerAdapter(DetailsDataAdapter());
  persons = await Hive.openBox('trans');
  //  debugPrint('dummyData : $dummyData ');
  //  for (var element in dummyData) {
  //   persons?.add(element);
  //  }
  // getAllLocalTrans();
  // persons?.clear();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    fToast?.init(context);
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
  const SplashScreen({
    super.key,
  });

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
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainView(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#87EA5C'),
      body: Center(
          child: Image.asset(
        'images/logo.webp',
        height: 120,
        width: 120,
      )),
    );
  }
}

showMessage({String? msg,bool? sucsess}) {
  Fluttertoast.showToast(
      msg: msg ?? '',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: sucsess==true?Colors.green: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
