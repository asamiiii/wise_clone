import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wise_clone/cash_helper.dart';
import 'package:wise_clone/main.dart';
import 'package:wise_clone/screens/coins_accounts/euro/account_details_model.dart';
import 'package:wise_clone/screens/coins_accounts/euro/euro_de.dart';
import 'package:wise_clone/screens/home.dart';
import 'package:wise_clone/screens/trans_list.dart';

class DollarAccount extends StatefulWidget {
  const DollarAccount({super.key});

  @override
  State<DollarAccount> createState() => _DollarAccountState();
}

class _DollarAccountState extends State<DollarAccount> {
    String? usdTotalPalance;
  bool isLoading = false;
  String? eurAccountNumber;
  @override
  void initState() {
    isLoading = true;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      
             final SharedPreferences prefs = await SharedPreferences.getInstance();
    usdTotalPalance = prefs.getString('USD_totalPalance');
    eurAccountNumber = prefs.getString('USD_account_number')??'Un known';
    isLoading=false;
    setState(() {
      
    });
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final filteredListData = listData.where((data) => data.accountType == 2).toList();
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          forceMaterialTransparency: true, // no color affect when scrolling
          automaticallyImplyLeading: false,
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
            // Icon(Icons.search),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: isLoading==true?const Center(child: CircularProgressIndicator()) :Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              CircleAvatar(
                radius: screenWidth * 0.05,
                backgroundImage: const AssetImage('images/flag1.png'),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Text(
                'USD balance',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              GestureDetector(
                onTap: () async{
                  String? holder = await CacheHelper.getStringFromCache(key: 'USD_holder') ?? 'Un Known' ;
                  String? sortCode =await CacheHelper.getStringFromCache(key: 'USD_sort_code') ?? 'Un Known';
                  String? accountNumber =await  CacheHelper.getStringFromCache(key: 'USD_account_number') ?? 'Un Known';
                  String? iBAN = await CacheHelper.getStringFromCache(key: 'USD_IBAN') ?? 'Un Known';
                   showModalBottomSheet(
                    isScrollControlled: true,
                    context: context, builder: (context) => Container(
                      width: screenWidth,
                      height: screenHeight*0.95,
                      child:  EuroDetails(accountDetails: AccountDetails(accountHolder: holder,accountNumber: accountNumber,iBAN: iBAN,sortCode: sortCode)),
                    ),);
                    
                },
                child: Row(
                  children: [
                    CircleAvatar(
                        radius: screenWidth * 0.03,
                        backgroundColor: Colors.grey[200],
                        child: const Icon(Icons.assured_workload)),
                    const SizedBox(
                      width: 10,
                    ),
                     Text(
                      eurAccountNumber??'',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
               Text(
                '${usdTotalPalance??''} USD',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: screenWidth * 0.08,
                        backgroundColor: mainColor,
                        child: Text(
                            String.fromCharCode(
                                CupertinoIcons.add.codePoint),
                            style: TextStyle(
                              inherit: false,
                              color: Colors.black,
                              fontSize: 35.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: CupertinoIcons
                                  .exclamationmark_circle.fontFamily,
                              package: CupertinoIcons
                                  .exclamationmark_circle.fontPackage,
                            ),
                          )
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      Text(
                        'Add',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: screenWidth * 0.08,
                        backgroundColor: mainColor,
                        child: Image.asset(
                          'images/double-arrow.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      const Text(
                        'Convert',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Column(
                    children: [
                      CircleAvatar(
                          radius: screenWidth * 0.08,
                          backgroundColor: mainColor,
                          child: Text(
                            String.fromCharCode(
                                CupertinoIcons.arrow_up.codePoint),
                            style: TextStyle(
                              inherit: false,
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: CupertinoIcons
                                  .exclamationmark_circle.fontFamily,
                              package: CupertinoIcons
                                  .exclamationmark_circle.fontPackage,
                            ),
                          )),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      const Text(
                        'Send',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: screenWidth * 0.08,
                        backgroundColor: mainColor,
                        child: const Icon(Icons.more_horiz_rounded),
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      Text(
                        'More',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Divider(
                indent: 5,
                endIndent: 5,
                color: Colors.grey[300],
                height: 1,
                thickness: 1,
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Row(
                children: [
                  const Text(
                    'Transactions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TransactionsList(),
                          ));
                    },
                    child: listData.isNotEmpty
                        ? const Text(
                            'See all',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 15,
                            ),
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              listData.isNotEmpty
                  ? SizedBox(
                      height: listData.length >= 3
                          ? 180
                          : listData.length == 2
                              ? 120
                              : listData.length == 1
                                  ? 60
                                  : 0,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: filteredListData.length,
                        itemBuilder: (context, index) {
                          
                          
                          final reversedIndex = filteredListData.length - 1 - index;
                          return transactionsItem(context,
                          accountType: filteredListData[reversedIndex].accountType??0,
                              userName: filteredListData[reversedIndex].userName,
                              mony: filteredListData[reversedIndex].ammount,
                              sent: filteredListData[reversedIndex].sent,
                              id: filteredListData[reversedIndex].id,
                              time: filteredListData[reversedIndex].time,
                              ref: listData[reversedIndex].reference,
                              bankCode: listData[reversedIndex].bankCode,
                              iBAN: listData[reversedIndex].iBan,
                              
                              );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                      ))
                  : Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[100],
                          child: Icon(
                            Icons.watch_later_outlined,
                            color: Colors.grey[500],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'No transaction yet',
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        )
                      ],
                    ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ));
  }
}