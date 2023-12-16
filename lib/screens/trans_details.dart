import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:wise_clone/screens/home.dart';

class TransDetails extends StatefulWidget {
  const TransDetails({super.key});

  @override
  State<TransDetails> createState() => _TransDetailsState();
}

class _TransDetailsState extends State<TransDetails> {
  int? currentIndex = 0;
  List<Widget> sectionsList=[updatesSection(),detailsSection()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#eeefea'),
        forceMaterialTransparency: true,
        leading: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                  // radius: 35,
                  backgroundColor: Colors.grey[200],
                  child: const Icon(Icons.close)),
            )),
        actions: [
          const SizedBox(
            width: 20,
          ),
          Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(Icons.question_mark_sharp)),
          const SizedBox(
            width: 20,
          ),
          const Icon(Icons.more_vert),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.grey[300],
                      child: const Icon(Icons.arrow_upward),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Sent',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '11.90 USD',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Ahmed Sami',
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          right: 13, left: 5, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.grey[200],
                              child: Icon(
                                Icons.category_outlined,
                                size: 20,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Text('General'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ToggleSwitch(
                      minWidth: 230.0,
                      minHeight: 60.0,
                      fontSize: 16.0,
                      initialLabelIndex: currentIndex,
                      activeBgColor: [HexColor('#eeefea')],
                      activeFgColor: Colors.black,
                      inactiveBgColor: HexColor('#eeefea'),
                      inactiveFgColor: Colors.grey[500],
                      totalSwitches: 2,
                      labels: const ['Updates', 'Details'],
                      onToggle: (index) {
                        currentIndex = index;
                        setState(() {});
                        debugPrint('switched to: $index');
                      },
                    ),
                  ],
                ),
              ],
            ),
            sectionsList[currentIndex??0]
          ],
        ),
      ),
    );
  }
}

Widget updatesSection() {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Transfer timeline',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //? Time Line Item
          timeLineItem(),
          timeLineItem(),
          timeLineItem(),
          timeLineItem(lastItem: true),
          
        ],
      ),
    ),
  );
}

Widget detailsSection (){
  return SizedBox();
}


Widget timeLineItem({bool? lastItem=false}){
  return Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.done),
                  lastItem==false? Container(
                    width: 2,
                    height: 40,
                    color: Colors.grey,
                  ):const SizedBox(height: 40,)
                ],
              ),
              const SizedBox(width: 20,),
               Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Today at 2:23 p.m.'),
                  Text(lastItem == false ?'You set up your transfer':'Your transfers complete'),
                  const SizedBox(height: 10,)
                ],
              )
            ],
          );
}
