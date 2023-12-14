import 'package:flutter/material.dart';
import 'package:wise_clone/main.dart';

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
        leading: circlName(),
        actions: [
          Container(
            // height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Text('Earn £ 50'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
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
            SizedBox(
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

                SizedBox(width: 20,),
                Text('No transaction yet',style: TextStyle(color: Colors.grey,fontSize: 18),)
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Excahnge rate',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),

            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset('images/chart.png'),
            )
          ],
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
