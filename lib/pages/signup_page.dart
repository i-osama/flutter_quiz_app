import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget{
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();


}

class _SignupPageState extends State<SignupPage>{

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _genderController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePassController = TextEditingController();
  bool _passToggle = true;
  bool _rePassToggle = true;

  String? genderDropDown = "Male";

  final _formField = GlobalKey<FormState>();

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
             ),
             const SizedBox(height: 18,),
             TextFormField(
               controller: _lastNameController,
               decoration: const InputDecoration(border: OutlineInputBorder(),
               labelText: "Last name"
               // hintText: "First name"
               ),
             ),
             const SizedBox(height: 18,),
             TextFormField(
               controller: _emailController,
               decoration: const InputDecoration(border: OutlineInputBorder(),
               labelText: "Email"
               // hintText: "First name"
               ),
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
             
             DropdownButton<String>(
                 value: genderDropDown,
                 items: <String>["Male","Female","Others"].map( (String value){
                   return DropdownMenuItem<String>(
                     value: value,
                       child: Text(value));

                 }).toList() ,
             onChanged: (String? newValue){
                   setState(() {
                     genderDropDown = newValue;
                   });

             }),

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
             ),


             ElevatedButton(
               // submit button
               onPressed: () {
                 debugPrint("Signup submit pressed *");

                 if (_formField.currentState!.validate() == false ||
                     genderDropDown == null) {
                 //   // debugPrint("Gender;; $gender");
                 //   debugPrint(
                 //       "-----------------first:: ${genderToggle == false && gender == null} second:: ${genderToggle == true && gender != null}");
                 //   if ((genderToggle == false && gender == null) ||
                 //       (genderToggle == true && gender != null)) {
                 //     _genderErrorBoxVisible();
                 //   }
                 // } else if (_formField.currentState!.validate() &&
                 //     gender != null) {
                 //   // ######### Storing data after checking all after successful validation
                 //   _storeData(f_name_controller.text, l_name_controller.text,
                 //       email_controller.text, gender!, pass_controller.text);
                 //   f_name_controller.clear();
                 //   l_name_controller.clear();
                 //   email_controller.clear();
                 //   pass_controller.clear();
                 //   re_pass_controller.clear();
                 //
                 //   if (genderToggle) {
                 //     _genderErrorBoxVisible();
                 //   }
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

}