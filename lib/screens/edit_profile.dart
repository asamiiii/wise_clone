import 'package:flutter/material.dart';
import 'package:wise_clone/screens/main_view.dart';
import 'package:wise_clone/screens/settings.dart';
import 'package:wise_clone/screens/widgets.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(10),
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
                onPressed: () async{
                  await getImageFromFiles();
                  setState(() {
                    
                  });
                  // ignore: use_build_context_synchronously
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const MainView(),));
                  
                },
                child: const Text('Change')),
            const SizedBox(
              height: 30,
            ),
            Text(
              userName ?? '',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                          child: Text('Edit'),
                          onPressed: () async {
                            userName = controller.text;
                            firstChar = getInitials(controller.text);
                            setState(() {});
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainView(),
                                ));
                          },
                        ),
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                      title: Text('Edit User Name'),
                    ),
                  );
                },
                child: const Text('Change')),
          ],
        ),
      ),
    );
  }
}
