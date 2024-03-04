import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/database/database_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/constants/colors.dart';

class SignupPage extends StatefulWidget{
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();


}

class _SignupPageState extends State<SignupPage>{

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  // final _genderController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePassController = TextEditingController();
  bool _passToggle = true;
  bool _rePassToggle = true;

  String? _genderDropDown = "--gender--";

  final _formField = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    getAllDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
   return SafeArea(child: Scaffold(
     appBar: AppBar(title: const Text("Signup here"),),
     body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
       child: SingleChildScrollView(
         scrollDirection: Axis.vertical,
         child: Form(
           key: _formField,
           child: Column(children: [

             const SizedBox(height: 25,),

             TextFormField(
               controller: _firstNameController,
               decoration: const InputDecoration(border: OutlineInputBorder(),
               labelText: "First name"
               // hintText: "First name"
               ),
               validator: (value){
                 if(value!.isEmpty){return 'Field cannot be empty!';}
                 return null;
               },
             ),
             const SizedBox(height: 18,),
             TextFormField(
               controller: _lastNameController,
               decoration: const InputDecoration(border: OutlineInputBorder(),
               labelText: "Last name"
               // hintText: "First name"
               ),

               validator: (value){
                 if(value!.isEmpty){return 'Field cannot be empty!';}
                 return null;
               },
             ),
             const SizedBox(height: 18,),
             TextFormField(
               controller: _emailController,
               decoration: const InputDecoration(border: OutlineInputBorder(),
               labelText: "Email"

               ),
               validator: (value){
                 if(value!.isEmpty){return 'Field cannot be empty!';}

                 final bool emailValid = RegExp(
                     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                     .hasMatch(value);

                 if (!emailValid) {
                   return "Email format is not correct!";
                 }

                 return null;
               },
             ),
             const SizedBox(height: 18,),

             // ________________
             //  Gender
             // ________________
             
             // TextFormField(
             //   controller: _genderController,
             //   decoration: const InputDecoration(border: OutlineInputBorder(),
             //   labelText: "Gender"
             //   // hintText: "First name"
             //   ),
             // ),
             DropdownButtonFormField<String>(
               elevation: 15,
               icon: const Icon(Icons.keyboard_double_arrow_down_sharp),
               // value: _genderDropDown,
               hint: const Text("--gender--"),
               items: <String>["--gender--", "Male", "Female", "Others"].map((String value) {
                 return DropdownMenuItem<String>(
                   value: value,
                   child: Text(value),
                 );
               }).toList(),
               onChanged: (String? newValue) {
                 setState(() {
                   debugPrint('Gender value $newValue');
                   _genderDropDown = newValue;
                 });
               },
               validator: (value) {
                 if (value == null){
                   return "Gender cannot be empty!";
                 }
                 else if (value!.isEmpty || value == null) {
                   return "Gender cannot be empty!";
                 } else if (value == "--gender--") {
                   return "Please select a gender";
                 }
                 return null;
               },
             ),
             // ________________
             // Gender
             // ________________
             const SizedBox(height: 18,),
             TextFormField(
               obscureText: _passToggle,
               controller: _passwordController,
               decoration:  InputDecoration(border: const OutlineInputBorder(),
               labelText: "Password",
                 prefixIcon: const Icon(Icons.lock),
                 suffixIcon: GestureDetector(
                   onTap: (){
                     setState(() {
                       _passToggle = !_passToggle;
                     });
                   },
                   child: _passToggle? const Icon(Icons.visibility_outlined): const Icon(Icons.visibility_off_outlined),
                 ),

               ),
               validator: (value){
                 if(value!.isEmpty){return 'Field cannot be empty!';}
                 else if(value.length <5){return 'Password too short';}

                 return null;
               },
             ),
             const SizedBox(height: 18,),
             TextFormField(
               obscureText: _rePassToggle,
               controller: _rePassController,
               decoration:  InputDecoration(border: const OutlineInputBorder(),
               labelText: "Re-type password",
                   prefixIcon: const Icon(Icons.lock),
               suffixIcon: GestureDetector(onTap: (){
                 setState(() {
                   _rePassToggle = !_rePassToggle;
                 });
               },
                 child: _rePassToggle? const Icon(Icons.visibility_outlined): const Icon(Icons.visibility_off_outlined),) ,
               ),
               validator: (value){
                 if(value!.isEmpty){return 'Field cannot be empty!';}
                 else if(value != _passwordController.text){return 'Password does not matched';}
                 return null;
               },
             ),


             const SizedBox(height: 35,),
             ElevatedButton(
               // submit button
               onPressed: () {
                 // debugPrint("Signup submit pressed *");
                 debugPrint(_genderDropDown);

                 if (_formField.currentState!.validate()) {


                   _storeDataToDatabase();
                   _firstNameController.clear();
                   _lastNameController.clear();
                   _emailController.clear();
                   _passwordController.clear();
                   _rePassController.clear();
                   
                   Fluttertoast.showToast(msg: "Data have been saved successfully!");



                 } else {
                   debugPrint(
                       "----------------Something wrong!!------------");
                 }

                 // debugPrint(
                 //     "fname: ${f_name_controller.text} \n lname: ${l_name_controller.text} \n email: ${email_controller.text} \n pass: ${pass_controller.text} \n gender: $gender");
               },
               style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.green,
                   elevation: 2,

                   // makin responsive size for the button
                   minimumSize: Size(
                       MediaQuery.of(context).size.width < 80
                           ? double.infinity
                           : 400,
                       50),

                   // --------- changing the corner of the buttor ----------
                   shape: const RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(Radius.circular(6)))),
               child: const Text(
                 "Submit",
                 style: TextStyle(
                   fontSize: 17,
                   fontWeight: FontWeight.bold,
                   color: Colors.white,
                 ),
               ),
             ),
           ],
           ),
         ),
       ),
     ),

   ));
  }

  void _storeDataToDatabase() async{
    final dbHelper = DatabaseHelper.instance;
    // await DatabaseHelper.
    // await dbHelper.insertUser(firstName: firstName, lastName: lastName, email: email, gender: gender, password: password)



    await dbHelper.insertUser(
      firstName: _firstNameController.text,
      lastName:_lastNameController.text,
      email_: _emailController.text,
      gender_: _genderDropDown!,
      password_: _passwordController.text,
    );

    // await dbHelper.

  }

  void getAllDataFromDatabase() async{
    final dbHelper = DatabaseHelper.instance;

    // ---------------Get user data
    debugPrint("################### Data from the database ##########################");
    await dbHelper.readUsers();

  }

}