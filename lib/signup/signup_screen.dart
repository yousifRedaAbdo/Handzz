import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:handzz/compands.dart';
import 'package:handzz/constants.dart';
import 'package:handzz/shop_lay_out/shop_lay_out.dart';
import 'package:handzz/signup/cubit_signup.dart';
import 'package:handzz/signup/states_signup.dart';
import 'package:handzz/cash_helper.dart';

class SignUPScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passowrdController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider( create: (BuildContext context)=>ShopSignUpCubit(),
      child: BlocConsumer<ShopSignUpCubit,ShopSignUpStates>(
        listener: (context,state){
          if (state is SuccessSignUpState)
          {
            if (state.loginModel.status)
            {
              print(state.loginModel.message);
              print(state.loginModel.data.token);
              cacheHelper.saveData(
                  key: 'token',
                  value: state.loginModel.data.token
              ).then((value) {
                token = state.loginModel.data.token;
                navigateTo(context,  ShopLayOut());
              });
            }
          }
          else if (state is ErrorSignUpState)
          {
            Fluttertoast.showToast(
                msg: "تاكد من ادخال البيانات الصحيحه",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
        },
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue.withOpacity(0.38),
            ),
            body:Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                child: Container(
                    color: Colors.grey.withOpacity(0.35),
            child : Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        const Text(
                          'WELCOME',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Register now to browser our hot offers',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                              prefixIcon: Icon( Icons.person),
                              labelText: 'First name',
                          ),
                          validator: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'Please enter your name ';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            prefixIcon: Icon( Icons.person),
                            labelText: 'Last name',
                          ),
                          validator: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'Please enter your name ';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            prefixIcon: Icon( Icons.person),
                            labelText: 'User name',
                          ),
                          validator: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'Please enter your name ';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              prefixIcon: Icon( Icons.email),
                              labelText: 'Email Address',
                          ),
                          validator: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'Please enter your email address';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: passowrdController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: ShopSignUpCubit.get(context).isPassowrdShow,
                          onFieldSubmitted: (value)
                          {

                          },
                          decoration: InputDecoration(
                              prefixIcon: const Icon( Icons.lock),
                              suffixIcon: IconButton(
                                onPressed: (){
                                  ShopSignUpCubit.get(context).changePassowrdVisibility();
                                },
                                icon: Icon(ShopSignUpCubit.get(context).suffix)),
                              labelText: 'Password',
                          ),

                          validator: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'password is too short';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                              prefixIcon: Icon( Icons.phone),
                              labelText: 'Phone',
                          ),

                          validator: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'Phone is error';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoadingSignUpState,
                          builder: (context)=> ClipRRect(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(200),
                                right: Radius.circular(200)),
                            child: Container(
                              width: double.infinity,
                              height: 40,
                              child: MaterialButton(
                                color:Colors.blue.withOpacity(0.5),
                                onPressed: (){
                                  if (formKey.currentState!.validate())
                                  {
                                    ShopSignUpCubit.get(context).userRegister(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passowrdController.text,
                                        phone: phoneController.text
                                    );
                                  }
                                },
                                child: const Text(
                                    "SIGN UP",
                                    style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white)
                                ),
                              ),
                            ),
                          ),
                          fallback: (context)=> const Center(child: CircularProgressIndicator()),
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
                            height: 40,
                            child: MaterialButton(
                              color:Colors.blue.withOpacity(0.5),
                              onPressed: (){
                                if (formKey.currentState!.validate())
                                {
                                  ShopSignUpCubit.get(context).userRegister(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passowrdController.text,
                                      phone: phoneController.text
                                  );
                                }
                              },
                              child: const Text(
                                  "SIGN UP WITH GOOGLE+",
                                  style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white)
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
           ),
         ),
        ) ,
          );
        },
      ),
    );
  }
}
