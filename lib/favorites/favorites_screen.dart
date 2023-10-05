import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handzz/compands.dart';
import 'package:handzz/home/cubit_shop.dart';
import 'package:handzz/home/states_shop.dart';
import 'package:handzz/login/cubit_login.dart';
import 'package:handzz/login/login_screen.dart';

class FavoritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
        return BlocConsumer<ShopCubit,ShopStates>(
          listener: (context, state){
        },
          builder: (context, state){
            return ConditionalBuilder(
              condition: state is! ShopLoadingGetFavoritsState,
              builder: (context) => ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildListProduct(ShopCubit.get(context).favoritsModel!.data!.data![index].product!,context),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: ShopCubit.get(context).favoritsModel!.data!.data!.length
              ),
              fallback: (context) => const Center(child: const CircularProgressIndicator()),

            );
          },
      );
  }
}
