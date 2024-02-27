import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget{
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();


}

class _SignupPageState extends State<SignupPage>{

  final _firstNameController = TextEditingController();
  bool _passToggle = true;
  bool _rePassToggle = true;

  @override
  Widget build(BuildContext context) {
   return SafeArea(child: Scaffold(
     appBar: AppBar(title: const Text("Signup here"),),
     body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
       child: SingleChildScrollView(
         scrollDirection: Axis.vertical,
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
             controller: _firstNameController,
             decoration: const InputDecoration(border: OutlineInputBorder(),
             labelText: "Last name"
             // hintText: "First name"
             ),
           ),
           const SizedBox(height: 18,),
           TextFormField(
             controller: _firstNameController,
             decoration: const InputDecoration(border: OutlineInputBorder(),
             labelText: "Email"
             // hintText: "First name"
             ),
           ),
           const SizedBox(height: 18,),
           TextFormField(
             controller: _firstNameController,
             decoration: const InputDecoration(border: OutlineInputBorder(),
             labelText: "Gender"
             // hintText: "First name"
             ),
           ),
           const SizedBox(height: 18,),
           TextFormField(
             obscureText: _passToggle,
             controller: _firstNameController,
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
             controller: _firstNameController,
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

         ],),
       ),
     ),

   ));
  }

}