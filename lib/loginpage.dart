import 'package:blbla/my_button.dart';
import 'package:blbla/my_textfield.dart';
import 'package:blbla/square_tile.dart';
import 'package:flutter/material.dart';


class Loginpage extends StatelessWidget {
 Loginpage({super.key});
  void signin(){}
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
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
               const SizedBox(height: 50,),
                const Icon(Icons.lock,
                size: 100,),
            
                const SizedBox(height: 50,),
                Text('Welcome back you\'ve been missed!',
                style: TextStyle(color: Colors.grey[700],fontSize: 16) ,),
            
                const SizedBox(height: 25,),
                MyTextfield(controller: usernameController,hintText: 'Username', obsecureText: false,),
            
                SizedBox(height: 10,),
                MyTextfield(controller: passwordController,hintText: 'Password',obsecureText: true,),
            
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
            
                SizedBox(height: 10,),
                MyButton(onTap: signin,),
            
                SizedBox(height: 50,),
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
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imagePath: 'assets/google.png'),
                    SizedBox(width: 10,),
                    SquareTile(imagePath: 'assets/apple.png'),
            
                  ],
                ),
            
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                    ),
                    SizedBox(width: 4,),
                    Text('Register Now',style: TextStyle(
                      color: Colors.blue,fontWeight: FontWeight.bold,
                    ),)
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
