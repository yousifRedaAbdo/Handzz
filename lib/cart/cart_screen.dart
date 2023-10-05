import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handzz/compands.dart';
import 'package:handzz/home/cubit_shop.dart';
import 'package:handzz/home/states_shop.dart';
import 'package:handzz/payment/payment_screen.dart';


class CartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context, state){
      },
      builder: (context, state){
        return Column(
          children: [
            Expanded(
              child: ConditionalBuilder(
                condition: state is! ShopLoadingGetCartState,
                builder: (context) => ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => buildListProduct(ShopCubit.get(context).getCartsModel!.data!.cartItems![index].product!,context),
                    separatorBuilder: (context, index) => myDivider(),
                    itemCount: ShopCubit.get(context).getCartsModel!.data!.cartItems!.length
                ),
                fallback: (context) => const Center(child: const CircularProgressIndicator()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text("Total Price: ", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Text("${ShopCubit.get(context).getCartsModel!.data!.total}",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Spacer(),
                  MaterialButton(child: Text("Make a Payment",style: TextStyle(color: Colors.white,fontSize: 15)),
                      color: Colors.blue,
                      onPressed: (){
                    navigateTo(context, PaymentScreen());
                  })
                ],
              ),
            )
            
          ],
        );
      },
    );
  }
}
