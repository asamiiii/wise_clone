import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wise_clone/main.dart';
import 'package:wise_clone/screens/main_view.dart';
import 'package:wise_clone/screens/settings.dart';
import 'package:wise_clone/screens/trans_details.dart';
import 'package:wise_clone/screens/trans_list.dart';
import 'package:wise_clone/screens/widgets.dart';
import 'package:wise_clone/models/trans.dart';

List<String> imagesList = [
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
  bool isLoading = false;
  @override
  void initState() {
    
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Obtain shared preferences.
final SharedPreferences prefs = await SharedPreferences.getInstance();
      isLoading = true;
      setState(() {
        
      });
      totalPalance =  prefs.getString('totalPalance');
      await getAllLocalTrans();
      listData.sort((a, b) => a.time!.compareTo(b.time!));
      debugPrint('list dat : $listData');
      isLoading = false;
      setState(() {
        
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true, // no color affect when scrolling
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ));
            },
            child: circlName()),
        actions: [
          const SizedBox(
            width: 10,
          ),
          radiusButton(txt: 'Earn £ 50'),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: isLoading==true?Center(child: CircularProgressIndicator(),): SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Account',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Total Balance  ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '${totalPalance ?? 100.0} USD',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
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
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
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
                        itemCount: listData.length > 3 ? 3 : listData.length,
                        itemBuilder: (context, index) {
                          final reversedIndex = listData.length - 1 - index;
                          return transactionsItem(context,
                              userName: listData[reversedIndex].userName,
                              mony: listData[reversedIndex].ammount,
                              sent: listData[reversedIndex].sent,
                              id: listData[reversedIndex].id,
                              time: listData[reversedIndex].time);
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
                height: 20,
              ),
              const Text(
                'Excahnge rate',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset('images/chart.png'),
              ),
              SizedBox(
                height: 25,
              ),
              const Text(
                'Do more with Wise',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          imagesList[index],
                          width: 200,
                          height: 150,
                          fit: BoxFit.fill,
                        ));
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: imagesList.length,
                ),
              ),
              SizedBox(
                height: 30,
              ),
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
          image == null
              ? CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Text(firstChar ?? ''))
              : ClipOval(
                  child: Image.file(
                    image!,
                    width: 120,
                    height: 120,
                    fit: BoxFit.fill,
                  ),
                ),
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

Widget radiusButton({required String? txt}) {
  return Container(
    // height: 40,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: mainColor,
      borderRadius: BorderRadius.circular(25),
    ),
    child: Text(txt ?? ''),
  );
}

Widget transactionsItem(BuildContext context,
    {bool? home = true,
    required String? userName,
    required bool? sent,
    required String? mony,
    required int? id,
    required DateTime? time}) {
  //? Transactions Section
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransDetails(
                data: DetailsData(
                    userName: userName,
                    sent: sent,
                    ammount: mony,
                    id: id,
                    time: time)),
          ));
    },
    child: Dismissible(
      direction: DismissDirection.horizontal,
      onDismissed: (direction)async {
        await deleteItem(id??0);
        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) =>  MainView()));
         Fluttertoast.showToast(
        msg: "Transaction is deleted",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
      },
      key: Key(id.toString()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: home == true ? 25 : 35,
            backgroundColor: Colors.grey[200],
            child: Icon(sent == true ? Icons.arrow_upward : Icons.arrow_downward),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName ?? '',
                style: TextStyle(
                    fontSize: home == true ? 13 : 15,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                sent == true ? 'Sent' : 'Recived',
                textAlign: TextAlign.start,
                style: const TextStyle(color: Colors.grey),
              )
            ],
          ),
          const Expanded(child: SizedBox()),
          Text(
            '$mony USD',
            style: const TextStyle(fontWeight: FontWeight.w400),
          )
        ],
      ),
    ),
  );
}

Future<void> getAllLocalTrans() async {
  persons = await Hive.openBox('trans');
  var keys = persons?.keys;
  listData.clear();
  keys?.forEach((element) {
    debugPrint('item key : $element');
    var i = persons?.get(element);
    if (i != null) {
      listData.add(i);
    }
  });

  debugPrint('listt : $listData');
}

addItemToLocal(DetailsData item)async{
persons = await Hive.openBox('trans');
persons?.add(item);
}

 deleteItem(int id) async{
    persons = await Hive.openBox('trans');

    final Map<dynamic, DetailsData> deliveriesMap = persons!.toMap();
    dynamic desiredKey;
    deliveriesMap.forEach((key, value){
        if (value.id == id) {
          desiredKey = key;
        }
    });
    persons?.delete(desiredKey);
   
  }
