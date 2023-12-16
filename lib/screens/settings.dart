import 'package:flutter/material.dart';
import 'package:wise_clone/screens/home.dart';
String getInitials(String bankAccountName) => bankAccountName.isNotEmpty
    ? bankAccountName.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
    : '';
String? userName = 'Ahmed Sami'; 
String? firstChar = getInitials(userName??'');

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: Container(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: const Icon(Icons.close)),
            )),
        actions: [
          const SizedBox(
            width: 20,
          ),
          radiusButton(txt: 'Details'),
          SizedBox(
            width: 20,
          ),
          Stack(
            children: [
              Icon(
                Icons.notifications_none,
                size: 30,
              ),
              Positioned(
                top: 3,
                right: 3,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(25)),
                ),
              )
            ],
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[200],
                        child:  Text(
                          firstChar??'',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
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
              const SizedBox(
                height: 15,
              ),
               Text(
                userName??'',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Your personal account',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(
                height: 25,
              ),
              const Row(
                children: [
                  Text(
                    'Other accounts',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                indent: 5,
                endIndent: 5,
                color: Colors.grey[300],
                height: 1,
                thickness: 1,
              ),
          SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
        
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey[200],
                            child: const Icon(Icons.window),
                          ),
                    ],
                  ),
        
            const SizedBox(width: 10,),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.start,
                'Get a business account',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Text(
                maxLines: 2,
                'Open an account with features \n built for doing business abroad',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
                    ],
                  ),
               const Expanded(child: SizedBox()),
                  const Column(
                    children: [
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  )
                ],
              ),
             const SizedBox(height: 25,),
              const Row(
                children: [
                  Text(
                    'General',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                indent: 5,
                endIndent: 5,
                color: Colors.grey[300],
                height: 1,
                thickness: 1,
              ),
          SizedBox(height: 15,),
            settingsItem('Statements and reports', Icons.document_scanner_sharp),
            const SizedBox(height: 15,),
            settingsItem('Settings', Icons.settings),
            const SizedBox(height: 15,),
            settingsItem('Help', Icons.help_rounded),
            const SizedBox(height: 15,),
            settingsItem('Privacy and security', Icons.privacy_tip_rounded),
            const SizedBox(height: 15,),
            settingsItem('Log out', Icons.logout),

            SizedBox(height: 20,),
            

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        textAlign: TextAlign.start,
                'Membership number',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              const Text(
                'P5454z564',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
                  ],
                ),
                Expanded(child: SizedBox()),
                Container(
            // height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(25),
            ),
            child:Text('Copy'),
          )
              ],
            ),

            SizedBox(height: 30,),

            Row(
              children: [
                const Text(
                    'Wise v8.39.2',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
              ],
            ),
            ],
          ),
        ),
      ),
    );
  }
}

// Settings
// Help
// Privacy and security



Widget settingsItem(String? txt,IconData icon){
  return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey[200],
                          child:  Icon(icon),
                        ),
                  ],
                ),

          const SizedBox(width: 15,),
                 Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.start,
              txt??'',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            
                  ],
                ),
             const Expanded(child: SizedBox()),
                const Column(
                  children: [
                    Icon(Icons.keyboard_arrow_right)
                  ],
                )
              ],
            );
}