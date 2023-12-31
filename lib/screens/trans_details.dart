
import 'dart:math';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:wise_clone/models/trans.dart';
// int? serialNumb = 0;
class TransDetails extends StatefulWidget {
   TransDetails({super.key,this.data});
  DetailsData? data;
  @override
  State<TransDetails> createState() => _TransDetailsState();
}

class _TransDetailsState extends State<TransDetails> {
  int? currentIndex = 0;
  

  @override
  void initState() {
    debugPrint('id : ${widget.data?.time}');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> sectionsList=[updatesSection(widget.data!.time!),detailsSection(data: widget.data)];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor('#eeefea'),
        // foregroundColor: HexColor('#eeefea'),
        surfaceTintColor: HexColor('#eeefea'),
        // forceMaterialTransparency: true,
        // automaticallyImplyLeading:false ,
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color:HexColor('#eeefea') ,
              child: Column(
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
                      child:  Icon(widget.data?.sent==true?Icons.arrow_upward:Icons.arrow_downward,size: 40,),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     Text(
                      widget.data?.sent==true? 'Sent':'Recived',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     Text(
                      '${widget.data?.ammount} USD',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     Text(
                      '${widget.data?.userName}',
                      style: const TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 35,
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
                            width: 5,
                          ),
                          Text('General'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
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
                      customTextStyles: [TextStyle(fontWeight: FontWeight.w500)],
                      labels: const ['Updates', 'Details'],
                      onToggle: (index) {
                        currentIndex = index;
                        setState(() {});
                        debugPrint('switched to: $index');
                      },
                    ),
                    Row(
                      children: [
                        currentIndex==0? Container(
                          color: Colors.black,
                          height: 3,
                          width: MediaQuery.of(context).size.width*0.50,
                        ):SizedBox(width: MediaQuery.of(context).size.width*0.50),
                        // const SizedBox(width: 50,),
                         currentIndex==1? Container(
                          color: Colors.black,
                          height: 3,
                          width: MediaQuery.of(context).size.width*0.50,
                        ):SizedBox(width: MediaQuery.of(context).size.width*0.50),
                      ],
                    )
                  ],
                ),
              ],
            ),
                ],
              ),
            ),
            sectionsList[currentIndex??0]
          ],
        ),
      ),
    );
  }
}

Widget updatesSection(DateTime time) {
  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
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
          timeLineItem(time),
          timeLineItem(time),
          timeLineItem(time),
          timeLineItem(lastItem: true,time),

          SizedBox(height: 30,),

          Container(
                      height: 50,
                      padding: const EdgeInsets.only(
                          right: 13, left: 5, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          
                          Text('Repeat this transfer',style: TextStyle(fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),
SizedBox(height: 15,),

                    Container(
                      height: 50,
                      padding: const EdgeInsets.only(
                          right: 13, left: 5, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          
                          Text('Rate the app',style: TextStyle(fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),
          
        ],
      ),
    ),
  );
}

Widget detailsSection ({DetailsData? data}){
  return SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Transaction data',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                      data?.sent==true? 'You  sent':'You  recived',
                      // style: TextStyle(color: Colors.black54),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      '${data?.ammount} USD',
                      // style: TextStyle(color: Colors.black54),
                    ),
            ],
          ),
SizedBox(height: 15,),
          Row(
            children: [
              Text(
                      'Our commission',
                      // style: TextStyle(color: Colors.black54),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      '0 USD',
                      // style: TextStyle(color: Colors.black54),
                    ),
            ],
          ),
        const SizedBox(height: 20,),
          // const Divider(
          //   color: Colors.black,),
          const DottedLine(),
            const SizedBox(height: 20,),
          Row(
            children: [
              Text(
                      data?.sent==true? '${data?.userName} has received':'${data?.userName} has Sent',
                      // style: TextStyle(color: Colors.black54),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      '${data?.ammount} USD',
                      // style: TextStyle(color: Colors.black54),
                    ),
            ],
          ),
          const SizedBox(height: 20,),
          // Divider(
          //   color: Colors.black,),
          const DottedLine(),
            SizedBox(height: 20,),
             Row(
            children: [
              const Text(
                      'Transaction number',
                      // style: TextStyle(color: Colors.black54),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      '#${data?.id}',
                      // style: TextStyle(color: Colors.black54),
                    ),
            ],
          ),
          SizedBox(height: 20,),
          Container(
                      height: 50,
                      padding: const EdgeInsets.only(
                          right: 13, left: 5, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          
                          Text('Download transfer receipt',style: TextStyle(fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,)
        ],
      ),
    ),
  );
}


Widget timeLineItem(DateTime? time,{bool? lastItem=false}){
  String formattedDate = DateFormat('yyyy-MM-dd').format(time!);
  String formattedTime= DateFormat('kk:mm').format(time);
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
                   Text('$formattedDate at $formattedTime'),
                  Text(lastItem == false ?'You set up your transfer':'Your transfers complete',style: TextStyle(fontWeight: lastItem == true? FontWeight.bold:FontWeight.normal),),
                  const SizedBox(height: 10,)
                ],
              )
            ],
          );
}
