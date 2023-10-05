import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handzz/categories/categories_model.dart';
import 'package:handzz/compands.dart';
import 'package:handzz/home/cubit_shop.dart';
import 'package:handzz/home/states_shop.dart';
import 'package:handzz/web_view/web_view_screen.dart';


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return BlocConsumer<ShopCubit,ShopStates>(
          listener: (context, state){},
          builder: (context, state){
            return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildCatItem(ShopCubit.get(context).categoriesModel!.data.data[index],context),
                separatorBuilder: (context, index) => myDivider(),
                itemCount: ShopCubit.get(context).categoriesModel!.data.data.length
            );
          },

      );
  }

  Widget buildCatItem(Data model,context) => InkWell(
    onTap: (){
      navigateTo(context, web_view('https://handzz.onrender.com/store/64a41d235cc988f04f1ed9e1'));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Image(
            image: NetworkImage(model.image),
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
          SizedBox(width: 20,),
          Text(
            model.name,
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,

          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    ),
  );
}
