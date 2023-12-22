import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  TextInputType keyboardType;
  Widget icon;
  String hintText;
  int maxLines;
  bool? isOnChange = false;
  double? totalDept = 0;
  bool? readOnly = false;
  String? label;
  bool? isValid = true;
  Function? onTap;
  AppTextField(
      {Key? key,
      required this.controller,
      required this.keyboardType,
      required this.icon,
      required this.hintText,
      this.maxLines = 1,
      this.isOnChange,
      this.totalDept,
      this.readOnly = false,
      this.onTap,
      // this.isValid=true,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        readOnly: readOnly!,
        autofocus: true,
        maxLines: maxLines,
        onTap: () {
          debugPrint('aa');
          onTap!() ?? () {};
        },
        style: const TextStyle(
          fontSize: 15,
        ),
        textDirection: TextDirection.ltr,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            // errorText:isValid == false? AppErrorsStrings.requiredField : null,
            contentPadding: const EdgeInsets.all(20.0),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: icon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            hintText: hintText,
            hintTextDirection: TextDirection.ltr,
            labelText: label));
  }
}

File? image = File('');
String? imagePath;
Future<void> getImageFromFiles() async {
  PickedFile? pickedFile = await ImagePicker().getImage(
    source: ImageSource.gallery,
  );
  if (pickedFile != null) {
    imagePath = pickedFile.path;
    debugPrint('imagePath : $imagePath');
    image = File(imagePath!);
    saveImageToStorage(imagePath);
  } else {
    print('No image selected');
  }
// debugPrint('imagePath : $imagePath');

  // return imageUrl;
}

Future<void> saveImageToStorage(String? image) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  debugPrint('profile Imge Pathe : $imagePath');
  await prefs.setString('profile_image', image!);
}

Future<void> saveProfileName(String? name) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('profile_name', name!);
}

Future<String?> getProfileName() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getString('profile_name');
}
