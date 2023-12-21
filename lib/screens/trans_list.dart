import 'package:flutter/material.dart';
import 'package:wise_clone/screens/home.dart';
import 'package:wise_clone/models/trans.dart';
List<DetailsData> listData = [
  DetailsData(
      id: 123456,
      userName: 'Ahmed Sami',
      sent: true,
      ammount: '100.0',
      time: DateTime.parse('2023-12-11 01:15:00.000')),
  DetailsData(
      userName: 'Mohammed Badrawy',
      sent: false,
      ammount: '9.0',
      id: 654321,
      time: DateTime.parse('2023-12-13 05:30:00.000')),
  DetailsData(
      userName: 'Amr Ahmed',
      sent: true,
      ammount: '1.0',
      id: 123456,
      time: DateTime.parse('2023-12-14 07:40:00.000')),
  DetailsData(
      userName: 'Ahmed Sami',
      sent: true,
      ammount: '98.0',
      id: 123456,
      time: DateTime.parse('2023-12-11 08:15:00.000'))
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
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final reversedIndex = listData.length - 1 - index;
                    return transactionsItem(context,
                        home: false,
                        id: listData[reversedIndex].id,
                        time: listData[reversedIndex].time,
                        userName: listData[reversedIndex].userName,
                        sent: listData[reversedIndex].sent,
                        mony: listData[reversedIndex].ammount);
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: listData.length),
            )
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
