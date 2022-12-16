import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _nameController=TextEditingController();
  TextEditingController _lastnameController=TextEditingController();
  TextEditingController _passController=TextEditingController();

  final _formKey=GlobalKey<FormState>();

  late String name="";

  var secure=true;

  var isCheck=false;

  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  var isSwitch=false;

  Object? _gender="";

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    _nameController.text="";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            SizedBox(height: 00,),
            /*Text("Email"),
            SizedBox(height: 5,),
            TextField(
              keyboardType: TextInputType.emailAddress,
              maxLength: 10,
              controller: _emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2
                  )
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 2
                    )
                ),
              ),
            ),
            Text("Phone"),
            SizedBox(height: 5,),
            TextField(
              keyboardType: TextInputType.phone,
              maxLength: 11,
              controller: _phoneController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black,
                        width: 2
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 2
                    )
                ),
              ),
            ),
*/
           // Text("Password"),
            /*SizedBox(height: 5,),
            Container(
              padding: EdgeInsets.all(8),
              decoration: decDesign(),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                maxLength: 8,
                controller: _passController,
                obscureText: true,
                decoration: InputDecoration(
                  label: Text("Password"),
                  hintText: "Password",
                  icon: Icon(Icons.security),

                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 2
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.green,
                          width: 2
                      )
                  ),
                ),

              ),
            ),*/

            SizedBox(height: 30,),

            Form(
              key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text("First Name"),
                SizedBox(height: 5,),
                Container(
                  padding: EdgeInsets.only(left: 15, top: 0, right: 15),
                  decoration: decDesign(),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: "Enter your Name",
                        border: InputBorder.none
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please Enter your first name";
                      }
                      name=value;
                      setState(() {

                      });
                      return null;
                    }
                  ),
                ),

                SizedBox(height: 10,),
                Text("Last Name"),
                SizedBox(height: 5,),
                Container(
                  padding: EdgeInsets.only(left: 15, top: 0, right: 15),
                  decoration: decDesign(),
                  child: TextFormField(
                      controller: _lastnameController,
                      decoration: InputDecoration(
                          hintText: "Enter your Name",
                          border: InputBorder.none
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Please Enter your last name";
                        }
                        name=value;
                        setState(() {

                        });
                        return null;
                      },
                    onChanged: (value){
                        setState(() {
                          _nameController.text=value;
                          name=_nameController.text;
                        });
                    },

                  ),
                ),

                SizedBox(height: 10,),
                Text("Password"),
                SizedBox(height: 5,),
                Container(
                  padding: EdgeInsets.only(left: 15, top: 0, right: 15),
                  decoration: decDesign(),
                  child: Row(
                    children: [
                      Icon(Icons.security),
                      Expanded(
                        child: TextFormField(
                          controller: _passController,
                          obscureText: secure,
                          decoration: InputDecoration(
                              hintText: "Enter your Password",
                              border: InputBorder.none
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please Enter your password";
                            }
                            name=value;
                            setState(() {

                            });
                            return null;
                          },
                          onChanged: (value){
                            setState(() {
                              _nameController.text=value;
                              name=_nameController.text;
                            });
                          },

                        ),
                      ),

                      IconButton(onPressed: (){
                        setState(() {
                          secure=!secure;
                        });
                      }, icon: Icon( secure ? Icons.remove_red_eye: Icons.panorama_fish_eye, color: secure ? Colors.black: Colors.white,)
                      )
                    ],
                  ),
                ),

                Container(
                  child: Row(
                    children: [
                    Checkbox(value: isCheck, onChanged: (bool? value){
                      setState(() {
                        isCheck=value!;
                        secure=!isCheck;
                      });
                    }),

                      Text("Show Password")
                    ],
                  ),
                ),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 15, top: 0, right: 15),
                  decoration: decDesign(),
                  child: DropdownButton(
                    value: dropdownvalue,
                      isExpanded: true,
                      hint: Text("Select Item"),
                      icon: Icon(Icons.keyboard_arrow_down_outlined),
                      items: items.map((String? item) {
                        return DropdownMenuItem(
                          value: item,
                            child: Text(item!));
                      }).toList(),
                      onChanged: (String? value){
                      setState(() {
                        dropdownvalue=value!;
                      });
                      }),
                ),

/*                Row(
                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(
                    height: 40,
                    width: 40,
                    color: Colors.green,
                  ),

                  Flexible(
                    child: Container()
                  ),

                  Container(
                    height: 40,
                    width: 40,
                    color: Colors.red,
                  ),


                  ],
                ),*/

              Row(
                children: [
                  Text("Is Teacher"),
                  Expanded(child: Container()),
                  Switch(
                      value: isSwitch,
                      onChanged: (bool value){
                    setState(() {
                      isSwitch=!isSwitch;
                    });
                  }),
                ],
              ),

                Text("Gender"),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Radio(value: 0,
                        groupValue: _gender,
                        onChanged: (value){
                          setState(() {
                            _gender=value;
                          });
                        }),
                    Text("Male"),

                   // Expanded(child: Container()),

                    Radio(value: 1,
                        groupValue: _gender,

                        onChanged: (value){
                          setState(() {
                            _gender=value;
                          });
                        }),
                    Text("Female"),

                    Radio(value: 2,
                        groupValue: _gender,
                        onChanged: (value){
                          setState(() {
                            _gender=value;
                          });
                        }),
                    Text("Others")

                  ],
                ),

                Row(
                  children: [
                    Radio(value: 2,
                        groupValue: _gender,
                        onChanged: (value){
                         setState(() {
                           _gender=value;
                         });
                        }),
                    Text("3rd Gender"),
                    Expanded(child: Container()),
                    Radio(value: 2,
                        groupValue: _gender,
                        onChanged: (value){
                          setState(() {
                            _gender=value;
                          });
                        }),
                    Text("Others")
                  ],

                ),

                Center(
                  child: ElevatedButton(onPressed: (){
                    _submit();
                  }, child: Text("Submit")),
                ),
                
                SizedBox(height: 10,),
                
                Text((dropdownvalue))
              ],
            ))

          ],
        ),
      ),
    );
  }
}

decDesign() {
  return BoxDecoration(
      color: Colors.grey,
      //shape: BoxShape.circle,
      borderRadius: BorderRadius.all(Radius.circular(50))

  );
}
