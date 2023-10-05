import 'package:flutter/material.dart';
import 'package:handzz/home/cubit_shop.dart';
import 'package:handzz/product/product.dart';
import 'package:handzz/product/product_search_screen.dart';

// Widget buildArticleItem(article,context) => InkWell(
//   onTap: (){
//     navigateTo(context, web_view(article['url']),);
//   },
//   child:Padding(
//
//     padding: const EdgeInsets.all(20.0),
//
//     child: Row(
//
//       children: [
//
//         Container(
//
//           width: 120,
//
//           height: 120,
//
//           decoration: BoxDecoration(
//
//               borderRadius: BorderRadius.circular(10),
//
//               image:  DecorationImage(
//
//                   fit:BoxFit.cover ,
//
//                   image: NetworkImage(
//
//                     '${article['urlToImage']}',
//
//                   )
//
//               )
//
//           ),
//
//         ),
//
//         const SizedBox(
//
//           width: 20,
//
//         ),
//
//         Expanded(
//
//           child: SizedBox(
//
//             height: 120,
//
//             child: Column(
//
//               crossAxisAlignment: CrossAxisAlignment.start,
//
//               mainAxisAlignment: MainAxisAlignment.start,
//
//               children:  [
//
//                 Expanded(
//
//                   child: Text(
//
//                     '${article['title']}',
//
//                     maxLines: 3,
//
//                     overflow: TextOverflow.ellipsis,
//
//                     style: Theme.of(context).textTheme.bodyText1,
//
//                   ),
//
//                 ),
//
//                 Text(
//
//                   '${article['publishedAt']}',
//
//                   style: const TextStyle(
//
//                     color: Colors.grey,
//
//                   ),
//
//                 )
//
//               ],
//
//             ),
//
//           ),
//
//         )
//
//       ],
//
//     ),
//
//   ),
// );
Widget myDivider() => const Padding(
  padding: EdgeInsets.symmetric(horizontal: 20),
  child:   Divider(
    height: 10,
    thickness: 1,
    color: Colors.grey,
  ),
);

// Widget articleBuilder (List,context) => ListView.separated(
//     physics:BouncingScrollPhysics(),
//     itemBuilder: (context, index) => buildArticleItem(List[index],context),
//     separatorBuilder: (context, index) => myDivider(),
//     itemCount: List.length
// ) ;

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

Widget buildListProduct(model ,context,{bool? isOldPrice = true}) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    width: double.infinity,
    height: 120,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image: NetworkImage(model.image.toString()),
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
            if (model.discount != 0 && isOldPrice!)
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
        const SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 13, height: 1.3),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     TextButton(
              //         onPressed: () {
              //             ShopCubit.get(context).miuns();
              //           ShopCubit.get(context).ubdateQuantatyCart(quantity: ShopCubit.get(context).counter);
              //         },
              //         child: Text('-',style: TextStyle(fontSize: 20))
              //     ),
              //     Text(
              //       "${ShopCubit.get(context).counter}",
              //       style: TextStyle(
              //           fontSize: 20.0,
              //           fontWeight: FontWeight.w900
              //       ),
              //     ),
              //
              //     TextButton(
              //         onPressed: () {
              //           ShopCubit.get(context).pluss();
              //           ShopCubit.get(context).ubdateQuantatyCart(quantity: ShopCubit.get(context).counter);
              //         },
              //         child: Text('+',style: TextStyle(fontSize: 20),)
              //     ),
              //
              //   ],
              // ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    model.price.toString(),
                    style: const TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  if (model.discount != 0 && isOldPrice!)
                    Text(
                      model.oldPrice.toString(),
                      style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough),
                    ),
                  const Spacer(),
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        ShopCubit.get(context).addCart(model.id as int);
                        print(model.id);
                      },
                      icon: CircleAvatar(
                        radius: 20,
                        backgroundColor: ShopCubit.get(context).cartss[model.id]! ? Colors.blueAccent : Colors.white,
                        child: const Icon(
                          Icons.add_shopping_cart_outlined,
                          size: 18,
                        ),
                      )),
                  const Spacer(),
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        ShopCubit.get(context).changeFavorites(model.id as int);
                      },
                      icon: CircleAvatar(
                        radius: 20,
                        backgroundColor: ShopCubit.get(context).favorites[model.id]! ? Colors.redAccent : Colors.white,
                        child: const Icon(
                          Icons.favorite_border,
                          size: 18,
                        ),
                      ))
                ],
              )
            ],
          ),
        )
      ],
    ),
  ),
);
Widget buildListProductSearch(model ,index,context,{bool? isOldPrice = true}) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: InkWell(
    onTap: ()
    {
      navigateTo(context,Product_screen_search(index,model));
    },
    child: Container(
      width: double.infinity,
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(model.image.toString()),
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
              if (model.discount != 0 && isOldPrice!)
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
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13, height: 1.3),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      model.price.toString(),
                      style: const TextStyle(fontSize: 12, color: Colors.blue),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    if (model.discount != 0 && isOldPrice!)
                      Text(
                        model.oldPrice.toString(),
                        style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),
                    const Spacer(),
                    // IconButton(
                    //     padding: EdgeInsets.zero,
                    //     onPressed: () {
                    //       ShopCubit.get(context).changeFavorites(model.id as int);
                    //     },
                    //     icon: CircleAvatar(
                    //       radius: 20,
                    //       backgroundColor: ShopCubit.get(context).favorites[model.id]! ? Colors.redAccent : Colors.white,
                    //       child: const Icon(
                    //         Icons.favorite_border,
                    //         size: 18,
                    //       ),
                    //     ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  ),
);