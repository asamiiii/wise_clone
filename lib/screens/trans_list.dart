import 'package:flutter/material.dart';
import 'package:wise_clone/screens/home.dart';
import 'package:wise_clone/models/trans.dart';
List<DetailsData> listData = [

];

class TransactionsList extends StatefulWidget {
  const TransactionsList({super.key});

  @override
  State<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        actions: const [
          SizedBox(
            width: 20,
          ),
          Icon(Icons.search),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Text(
                  'Transactions',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: buildCategoryChips(x),
              ),
            ),
            listData.isNotEmpty? Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final reversedIndex = listData.length - 1 - index;
                    return transactionsItem(context,
                        home: false,
                        accountType: listData[reversedIndex].accountType??0,
                        id: listData[reversedIndex].id,
                        time: listData[reversedIndex].time,
                        userName: listData[reversedIndex].userName,
                        sent: listData[reversedIndex].sent,
                        mony: listData[reversedIndex].ammount,
                        ref: listData[reversedIndex].reference,
                        bankCode: listData[reversedIndex].bankCode,
                        iBAN: listData[reversedIndex].iBan
                        );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: listData.length),
            ):Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
          ])),
    );
  }
}

List<String> x = ['Include hidden', 'Type', 'Balance'];
List<Widget> buildCategoryChips(List<String> x) {
  return x.map((txt) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        shape: const StadiumBorder(
          side: BorderSide(color: Colors.grey),
        ),
        label: Text(txt),
        // backgroundColor: const Color(0xff282A28),
      ),
    );
  }).toList();
}
