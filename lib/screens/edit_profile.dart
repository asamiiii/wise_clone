import 'dart:ffi';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:wise_clone/cash_helper.dart';
import 'package:wise_clone/main.dart';
import 'package:wise_clone/models/trans.dart';
import 'package:wise_clone/screens/home.dart';
import 'package:wise_clone/screens/main_view.dart';
import 'package:wise_clone/screens/settings.dart';
import 'package:wise_clone/screens/trans_list.dart';
import 'package:wise_clone/screens/widgets.dart';

enum SingingCharacter { EUR, USD ,GBP}

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool? sent = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      image == null
                          ? CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.grey[200],
                              child: Text(
                                firstChar ?? '',
                                style: const TextStyle(fontSize: 25),
                              ),
                            )
                          : ClipOval(
                              child: Image.file(
                                  fit: BoxFit.fill,
                                  image!,
                                  height: 100,
                                  width: 100)),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              size: 20,
                            ),
                          ))
                    ],
                  ),
                ],
              ),
              TextButton(
                  onPressed: () async {
                    await getImageFromFiles();
                    setState(() {});
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainView(),
                        ));
                  },
                  child: const Text('Change')),
              const SizedBox(
                height: 30,
              ),
              Text(
                userName ?? '',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              TextButton(
                  onPressed: () {
                    TextEditingController controller = TextEditingController();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SizedBox(
                          width: 500,
                          height: 200,
                          child: Column(
                            children: [
                              AppTextField(
                                  controller: controller,
                                  keyboardType: TextInputType.text,
                                  icon: const Icon(Icons.abc),
                                  hintText: 'Change Your Name',
                                  label: 'User Name'),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            child: const Text('Edit'),
                            onPressed: () async {
                              if (controller.text.isNotEmpty) {
                                saveProfileName(controller.text);
                                firstChar =
                                    getInitials(await getProfileName() ?? '');
                                setState(() {});
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MainView(),
                                    ));
                                showMessage(msg: 'Sucsess', sucsess: true);
                              } else {
                                showMessage(
                                    msg: 'No value added', sucsess: false);
                              }
                            },
                          ),
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                        title: const Text('Edit User Name'),
                      ),
                    );
                  },
                  child: const Text('Change')),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: const Text('Add Transaction'),
                    onPressed: () {
                      SingingCharacter? character = SingingCharacter.EUR;
                      TextEditingController toController =
                          TextEditingController();
                      TextEditingController valueController =
                          TextEditingController();
                      TextEditingController idController =
                          TextEditingController();
                      TextEditingController timeController =
                          TextEditingController();
                      
                      TextEditingController refController =
                          TextEditingController();
                      TextEditingController bankCodeController =
                          TextEditingController();

                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) => SingleChildScrollView(
                          child: AlertDialog(
                            content: SizedBox(
                              width: 500,
                              // height: 500,
                              child: Column(
                                children: [
                                  AppTextField(
                                      controller: idController,
                                      keyboardType: TextInputType.number,
                                      icon: const Icon(Icons.abc),
                                      hintText: 'id',
                                      label: 'id'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  AppTextField(
                                      controller: toController,
                                      keyboardType: TextInputType.text,
                                      icon: const Icon(Icons.abc),
                                      hintText: 'To',
                                      label: 'Name'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  AppTextField(
                                      controller: valueController,
                                      keyboardType: TextInputType.number,
                                      icon: const Icon(Icons.abc),
                                      hintText: 'value',
                                      label: 'value'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  AppTextField(
                                      onTap: () {
                                        debugPrint('Pick Time');
                                        DatePicker.showDateTimePicker(context,
                                            showTitleActions: true,
                                            minTime: DateTime(2011, 3, 5),
                                            maxTime: DateTime.now(),
                                            onChanged: (date) {
                                          String formattedDate =
                                              DateFormat('yyyy-MM-dd kk:mm')
                                                  .format(date);
                                          debugPrint('date : $date');
                                          timeController.text = formattedDate;
                                        }, onConfirm: (date) {
                                          String formattedDate =
                                              DateFormat('yyyy-MM-dd kk:mm')
                                                  .format(date);
                                          debugPrint('date : $date');
                                          timeController.text = formattedDate;
                                        },
                                            currentTime: DateTime.now(),
                                            locale: LocaleType.en);
                                      },
                                      readOnly: true,
                                      controller: timeController,
                                      keyboardType: TextInputType.text,
                                      icon: const Icon(Icons.abc),
                                      hintText: 'time',
                                      label: 'time'),
                                      const SizedBox(
                                    height: 10,
                                  ),
                                      AppTextField(
                                        controller: refController,
                                        keyboardType: TextInputType.number,
                                        icon: const Icon(Icons.abc),
                                        hintText: 'Ref number',
                                        label: 'Ref number'),
                                    const SizedBox(
                                    height: 10,
                                  ),
                                    AppTextField(
                                        controller: bankCodeController,
                                        keyboardType: TextInputType.text,
                                        icon: const Icon(Icons.abc),
                                        hintText: 'Bank code (BIC/SWIFT)',
                                        label: 'Bank code (BIC/SWIFT)'),
                                  StatefulBuilder(
                                    builder: (context, setState) => Row(
                                      children: [
                                        const Text('Sent'),
                                        Checkbox(
                                          checkColor: Colors.white,
                                          // fillColor: MaterialStateProperty.resolveWith(getColor),
                                          value: sent,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              sent = value!;
                                              debugPrint('value $value');
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  StatefulBuilder(
                                    builder: (context, setState) => Column(
                                      children: <Widget>[
                                        ListTile(
                                          title: const Text('USD'),
                                          leading: Radio<SingingCharacter>(
                                            value: SingingCharacter.USD,
                                            groupValue: character,
                                            onChanged:
                                                (SingingCharacter? value) {
                                              setState(() {
                                                character = value;
                                              });
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: const Text('EUR'),
                                          leading: Radio<SingingCharacter>(
                                            value: SingingCharacter.EUR,
                                            groupValue: character,
                                            onChanged:
                                                (SingingCharacter? value) {
                                              setState(() {
                                                character = value;
                                              });
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: const Text('GBP'),
                                          leading: Radio<SingingCharacter>(
                                            value: SingingCharacter.GBP,
                                            groupValue: character,
                                            onChanged:
                                                (SingingCharacter? value) {
                                              setState(() {
                                                character = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text('Send'),
                                onPressed: () async {

                                  int? accountType;
                                  if (character == SingingCharacter.EUR) {
                                      debugPrint('_character 1');
                                      accountType = 1;
                                    }
                                    if (character == SingingCharacter.USD) {
                                      debugPrint('_character 2');
                                      accountType = 2;
                                    }
                                    if (character == SingingCharacter.GBP) {
                                      debugPrint('_character 3');
                                      accountType = 3;
                                    }
                                  if (idController.text.isEmpty ||
                                      toController.text.isEmpty ||
                                      valueController.text.isEmpty ||
                                      timeController.text.isEmpty||
                                      accountType==null) {
                                    Fluttertoast.showToast(
                                        msg: "Please Fill all data",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else {
                                    
                                    await addItemToLocal(DetailsData(
                                      ammount: valueController.text,
                                      sent: sent,
                                      userName: toController.text,
                                      id: int.parse(idController.text),
                                      time: DateTime.parse(timeController.text),
                                      accountType:accountType,
                                      reference: int.parse(refController.text),
                                      bankCode: bankCodeController.text

                                    ));

                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MainView(),
                                        ));
                                    Fluttertoast.showToast(
                                        msg: "Transaction is Added",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                },
                              ),
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                            title: const Text('Add Transaction'),
                          ),
                        ),
                      );
                    },
                  ),
                  Icon(Icons.send)
                ],
              ),
              SizedBox(
                height: 50,
              ),
              TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Edit EUR Balance'),
                    Icon(Icons.attach_money)
                  ],
                ),
                onPressed: () {
                  TextEditingController balanceController =
                      TextEditingController();

                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: SizedBox(
                        width: 500,
                        height: 150,
                        child: Column(
                          children: [
                            AppTextField(
                                controller: balanceController,
                                keyboardType: TextInputType.number,
                                icon: const Icon(Icons.abc),
                                hintText: 'Balance',
                                label: 'Balance'),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: const Text('Edit'),
                          onPressed: () async {
                            if (balanceController.text.isNotEmpty) {
                              // Obtain shared preferences.
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setString(
                                  'EUR_totalPalance', balanceController.text);
                              // totalPalance = balanceController.text;
                              setState(() {});
                              showMessage(msg: 'Sucsess', sucsess: true);
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MainView(),
                                  ));
                            } else {
                              showMessage(
                                  msg: 'No value added', sucsess: false);
                            }
                          },
                        ),
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                      title: const Text('Edit Balance'),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Edit USD Balance'),
                    Icon(Icons.attach_money)
                  ],
                ),
                onPressed: () {
                  TextEditingController balanceController =
                      TextEditingController();

                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: SizedBox(
                        width: 500,
                        height: 150,
                        child: Column(
                          children: [
                            AppTextField(
                                controller: balanceController,
                                keyboardType: TextInputType.number,
                                icon: const Icon(Icons.abc),
                                hintText: 'Balance',
                                label: 'Balance'),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: const Text('Edit'),
                          onPressed: () async {
                            if (balanceController.text.isNotEmpty) {
                              // Obtain shared preferences.
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setString(
                                  'USD_totalPalance', balanceController.text);
                              // totalPalance = balanceController.text;
                              setState(() {});
                              showMessage(msg: 'Sucsess', sucsess: true);
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MainView(),
                                  ));
                            } else {
                              showMessage(
                                  msg: 'No value added', sucsess: false);
                            }
                          },
                        ),
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                      title: const Text('Edit Balance'),
                    ),
                  );
                },
              ),
              SizedBox(height: 20,),
              TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Edit GBP Balance'),
                    Icon(Icons.attach_money)
                  ],
                ),
                onPressed: () {
                  TextEditingController balanceController =
                      TextEditingController();

                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: SizedBox(
                        width: 500,
                        height: 150,
                        child: Column(
                          children: [
                            AppTextField(
                                controller: balanceController,
                                keyboardType: TextInputType.number,
                                icon: const Icon(Icons.abc),
                                hintText: 'Balance',
                                label: 'Balance'),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: const Text('Edit'),
                          onPressed: () async {
                            if (balanceController.text.isNotEmpty) {
                              // Obtain shared preferences.
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setString(
                                  'GBP_totalPalance', balanceController.text);
                              // totalPalance = balanceController.text;
                              setState(() {});
                              showMessage(msg: 'Sucsess', sucsess: true);
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MainView(),
                                  ));
                            } else {
                              showMessage(
                                  msg: 'No value added', sucsess: false);
                            }
                          },
                        ),
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                      title: const Text('Edit Balance'),
                    ),
                  );
                },
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: const Text('Add EUR Information'),
                    onPressed: () {
                      TextEditingController holderController =
                          TextEditingController();
                      TextEditingController sortCodeController =
                          TextEditingController();
                      TextEditingController accountNamberController =
                          TextEditingController();
                      TextEditingController iBAnController =
                          TextEditingController();

                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) => SingleChildScrollView(
                          child: AlertDialog(
                            content: SizedBox(
                              width: 500,
                              height: 370,
                              child: Column(
                                children: [
                                  AppTextField(
                                      controller: holderController,
                                      keyboardType: TextInputType.text,
                                      icon: const Icon(Icons.abc),
                                      hintText: 'holder',
                                      label: 'holder'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  AppTextField(
                                      controller: sortCodeController,
                                      keyboardType: TextInputType.text,
                                      icon: const Icon(Icons.abc),
                                      hintText: 'sort code',
                                      label: 'sort code'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  AppTextField(
                                      controller: accountNamberController,
                                      keyboardType: TextInputType.text,
                                      icon: const Icon(Icons.abc),
                                      hintText: 'account number',
                                      label: 'account number'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  AppTextField(
                                      controller: iBAnController,
                                      keyboardType: TextInputType.text,
                                      icon: const Icon(Icons.abc),
                                      hintText: 'IBAN',
                                      label: 'IBAN'),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text('Send'),
                                onPressed: () async {
                                  if (holderController.text.isEmpty ||
                                      sortCodeController.text.isEmpty ||
                                      accountNamberController.text.isEmpty ||
                                      iBAnController.text.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: "Please Fill all data",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else {
                                    CacheHelper.addStringToCache(
                                        key: 'EUR_holder',
                                        value: holderController.text);
                                    CacheHelper.addStringToCache(
                                        key: 'EUR_sort_code',
                                        value: sortCodeController.text);
                                    CacheHelper.addStringToCache(
                                        key: 'EUR_account_number',
                                        value: accountNamberController.text);
                                    CacheHelper.addStringToCache(
                                        key: 'EUR_IBAN',
                                        value: iBAnController.text);

                                    Fluttertoast.showToast(
                                        msg: "EUR is Updated",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const MainView(),));
                                  }
                                },
                              ),
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                            title: const Text('Add EUR Information'),
                          ),
                        ),
                      );
                    },
                  ),
                  Icon(Icons.send)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: const Text('Add USD Information'),
                    onPressed: () {
                      TextEditingController holderController =
                          TextEditingController();
                      TextEditingController sortCodeController =
                          TextEditingController();
                      TextEditingController accountNamberController =
                          TextEditingController();
                      TextEditingController iBAnController =
                          TextEditingController();

                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) => SingleChildScrollView(
                          child: AlertDialog(
                            content: SizedBox(
                              width: 500,
                              height: 370,
                              child: Column(
                                children: [
                                  AppTextField(
                                      controller: holderController,
                                      keyboardType: TextInputType.text,
                                      icon: const Icon(Icons.abc),
                                      hintText: 'holder',
                                      label: 'holder'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  AppTextField(
                                      controller: sortCodeController,
                                      keyboardType: TextInputType.text,
                                      icon: const Icon(Icons.abc),
                                      hintText: 'sort code',
                                      label: 'sort code'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  AppTextField(
                                      controller: accountNamberController,
                                      keyboardType: TextInputType.text,
                                      icon: const Icon(Icons.abc),
                                      hintText: 'account number',
                                      label: 'account number'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  AppTextField(
                                      controller: iBAnController,
                                      keyboardType: TextInputType.text,
                                      icon: const Icon(Icons.abc),
                                      hintText: 'IBAN',
                                      label: 'IBAN'),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text('Send'),
                                onPressed: () async {
                                  if (holderController.text.isEmpty ||
                                      sortCodeController.text.isEmpty ||
                                      accountNamberController.text.isEmpty ||
                                      iBAnController.text.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: "Please Fill all data",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else {
                                    CacheHelper.addStringToCache(
                                        key: 'USD_holder',
                                        value: holderController.text);
                                    CacheHelper.addStringToCache(
                                        key: 'USD_sort_code',
                                        value: sortCodeController.text);
                                    CacheHelper.addStringToCache(
                                        key: 'USD_account_number',
                                        value: accountNamberController.text);
                                    CacheHelper.addStringToCache(
                                        key: 'USD_IBAN',
                                        value: iBAnController.text);

                                    Fluttertoast.showToast(
                                        msg: "USD is Updated",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const MainView(),));
                                  }
                                },
                              ),
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                            title: const Text('Add USD Information'),
                          ),
                        ),
                      );
                    },
                  ),
                  Icon(Icons.send)
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: const Text('Add GBP Information'),
                    onPressed: () {
                      TextEditingController holderController =
                          TextEditingController();
                      TextEditingController sortCodeController =
                          TextEditingController();
                      TextEditingController accountNamberController =
                          TextEditingController();
                      TextEditingController iBAnController =
                          TextEditingController();

                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) => SingleChildScrollView(
                          child: AlertDialog(
                            content: SizedBox(
                              width: 500,
                              height: 370,
                              child: Column(
                                children: [
                                  AppTextField(
                                      controller: holderController,
                                      keyboardType: TextInputType.text,
                                      icon: const Icon(Icons.abc),
                                      hintText: 'holder',
                                      label: 'holder'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  AppTextField(
                                      controller: sortCodeController,
                                      keyboardType: TextInputType.text,
                                      icon: const Icon(Icons.abc),
                                      hintText: 'sort code',
                                      label: 'sort code'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  AppTextField(
                                      controller: accountNamberController,
                                      keyboardType: TextInputType.text,
                                      icon: const Icon(Icons.abc),
                                      hintText: 'account number',
                                      label: 'account number'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  AppTextField(
                                      controller: iBAnController,
                                      keyboardType: TextInputType.text,
                                      icon: const Icon(Icons.abc),
                                      hintText: 'IBAN',
                                      label: 'IBAN'),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text('Send'),
                                onPressed: () async {
                                  if (holderController.text.isEmpty ||
                                      sortCodeController.text.isEmpty ||
                                      accountNamberController.text.isEmpty ||
                                      iBAnController.text.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: "Please Fill all data",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else {
                                    CacheHelper.addStringToCache(
                                        key: 'GBP_holder',
                                        value: holderController.text);
                                    CacheHelper.addStringToCache(
                                        key: 'GBP_sort_code',
                                        value: sortCodeController.text);
                                    CacheHelper.addStringToCache(
                                        key: 'GBP_account_number',
                                        value: accountNamberController.text);
                                    CacheHelper.addStringToCache(
                                        key: 'GBP_IBAN',
                                        value: iBAnController.text);

                                    Fluttertoast.showToast(
                                        msg: "GBP is Updated",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const MainView(),));
                                  }
                                },
                              ),
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                            title: const Text('Add GBP Information'),
                          ),
                        ),
                      );
                    },
                  ),
                  Icon(Icons.send)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
