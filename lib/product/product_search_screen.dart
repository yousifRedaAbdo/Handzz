import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:handzz/home/cubit_shop.dart';
import 'package:handzz/home/states_shop.dart';
import 'package:handzz/search/search_models.dart';

class Product_screen_search extends StatelessWidget {
  final Product modell;
  final int index;
  Product_screen_search(this.index,this.modell);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ShopCubit()..getHomeData(),
      child: BlocConsumer<ShopCubit,ShopStates>(
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
            }
          }
        },
        builder: (context, state) {
          late var model = ShopCubit.get(context).model;
          return  Scaffold(
            appBar: AppBar(),
            body:Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomStart,
                        children: [
                          Image(
                            image: NetworkImage(model!.data!.data![index].image.toString()),
                            width: double.infinity,
                            height: 200,
                          ),
                          if (model.data!.data![index].discount != 0)
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
                              ShopCubit.get(context).model!.data!.data![index].name.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 13, height: 1.3),
                            ),
                            Row(
                              children: [
                                Text(
                                  '${model.data!.data![index].price.round()}',
                                  style: const TextStyle(fontSize: 12, color: Colors.blue),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                if (model.data!.data![index].discount != 0)
                                  Text(
                                    '${model.data!.data![index].oldPrice.round()}',
                                    style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                const Spacer(),
                                // IconButton(
                                //     padding: EdgeInsets.zero,
                                //     onPressed: () {
                                //       ShopCubit.get(context).changeFavorites(modell.id);
                                //     },
                                //     icon: CircleAvatar(
                                //       radius: 20,
                                //       backgroundColor: ShopCubit.get(context).favorites[modell.id]!? Colors.redAccent : Colors.white,
                                //       child: const Icon(
                                //         Icons.favorite_border,
                                //         size: 18,
                                //       ),
                                //     ))
                              ],
                            ),
                            CarouselSlider(
                                items: model.data!.data![index].images!
                                    .map((e) => Image(
                                  image: NetworkImage(e),
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
                            Text("Description",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,),
                            Text(
                              model.data!.data![index].description.toString(),
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      )
                    ],
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
