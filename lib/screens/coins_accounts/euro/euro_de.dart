import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:wise_clone/screens/coins_accounts/euro/account_details_model.dart';
import 'package:wise_clone/screens/home.dart';

class EuroDetails extends StatelessWidget {
  AccountDetails? accountDetails;
  String? type;
  EuroDetails({super.key, this.accountDetails,required this.type});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true, // no color affect when scrolling
        automaticallyImplyLeading: false,
        title: Text(
          'Your $type account details',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
        ),

        leading: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                  // radius: 35,
                  backgroundColor: Colors.grey[200],
                  child: const Icon(Icons.arrow_back)),
            )),
        actions: const [
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('images/global.png',),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth * 0.90,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor('#eeefea'),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 40,
                          width: screenWidth * 0.45,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Local',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text('Global - SWIFT')
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: screenWidth * 0.90,
                // height: 500,
                decoration: BoxDecoration(
                    color: HexColor('#eeefea'),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage('images/uk.png'),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Recive from a bank in the UK',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        const Expanded(child: SizedBox()),
                        radiusButton(txt: 'Share')
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Account holder',
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              '${accountDetails?.accountHolder}',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Image.asset('images/copy.png',width: 25,height: 22,)
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sort code',
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              '${accountDetails?.sortCode}',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Image.asset('images/copy.png',width: 25,height: 22,)
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Account number',
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              '${accountDetails?.accountNumber}',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Image.asset('images/copy.png',width: 25,height: 22,)
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'IBAN',
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              '${accountDetails?.iBAN}',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('images/copy.png',width: 25,height: 22,)
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Wise address',
                                  style: TextStyle(fontSize: 13),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Icon(
                                      Icons.question_mark_sharp,
                                      size: 12,
                                    ))
                              ],
                            ),
                            Text(
                              '56 Shoreditch High Street',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'London',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'E1 6JJ',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'United Kingdom',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                         Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Image.asset('images/copy.png',width: 25,height: 22,)
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                width: screenWidth * 0.90,
                // height: 180,
                decoration: BoxDecoration(
                    color: HexColor('#eeefea'),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.watch_later_outlined,
                            size: 25,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: screenWidth * 0.65,
                            child: const Text(
                              'Incoming payments take 1 working day or less to be added to your account',
                              maxLines: 3,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Icon(
                                Icons.question_mark_sharp,
                                size: 18,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 23,
                              height: 25,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                '!',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: screenWidth * 0.65,
                            child: const Text(
                              'Learn how wise keeps your mony safe',
                              maxLines: 3,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Icon(
                                Icons.question_mark_sharp,
                                size: 18,
                              ))
                        ],
                      )
                    ]),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
