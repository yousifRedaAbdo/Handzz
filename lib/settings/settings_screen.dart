import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handzz/constants.dart';
import 'package:handzz/home/cubit_shop.dart';
import 'package:handzz/home/states_shop.dart';

class SettingsScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ShopCubit
            .get(context)
            .loginModel;
        nameController.text = model!.data.name!;
        emailController.text = model.data.email!;
        phoneController.text = model.data.phone!;

        return ConditionalBuilder(
          condition: ShopCubit
              .get(context)
              .loginModel != null,
          builder: (context) =>
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      if(state is ShopLoadingUbdateUserDataState)
                        LinearProgressIndicator(),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: 'Name',
                            border: OutlineInputBorder()
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Name  must not be Empty';
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Email',
                            border: OutlineInputBorder()
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Email  must not be Empty';
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            labelText: 'Phone',
                            border: OutlineInputBorder()
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Phone  must not be Empty';
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            alignment: Alignment.center,

                          ),
                          onPressed: () {
                            if(formKey.currentState!.validate())
                            {
                              ShopCubit.get(context).ubdateUserData(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text
                              );
                            }
                          },
                          child: const Text(
                              "UPDATE",
                              style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            alignment: Alignment.center,

                          ),
                          onPressed: () {
                            signOut(context);
                          },
                          child: const Text(
                              "LOGOUT",
                              style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
