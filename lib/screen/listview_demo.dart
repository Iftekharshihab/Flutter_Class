import 'package:flutter/material.dart';
import 'package:flutter_class/screen/model/contact_model.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLuncher;

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  State<ListViewDemo> createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text("List View Demo"),

      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: contactList.length,
          itemBuilder: (context , index){
          return ListTile(
            leading: Icon(Icons.person, color: Colors.blue,),
            title: Text(contactList[index].name.toString() , style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), ),
            subtitle: Text(contactList[index].phone),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: (){
                      _makeSms(contactList[index].phone);
                    },
                    icon: Icon(Icons.sms, color: Colors.blue,)),
                IconButton(
                    onPressed: (){
                      _makePhoneCall(contactList[index].phone);
                    },
                    icon: Icon(Icons.call, color: Colors.green,))
              ],
            ),
          );
          }),
    );
  }
}

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: "+88${phoneNumber}",
  );
  await UrlLuncher.launchUrl(launchUri);
}
Future<void> _makeSms(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'sms',
    path: "+88${phoneNumber}",
  );
  await UrlLuncher.launchUrl(launchUri);
}