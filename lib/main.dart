import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Wise',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        );
      },
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
    WidgetsBinding.instance.addPostFrameCallback((_)async {
    await checkFirstSeen();
  });
   
    super.initState();
  }


Future<void> checkFirstSeen() async {
  bool? isAuth=false;
  await showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder:(context, setState) =>  Container(
          height: 250.h,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height: 10,),
              Text('Wise',style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              Text('Use your fingerprint to continue',),
              SizedBox(height: 10,),
              Text('Unlock to login',),
              SizedBox(height: 10,),
              TextButton(
                onPressed: () async{
                  setState(() {});
                  isAuth=true;
                  await Future.delayed(Duration(seconds: 1));
                  Navigator.pop(context); // Close the modal sheet
                  openMainView(); // Open the main view
                },
                child:isAuth==false? Image.asset('images/fp.png',width: 50.w,height: 50.h,):Image.asset('images/check.png',width: 50.w,height: 50.h,),
              ),
              Expanded(child: SizedBox()),
              Text('Touch the fingerprint sensor'),
              Row(
                children: [
                  TextButton(onPressed: (){}, child: Text('Use PIN')),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}

void openMainView() {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => MainView(),
    ),
  );
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

showMessage({String? msg, bool? sucsess}) {
  Fluttertoast.showToast(
      msg: msg ?? '',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: sucsess == true ? Colors.green : Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
