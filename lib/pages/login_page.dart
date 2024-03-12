import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/pages/dashboard.dart';
import 'package:flutter_quiz_app/pages/signup_page.dart';
import 'package:flutter_quiz_app/utils/constants/colors.dart';
import 'package:flutter_quiz_app/widgets/top_bar.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userNameController = TextEditingController();
  final _passController = TextEditingController();

  bool _passToggle = true;
  final _formField = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: AppBar(title: const Text("Login page"),),
    body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
      child: Form(
        key: _formField,
        child: Column(children: [
          const SizedBox(height: 20,),
           TextFormField(
            controller: _userNameController,
            validator: (value){
              if(value!.isEmpty){return "please enter the email";}
            },
            decoration: const InputDecoration(
                labelText: "username or email",
                prefixIcon: Icon(Icons.person_outline_outlined)),),
          const SizedBox(height: 20,),
          TextFormField(
             controller: _passController,
             obscureText: _passToggle,
             validator: (value){
               if(value!.isEmpty)return "Please enter the password!";
             },
             decoration: InputDecoration(labelText: "password",

                 prefixIcon: const Icon(Icons.lock),
                 suffixIcon: GestureDetector(onTap: (){
                   setState(() {
                     _passToggle = !_passToggle;
                   });
                 },
                   child: _passToggle? const Icon(Icons.visibility_outlined): const Icon(Icons.visibility_off_outlined),) ,

             ),
          ),
          const SizedBox(height: 55,),
          //--
          //   Submit button
          //--
          ElevatedButton(onPressed: (){
            if(_formField.currentState!.validate()){
              // Login button pressed
              // ...... check if the data is in the local database or not
              // if the data is true than go to Home() page

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Dashboard()),);

            }
          },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              elevation: 2,
              minimumSize: const Size(400, 50),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2)))
              ),

              child: const Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),),
          const SizedBox(height: 25,),

          // ........ Going to signup page
          RichText(
            text:  TextSpan(
              children: [
                TextSpan(
                  text: 'Do not have an account?! ',
                 style:  Theme.of(context).textTheme.bodySmall,

                 // ####################
                 // ####################
                 // style: TextStyle(color: ThColors.getThemedColor(context, "black")) //  Getting color value by using function

                ),
                TextSpan(
                  text: 'create an account',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor, // Customize the style for the second par
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()..onTap =(){

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupPage()),);

                  }
                ),
              ],
            ),
          )

        ],),
      ),
    ),),);
  }
}