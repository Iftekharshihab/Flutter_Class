import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DateTimeImage extends StatefulWidget {
  const DateTimeImage({Key? key}) : super(key: key);

  @override
  State<DateTimeImage> createState() => _DateTimeImageState();
}

class _DateTimeImageState extends State<DateTimeImage> {
  String date="Select Date";

  TimeOfDay selectedTime = TimeOfDay.now();

  String fileName="";
  File? file;
  final picker = ImagePicker();

  void _chooseCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera, imageQuality: 50, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (pickedFile != null) {
        file = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _chooseGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery, imageQuality: 50, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (pickedFile != null) {
        file = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form"),),
      body:  ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(height: 50,),
          InkWell(
            onTap: () async {
              DateTime? dateTime = await getDate(context);
              String? day;
              String? month;
              String? year;
              dateTime!.day<10 ? day='0${dateTime.day}' : day='${dateTime.day}';
              dateTime.month<10 ? month='0${dateTime.month}' : month='${dateTime.month}';
              year='${dateTime.year}';
              date='$day-$month-$year';
              setState(() {

              });
            },
            child: Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Center(child: Text(date)),
            ),
          ),

          SizedBox(height: 20,),

          InkWell(
            onTap: () async {
              _selectTime(context);
            },
            child: Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Center(child: Text("${selectedTime.hour}:${selectedTime.minute}")),
            ),
          ),

          SizedBox(height: 20,),
          InkWell(
            onTap: () async {
              _chooseCamera();
            },
            child: Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Center(child: Text("Capture")),
            ),
          ),

          SizedBox(height: 20,),
          InkWell(
            onTap: ()  async {
              _chooseGallery();
            },
            child: Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Center(child: Text("Chose from gallery")),
            ),
          ),

          SizedBox(height: 20,),

          SizedBox(height: 20,),
          file!=null ? Image.file(file! , height: 300, width: double.infinity, fit: BoxFit.cover,) : Container(),



        ],
      ),
    );
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if(timeOfDay != null && timeOfDay != selectedTime)
    {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }

}


//-----------------------------------------------------------------
Future<DateTime?> getDate(BuildContext context) async {
  return showDatePicker(
    context: context,
    initialDate: DateTime(2022,12, 15),
    firstDate: DateTime(2022,12, 10),
    lastDate: DateTime(2022, 12, 25),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData(
          colorScheme: ColorScheme.light(
            primary: Colors.blueAccent,
          ),
          dialogBackgroundColor: Colors.white,
        ),
        child: child!,
      );
    },
  );
}

//-----------------------------------------------------------------