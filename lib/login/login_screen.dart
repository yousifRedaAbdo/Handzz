import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:handzz/MyApplication.dart';
import 'package:handzz/constants.dart';
import 'package:handzz/login/cubit_login.dart';
import 'package:handzz/login/states_login.dart';
import 'package:handzz/shop_lay_out/shop_lay_out.dart';
import 'package:handzz/cash_helper.dart';
import 'package:handzz/signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passowrdController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if (state is SuccessLoginState) {
            print(state.loginModel.message);
            print(state.loginModel.status);
            if (state.loginModel.status) {
              print(state.loginModel.message);
              print(state.loginModel.data.token);
              cacheHelper
                  .saveData(key: 'token', value: state.loginModel.data.token)
                  .then((value) {
                token = state.loginModel.data.token;
                navigateTo(ShopLayOut(), context);
              });
            }
          } else if ((state is ErrorLoginState)) {
            Fluttertoast.showToast(
                msg: "يرجي التاكد من الايميل و الباسورد",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue.withOpacity(0.38),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                child: Container(
                  color: Colors.grey.withOpacity(0.35),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'WELCOME',
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Login now to browser our hot offers',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email,
                                  ),
                                  labelText: 'Email Address',
                                ),
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email address';
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: passowrdController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText:
                                    ShopLoginCubit.get(context).isPassowrdShow,
                                onFieldSubmitted: (value) {
                                  if (formKey.currentState!.validate()) {
                                    ShopLoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passowrdController.text);
                                  }
                                },
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock,
                                      ),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        ShopLoginCubit.get(context)
                                            .changePassowrdVisibility();
                                      },
                                      icon: Icon(
                                          ShopLoginCubit.get(context).suffix),
                                  ),
                                  labelText: 'Password',
                                ),
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'password is too short';
                                  }
                                },
                              ),
                              TextButton(
                                  onPressed: () {
                                    navigateTo(SignUPScreen(), context);
                                  },
                                  child: const Text("Forgot Password?")),
                              const SizedBox(
                                height: 20,
                              ),
                              ConditionalBuilder(
                                condition: state is! LoadingLoginState,
                                builder: (context) => ClipRRect(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(200),
                                      right: Radius.circular(200)),
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    child: MaterialButton(
                                      color: Colors.blue.withOpacity(0.5),
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          ShopLoginCubit.get(context).userLogin(
                                              email: emailController.text,
                                              password:
                                                  passowrdController.text);
                                        }
                                      },
                                      child: const Text("LOGIN",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ),
                                  ),
                                ),
                                fallback: (context) => const Center(
                                    child: CircularProgressIndicator()),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Center(
                                  child: Text(
                                'or',
                                style: TextStyle(fontSize: 20),
                              )),
                              const SizedBox(
                                height: 10,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(200),
                                    right: Radius.circular(200)),
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  child: MaterialButton(
                                    color: Colors.blue.withOpacity(0.5),
                                    onPressed: () {
                                      // if (formKey.currentState!.validate()) {
                                      //   ShopLoginCubit.get(context).userLogin(
                                      //       email: emailController.text,
                                      //       password: passowrdController.text);
                                      // }
                                    },
                                    child: const Text("LOGIN WITH GOOGLE+",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Do not have an account?',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextButton(
                                      onPressed: () {
                                        navigateTo(SignUPScreen(), context);
                                      },
                                      child: const Text("SignUP"))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
