import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handzz/MyApplication.dart';
import 'package:handzz/home/cubit_shop.dart';
import 'package:handzz/home/states_shop.dart';
import 'package:handzz/login/login_screen.dart';
import 'package:handzz/search/search_screen.dart';
import 'package:handzz/signup/signup_screen.dart';


class ShopLayOut extends StatelessWidget {
  const ShopLayOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create:(BuildContext context) => ShopCubit()..getHomeData()..getCategories()..getFavorits()..getCarts()..getMyProfile()..getUserData() ,
      child: BlocConsumer<ShopCubit,ShopStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white.withOpacity(.1),
              elevation: 0,
              leading:
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Image.asset("assets/images/1.jpg",fit: BoxFit.fill,),
              ),

              actions: [
                IconButton(onPressed: (){
                  navigateTo(SearchScreen(), context);
                 }, icon: Icon(Icons.search,color: Colors.blue,)
                )
              ],
            ),
            body: cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor:  Colors.blue,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              elevation: 2,

              onTap: (index){
                cubit.ChangeBottom(index);
              },
              currentIndex: cubit.currentIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',),
                BottomNavigationBarItem(icon: Icon(Icons.apps),label: 'Categories'),
                BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorites'),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Carts'),
                BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
                BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
              ],
            ),
          );
        },
      ),
    );
  }
}
