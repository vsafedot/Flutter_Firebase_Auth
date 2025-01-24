import 'package:blbla/my_button.dart';
import 'package:blbla/my_textfield.dart';
import 'package:blbla/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key,required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  void signin() async {

    showDialog(context: context, builder: (context){
      return Center(
        child: CircularProgressIndicator(),
      );
    });

    try{
      if(passwordController.text == confirmpass.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: usernameController.text,
          password: passwordController.text,
        );
      }

      Navigator.pop(context);
    } on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        wrongEmailMessage();
      } else if (e.code == 'wrong-password'){
        wrongPassword();
      }
    }


    Navigator.pop(context);


  }

  void wrongEmailMessage(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Incorrect Email'),
      );
    });
  }

  void wrongPassword(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Incorrect Password'),
      );
    });
  }


  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40,),
                const Icon(Icons.lock,
                  size: 100,),

                const SizedBox(height: 50,),
                Text('Let\'s start a new journey',
                  style: TextStyle(color: Colors.grey[700],fontSize: 16) ,),

                const SizedBox(height: 25,),
                MyTextfield(controller: usernameController,hintText: 'Username', obsecureText: false,),

                SizedBox(height: 10,),
                MyTextfield(controller: passwordController,hintText: 'Password',obsecureText: true,),

                SizedBox(height: 10,),
                MyTextfield(controller: confirmpass,hintText: 'Confirm Password',obsecureText: true,),


                SizedBox(height: 10,),
                MyButton(text: "Sign Up",onTap: signin,),

                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[500],
                        ),
                      ),
                      Text('Or continue with',style: TextStyle(color: Colors.grey[700]),),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imagePath: 'assets/google.png'),
                    SizedBox(width: 10,),
                    SquareTile(imagePath: 'assets/apple.png'),

                  ],
                ),

                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    SizedBox(width: 4,),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text('Login Now',
                      style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                      ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
