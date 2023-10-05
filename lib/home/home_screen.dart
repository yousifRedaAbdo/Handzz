

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:handzz/MyApplication.dart';
import 'package:handzz/categories/categories_model.dart';
import 'package:handzz/constants.dart';
import 'package:handzz/home/cubit_shop.dart';
import 'package:handzz/home/states_shop.dart';
import 'package:handzz/home/home_model.dart';
import 'package:handzz/login/login_screen.dart';
import 'package:handzz/login/states_login.dart';
import 'package:handzz/cash_helper.dart';
import 'package:handzz/product/product.dart';
import 'package:handzz/shop_lay_out/shop_lay_out.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
         listener: (context, state) {
        if(state is ShopSuccessChangeFavorits)
        {
          if(!state.model.status)
          {
            Fluttertoast.showToast(
                msg: state.model.message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
            navigateTo(LoginScreen(), context);
          }
        }
        if(state is SuccessCartsState)
          {
            print(state.addCartModel.message);
          }
        },
      builder: (context, state) {
        return ConditionalBuilder(
            condition: ShopCubit.get(context).homeModel != null&& ShopCubit.get(context).categoriesModel != null,
            builder: (context) =>
                ProductBuilder(ShopCubit.get(context).homeModel,ShopCubit.get(context).categoriesModel,context),
            fallback: (context) => const Center(child: CircularProgressIndicator()));
      },
    ); 
  }

  Widget ProductBuilder(HomeModel? model ,CategoriesModel? categoriesModel,context) =>

      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Center(child: Text("OUR BEST STORES",style: TextStyle(fontSize: 24,color: Colors.blue,fontWeight: FontWeight.bold),)),
              Center(child: Text("have a nice shopping",style: TextStyle(fontSize: 24,color: Colors.blue.shade900,fontWeight: FontWeight.bold),)),
              SizedBox(height: 10,),
              CarouselSlider(
                  items: model?.data?.banners
                      .map((e) => Image(
                    image: NetworkImage('${e.image}'),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ))
                      .toList(),
                  options: CarouselOptions(
                      height: 250,
                      enableInfiniteScroll: true,
                      initialPage: 0,
                      viewportFraction: 1,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal)),
              const SizedBox(
                height: 10,
              ),
              Center(child: Text("PORTFOLIO",style: TextStyle(fontSize: 24,color: Colors.blue,fontWeight: FontWeight.bold),)),
              Center(child: Text("Check our latest work",style: TextStyle(fontSize: 24,color: Colors.blue.shade900,fontWeight: FontWeight.bold),)),
              Container(
                color: Colors.grey[300],
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  childAspectRatio: 1 / 1.69,
                  children: List.generate(model!.data!.products.length,
                          (index) => BuildGridProudect(model.data!.products[index],index,context)
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                 // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text("OUR CLIENTS",style: TextStyle(fontSize: 24,color: Colors.blue,fontWeight: FontWeight.bold),)),
                    SizedBox(height: 10,),
                    Center(child: Text("join us now and start your own Business over +600 store using Handzz",style: TextStyle(fontSize: 18,color: Colors.blue.shade900,fontWeight: FontWeight.bold),)),
                    SizedBox(height: 15,),
                    Container(
                      height: 100,
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index) => BuildCategoriesItem(categoriesModel!.data.data[index]),
                          separatorBuilder: (context,index)=>const SizedBox(width: 10,),
                          itemCount: categoriesModel!.data.data.length
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
  Widget BuildGridProudect(ProductModel model, index,context) => InkWell(
    onTap:() {
      navigateTo(Product_screen(index,model), context);
    },
    child: Stack(
      children: [
       Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(model.image),
                  width: double.infinity,
                  height: 200,
                ),
                if (model.discount != 0)
                  Container(
                    height: 12,
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    child: const Text(
                      'DISCOUNT',
                      style: const TextStyle(fontSize: 8, color: Colors.white),
                    ),
                  )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13, height: 1.3),
                  ),
                  Row(
                    children: [
                      Text(
                        '${model.price.round()}',
                        style: const TextStyle(fontSize: 12, color: Colors.blue),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      if (model.discount != 0)
                        Text(
                          '${model.oldprice.round()}',
                          style: const TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      const Spacer(),
                      IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            ShopCubit.get(context).addCart(model.id);
                            print(model.id);
                          },
                          icon: CircleAvatar(
                            radius: 20,
                            backgroundColor: ShopCubit.get(context).cartss[model.id]!? Colors.blueAccent : Colors.white,
                            child: const Icon(
                              Icons.add_shopping_cart_outlined,
                              size: 18,
                            ),
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
        IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              ShopCubit.get(context).changeFavorites(model.id);
              print(model.id);
            },
            icon: CircleAvatar(
              radius: 20,
              backgroundColor: ShopCubit.get(context).favorites[model.id]!? Colors.redAccent : Colors.white,
              child: const Icon(
                Icons.favorite_border,
                size: 18,
              ),
            )),
    ]
    ),
  );
  Widget BuildCategoriesItem(Data model) => Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Image(
        image: NetworkImage(model.image),
        height: 100,
        width: 100,
        fit: BoxFit.cover,
      ),
      Container(
          width: 100,
          height: 25,
          color: Colors.black.withOpacity(.8),
          child: Center(
            child: Text(
              model.name,
              style: const TextStyle(color: Colors.white,fontSize: 18),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
      )
    ],
  );
}
