import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handzz/home/cubit_shop.dart';
import 'package:handzz/home/states_shop.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return BlocConsumer<ShopCubit,ShopStates>(
        listener: (context,state){},
        builder: (context,state){
          var model = ShopCubit.get(context).loginModel;
          return ConditionalBuilder(
            condition: ShopCubit
                .get(context)
                .loginModel != null,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children:   [
                  if(state is ShopLoadingUserDataState)
                    const LinearProgressIndicator(),
                   CircleAvatar(
                    backgroundImage:  NetworkImage(model!.data.image as String) ,
                    radius: 60,
                  ),
                  const SizedBox(height: 40,),
                  Row(
                    children: [
                      const Text("Name: ",style: const TextStyle(fontSize: 23),),
                      Text(model.data.name as String ,style: const TextStyle(fontSize: 18),)
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      const Text("Email: ",style: TextStyle(fontSize: 23),),
                      Text(model.data.email as String,style: const TextStyle(fontSize: 18),)
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      const Text("phone: ",style: TextStyle(fontSize: 23),),
                      Text(model.data.phone as String,style: const TextStyle(fontSize: 18),)
                    ],
                  )
                ],
              ),
            ),
            fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
          },
    );
  }
}
