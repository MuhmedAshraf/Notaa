import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png',height: size.height/3,),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        label: Text('Username'),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        label: Text('Password'),
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                  ],
                )),
                Row(children: [
                  Text('If you dont have an account'),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'signup');
                      },
                      child: Text(
                        'Click Here',
                        style: TextStyle(color: Colors.blue),
                      ))
                ]),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'home');
                  },
                  child: Text('Login'),
                  color: Colors.blue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
