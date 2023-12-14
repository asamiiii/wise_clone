import 'package:flutter/material.dart';
import 'package:wise_clone/main.dart';
import 'package:wise_clone/settings.dart';

List<String> imagesList=[
  'images/1.png',
  'images/2.png',
  'images/3.png',
  'images/4.png',
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true, // no color affect when scrolling
        automaticallyImplyLeading:false ,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen(),));
          },
          child: circlName()),
        actions: [
          const SizedBox(width: 10,),
          radiusButton(txt: 'Earn £ 50'),
          const SizedBox(width: 10,),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Account',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Text(
                    'Transactions',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    'See all',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    child: Icon(
                      Icons.watch_later_outlined,
                      color: Colors.grey[500],
                    ),
                  ),
        
                  const SizedBox(width: 20,),
                  const Text('No transaction yet',style: TextStyle(color: Colors.grey,fontSize: 18),)
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Excahnge rate',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
        
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset('images/chart.png'),
              ),
              SizedBox(height: 25,),
              const Text(
                'Do more with Wise',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
        SizedBox(height: 15,),
              Container(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(imagesList[index],width: 200,height: 150,fit: BoxFit.fill,));
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: imagesList.length,
                ),
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}

Widget circlName() {
  return Container(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          CircleAvatar(
              backgroundColor: Colors.grey[200], child: const Text('As')),
          Positioned(
            top: 2,
            right: 2,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(25)),
            ),
          )
        ],
      ));
}

Widget radiusButton({required String? txt}){
 return Container(
            // height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child:Text(txt ?? ''),
          );
}
