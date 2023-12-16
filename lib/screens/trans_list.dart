import 'package:flutter/material.dart';
import 'package:wise_clone/screens/home.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
            transactionsItem(
              context, 
              home: false,
              userName: 'Ahmes Sami', sent: true, mony: '100.0'),
            SizedBox(
              height: 10,
            ),
            transactionsItem(
              context, 
              home: false,
                userName: 'Mohammed Badrawy', sent: false, mony: '20.0'),
            SizedBox(
              height: 10,
            ),
            transactionsItem(
              context, 
              home: false,
              userName: 'Amr Ahmed', sent: true, mony: '10.50'),
            SizedBox(
              height: 10,
            ),
            transactionsItem(
              context, 
              home: false,
              userName: 'Ahmes Sami', sent: true, mony: '100.0'),
            SizedBox(
              height: 10,
            ),
            transactionsItem(
              context, 
              home: false,
                userName: 'Mohammed Badrawy', sent: false, mony: '20.0'),
            SizedBox(
              height: 10,
            ),
            transactionsItem(
              context, 
              home: false,
              userName: 'Amr Ahmed', sent: true, mony: '10.50'),
          ],
        ),
      ),
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
