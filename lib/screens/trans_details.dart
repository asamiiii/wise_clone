import 'dart:math';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:wise_clone/models/trans.dart';

// int? serialNumb = 0;
class TransDetails extends StatefulWidget {
  TransDetails({super.key, this.data,this.iBan});
  String? iBan;
  DetailsData? data;
  @override
  State<TransDetails> createState() => _TransDetailsState();
}

class _TransDetailsState extends State<TransDetails> {
  int? currentIndex = 0;

  @override
  void initState() {
    if (widget.data?.sent == false) {
      currentIndex = 1;
    }
    
    debugPrint('id : ${widget.data?.time}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> sectionsList = [
      updatesSection(widget.data!.time!, widget.data!),
      detailsSection(data: widget.data,iBAN: widget.iBan)
    ];
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
              color: HexColor('#eeefea'),
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
                            child: Icon(
                              widget.data?.sent == true
                                  ? Icons.arrow_upward
                                  : Icons.arrow_downward,
                              size: 40,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.data?.sent == true ? 'Sent' : 'Recived',
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${widget.data?.sent == true ? '-' : '+'} ${widget.data?.ammount} ${widget.data?.accountType == 1 ? 'EUR' : widget.data?.accountType == 2 ? 'USD' : 'GBP'}',
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
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            padding: const EdgeInsets.only(
                                right: 13, left: 5, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(25)),
                            child: Row(
                              children: [
                                CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.grey[400],
                                    child: widget.data?.sent == true
                                        ? Image.asset(
                                            'images/cat.png',
                                            width: 15,
                                            height: 15,
                                          )
                                        : const Icon(Icons.add)),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(widget.data?.sent == true
                                    ? 'General'
                                    : 'Money added'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          widget.data?.sent == true
                              ? ToggleSwitch(
                                  minWidth: 230.0,
                                  minHeight: 60.0,
                                  fontSize: 16.0,
                                  initialLabelIndex: currentIndex,
                                  activeBgColor: [HexColor('#eeefea')],
                                  activeFgColor: Colors.black,
                                  inactiveBgColor: HexColor('#eeefea'),
                                  inactiveFgColor: Colors.grey[500],
                                  totalSwitches: 2,
                                  customTextStyles: [
                                    TextStyle(fontWeight: FontWeight.w500)
                                  ],
                                  labels: const ['Updates', 'Details'],
                                  onToggle: (index) {
                                    currentIndex = index;
                                    setState(() {});
                                    debugPrint('switched to: $index');
                                  },
                                )
                              : const SizedBox(),
                          widget.data?.sent == true
                              ? Row(
                                  children: [
                                    currentIndex == 0
                                        ? Container(
                                            color: Colors.black,
                                            height: 3,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.50,
                                          )
                                        : SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.50),
                                    // const SizedBox(width: 50,),
                                    currentIndex == 1
                                        ? Container(
                                            color: Colors.black,
                                            height: 3,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.50,
                                          )
                                        : SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.50),
                                  ],
                                )
                              : const SizedBox()
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            sectionsList[currentIndex ?? 0]
          ],
        ),
      ),
    );
  }
}

Widget updatesSection(DateTime time, DetailsData data) {
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
          timeLineItem(time, msg: 'You set up your transfer'),
          timeLineItem(time,
              msg:
                  'You used ${data.accountType == 1 ? 'USD' : data.accountType == 2 ? 'EUR' : 'GBP'} in your Wise account'),
          timeLineItem(time,
              msg:
                  'We paid out your ${data.accountType == 1 ? 'USD' : data.accountType == 2 ? 'EUR' : 'GBP'}'),
          timeLineItem(
              lastItem: true,
              time,
              msg: '',
              amount: data.ammount,
              accountType: data.accountType,
              person: data.userName),

          SizedBox(
            height: 30,
          ),

          Container(
            height: 50,
            padding:
                const EdgeInsets.only(right: 13, left: 5, top: 5, bottom: 5),
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Repeat this transfer',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),

          Container(
            height: 50,
            padding:
                const EdgeInsets.only(right: 13, left: 5, top: 5, bottom: 5),
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Rate the app',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget detailsSection({DetailsData? data,String? iBAN}){
  // String inputDateTimeString = '2024-01-20 20:23:00.000';
  DateTime inputDateTime = DateTime.parse(data!.time.toString());

  DateFormat outputDateFormat = DateFormat('EEEE, d MMMM yyyy', 'en_US');
  String outputDateString = outputDateFormat.format(inputDateTime);
  debugPrint('time : $outputDateString');
  return SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Transaction details',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          DottedLine(),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                data?.sent == true ? 'You  sent' : 'You  recived',
                // style: TextStyle(color: Colors.black54),
              ),
              Expanded(child: SizedBox()),
              Text(
                '${data?.ammount} ${data?.accountType == 1 ? 'EUR' : data?.accountType == 2 ? 'USD' : 'GBP'}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          data?.sent == true
              ? SizedBox(
                  height: 15,
                )
              : SizedBox(),
          data?.sent == true
              ? Row(
                  children: [
                    Text(
                      'Our commission',
                      // style: TextStyle(color: Colors.black54),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      '0 ${data?.accountType == 1 ? 'EUR' : data?.accountType == 2 ? 'USD' : 'GBP'}',
                      // style: TextStyle(color: Colors.black54),
                    ),
                  ],
                )
              : SizedBox(),
          data?.sent == true
              ? const SizedBox(
                  height: 20,
                )
              : SizedBox(),
          // const Divider(
          //   color: Colors.black,),
          data?.sent == true ? const DottedLine() : const SizedBox(),
          data?.sent == true
              ? const SizedBox(
                  height: 20,
                )
              : const SizedBox(),
          data?.sent == true
              ? Row(
                  children: [
                    Text(
                      data?.sent == true
                          ? '${data?.userName} has received'
                          : '${data?.userName} has Sent',
                      // style: TextStyle(color: Colors.black54),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      '${data?.ammount} ${data?.accountType == 1 ? 'EUR' : data?.accountType == 2 ? 'USD' : 'GBP'}',
                      // style: TextStyle(color: Colors.black54),
                    ),
                  ],
                )
              : const SizedBox(),
          const SizedBox(
            height: 20,
          ),
          // Divider(
          //   color: Colors.black,),
          const DottedLine(),
          SizedBox(
            height: 20,
          ),

          data?.sent == false
              ? Row(
                  children: [
                    const Text(
                      'Recived on',
                      // style: TextStyle(color: Colors.black54),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      outputDateString,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                )
              : const SizedBox(),
          SizedBox(
            height: 10,
          ),
          data.sent == false
              ? Row(
                  children: [
                    const Text(
                      'Reference',
                      // style: TextStyle(color: Colors.black54),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      data.reference.toString(),
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                )
              : const SizedBox(),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                'Transaction number',
                // style: TextStyle(color: Colors.black54),
              ),
              const Expanded(child: SizedBox()),
              Text(
                '#${data.id}',
                // style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          data.sent == true
              ? Text(
                  maxLines: 2,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  // textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  'Bank details of ${data.userName}',
                )
              : const SizedBox(),
          data.sent == true
              ? const SizedBox(
                  height: 10,
                )
              : const SizedBox(),
          data.sent == true
              ? const Row(
                  children: [
                    Text(
                      'Recipient type',
                      // style: TextStyle(color: Colors.black54),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      'PRIVATE',
                      // style: TextStyle(color: Colors.black54),
                    ),
                  ],
                )
              : const SizedBox(),
          data.sent == true
              ? const SizedBox(
                  height: 10,
                )
              : const SizedBox(),
          data.sent == true
              ? Row(
                  children: [
                    const Text(
                      'Bank code (BIC/SWIFT)',
                      // style: TextStyle(color: Colors.black54),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      data.bankCode ?? 'Un known',
                      // style: TextStyle(color: Colors.black54),
                    ),
                  ],
                )
              : const SizedBox(),
          data.sent == true
              ? const SizedBox(
                  height: 10,
                )
              : const SizedBox(),
          data.sent == true
              ?  Row(
                  children: [
                    Text(
                      'IBAN',
                      // style: TextStyle(color: Colors.black54),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      data.iBan ??'Un Known',
                      // style: TextStyle(color: Colors.black54),
                    ),
                  ],
                )
              : const SizedBox(),
          data.sent == true
              ? const SizedBox(
                  height: 20,
                )
              : const SizedBox(),
          Container(
            height: 50,
            padding:
                const EdgeInsets.only(right: 13, left: 5, top: 5, bottom: 5),
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Download transfer receipt',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    ),
  );
}

Widget timeLineItem(DateTime? time,
    {bool? lastItem = false,
    required String? msg,
    String? amount,
    int? accountType,
    String? person}) {
  String formattedDate = DateFormat('yyyy-MM-dd').format(time!);
  String formattedTime = DateFormat('kk:mm').format(time);
  return Row(
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.done),
          lastItem == false
              ? Container(
                  width: 2,
                  height: 40,
                  color: Colors.grey,
                )
              : const SizedBox(
                  height: 40,
                )
        ],
      ),
      const SizedBox(
        width: 20,
      ),
      lastItem == false
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$formattedDate at $formattedTime'),
                Text(
                  msg ?? '',
                  style: TextStyle(
                      fontWeight: lastItem == true
                          ? FontWeight.bold
                          : FontWeight.normal),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            )
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$formattedDate at $formattedTime'),
                  const Text(
                    'Your transfer completed',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text('We sent '),
                      Text(
                        '$amount ${accountType == 1 ? 'EUR' : accountType == 2 ? 'USD' : 'GBP'}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(' to $person')
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            )
    ],
  );
}
