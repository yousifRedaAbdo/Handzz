import 'package:flutter/material.dart';
import 'package:handzz/compands.dart';
import 'package:handzz/creat_store/creat_store_screen.dart';
import 'package:handzz/login/login_screen.dart';
import 'package:handzz/signup/signup_screen.dart';

class LoginOrLogin extends StatelessWidget {
  const LoginOrLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.38),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(child: Container()),
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(400)),
                  child: Container(
                    color: Colors.blue.withOpacity(.2),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Image(image: AssetImage('assets/images/Sales consulting-amico.png')),
              SizedBox(
                height: 20,
              ),
              Text('Sign In',style: TextStyle(fontSize: 30,color: Colors.blueAccent,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(200),
                        right: Radius.circular(200)),
                    child: Container(
                      width:155,
                      height: 50,
                      child: MaterialButton(
                        color: Colors.blue.withOpacity(0.5),
                        onPressed: () {
                          navigateTo(context, LoginScreen());
                          },
                        child: const Text("as user",
                            style: TextStyle(
                              fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(200),
                        right: Radius.circular(200)),
                    child: Container(
                      width: 155,
                      height: 50,
                      child: MaterialButton(
                        color: Colors.blue.withOpacity(0.5),
                        onPressed: () {
                          navigateTo(context, LoginScreen());
                        },
                        child: const Text("as store owner",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text('Register',style: TextStyle(fontSize: 30,color: Colors.blueAccent,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(200),
                        right: Radius.circular(200)),
                    child: Container(
                      width:155,
                      height: 50,
                      child: MaterialButton(
                        color: Colors.blue.withOpacity(0.5),
                        onPressed: () {
                          navigateTo(context, SignUPScreen());
                        },
                        child: const Text("Sign Up",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(200),
                        right: Radius.circular(200)),
                    child: Container(
                      width:155,
                      height: 50,
                      child: MaterialButton(
                        color: Colors.blue.withOpacity(0.5),
                        onPressed: () {
                          navigateTo(context, CreatStore());
                        },
                        child: const Text("Create your store",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
 