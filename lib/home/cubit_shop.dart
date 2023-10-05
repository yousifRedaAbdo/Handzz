import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handzz/cart/cart_item_model.dart';
import 'package:handzz/cart/cart_screen.dart';
import 'package:handzz/cart/get_cart_model.dart';
import 'package:handzz/categories/categories_model.dart';
import 'package:handzz/categories/categories_screen.dart';
import 'package:handzz/constants.dart';
import 'package:handzz/favorites/change_favorites_model.dart';
import 'package:handzz/favorites/favorites_item_model.dart';
import 'package:handzz/favorites/favorites_screen.dart';
import 'package:handzz/home/home_model.dart';
import 'package:handzz/home/home_screen.dart';
import 'package:handzz/home/states_shop.dart';
import 'package:handzz/login/login_model.dart';
import 'package:handzz/profile/profile_screen.dart';
import 'package:handzz/search/search_models.dart';
import 'package:handzz/settings/settings_screen.dart';
import 'package:handzz/dio_helper.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;


class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInisialState());

  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bottomScreens =
  [
    HomeScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    CartScreen(),
    MyProfileScreen(),
    SettingsScreen()
  ];

  void ChangeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }
  late Map<int, bool> favorites = {};
  late Map<int, bool> cartss = {};

  HomeModel? homeModel;
  void getHomeData() {
    emit(ShopLoadingHomeDataState());
    dioHelper.getdata(
      url: 'home',
      token:token,
    ).then((value){
      homeModel = HomeModel.fromJson(value.data);
      homeModel!.data!.products.forEach((element) {
        favorites.addAll({
          element.id : element.infavorites
        });
      });
      homeModel!.data!.products.forEach((element) {
        cartss.addAll({
          element.id : element.incart
        });
      });
      print(cartss.toString());
    emit(ShopSuccessHomeDataState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }

  CategoriesModel? categoriesModel;
  void getCategories()
  {
    dioHelper.getdata(
      url: 'categories',
      token:token,
    ).then((value){
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(ShopSuccessCategoriesState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorCategoriesState());
    });
  }
   ProductModel? productModel;


  ChangeFavoritsModel? changeFavoritsModel;
  void changeFavorites(int productId)
  {
    favorites[productId] = !favorites[productId]!;
    emit(ShopChangeFavorits());
    dioHelper.postdata(
        url: "favorites",
        data: {
          'product_id' : productId
        },
        token: token
    ).then((value) {
      changeFavoritsModel = ChangeFavoritsModel.fromJson(value.data);
      print(value.data);
      if(!changeFavoritsModel!.status)
      {
        favorites[productId] = !favorites[productId]!;
      }
      else
      {
        getFavorits();
      }
      emit(ShopSuccessChangeFavorits(changeFavoritsModel!));
    }).catchError((error){
      favorites[productId] = !favorites[productId]!;
      emit(ShopErrorChangeFavorits());
    });
  }


  FavoritsModel? favoritsModel;
  void getFavorits()
  {
    emit(ShopLoadingGetFavoritsState());
    dioHelper.getdata(
      url: 'favorites',
      token:token,
    ).then((value){
      favoritsModel = FavoritsModel.fromJson(value.data);
      //  printFullText(value.data.toString());
      emit(ShopSuccessGetFavoritsState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorGetFavoritsState());
    });
  }
    ShopLoginModel? loginModel;
  void getUserData()
  {
    emit(ShopLoadingUserDataState());
    dioHelper.getdata(
      url: 'profile',
      token:token,
    ).then((value){
      loginModel = ShopLoginModel.fromJson(value.data);
      // printFullText(userModel!.data.name as String) ;
      emit(ShopSuccessUserDataState(loginModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }

  void getMyProfile()
  {
    emit(ShopLoadingMyProfileState());
    dioHelper.getdata(
      url: 'profile',
      token:token,
    ).then((value){
      loginModel = ShopLoginModel.fromJson(value.data);
      // printFullText(userModel!.data.name as String) ;
      emit(ShopSuccessMyProfileState(loginModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorMyProfileState());
    });
  }

  void ubdateUserData({
    required String? name,
    required String? email,
    required String? phone,
  })
  {
    emit(ShopLoadingUbdateUserDataState());
    dioHelper.putdata(
      url: 'update-profile',
      token:token,
      data: {
        'name': name,
        'email': email,
        'phone': phone
      },
    ).then((value){
      loginModel = ShopLoginModel.fromJson(value.data);
      emit(ShopSuccessUbdateUserDataState(loginModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorUbdateUserDataState());
    });
  }

  SearchModel? model;

  void search(String text)
  {
    emit(SearchLoadingState());
    dioHelper.postdata(
      url: 'products/search',
      token: token,
      data: {
        'text' : text
      },
    ).then((value){
      model = SearchModel.fromJson(value.data);
      emit(SearchSucssesState());
    }).catchError((erorr){
      print(erorr.toString());
      emit(SearchErrorState());
    }) ;
  }
  AddCartModel? addCartModel;
  void addCart(int productId)
  {
    cartss[productId] = !cartss[productId]!;
    emit(ChangeCartsState());
    dioHelper.postdata(
        url: "carts",
        data: {
          'product_id' : productId
        },
        token: token
    ).then((value) {
      addCartModel = AddCartModel.fromJson(value.data);
     // print(value.data);
      if(!addCartModel!.status)
      {
        cartss[productId] = !cartss[productId]!;
      }
      else
      {
        getCarts();
      }
      emit(SuccessCartsState(addCartModel!));
    }).catchError((error){
      cartss[productId] = !cartss[productId]!;
      emit(ErrorCartsState(error.toString()));
    });
  }
   GetCartsModel? getCartsModel;
  void getCarts()
  {
    emit(ShopLoadingGetCartState());
    dioHelper.getdata(
      url: 'carts',
      token:token,
    ).then((value){
      getCartsModel = GetCartsModel.fromJson(value.data);
      // printFullText(value.data.toString());
      emit(ShopSuccessGetCartState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorGetCartState());
    });
  }
  // void ubdateQuantatyCart({
  //   required int? quantity,
  // })
  // {
  //   emit(ShopLoadingUbdateQuantatyCartState());
  //   dioHelper.putdata(
  //     url: 'carts/3',
  //     token:token,
  //     data: {
  //       'quantity': quantity,
  //     },
  //   ).then((value){
  //     getCartsModel = GetCartsModel.fromJson(value.data);
  //     emit(ShopSuccessUbdateQuantatyCartState(getCartsModel!));
  //   }).catchError((error){
  //     print(error.toString());
  //     emit(ShopErrorUbdateQuantatyCartState());
  //   });
  // }
  // int counter = 1;
  //
  // void miuns ()
  // {
  //   counter--;
  //   emit(mins());
  // }
  //
  // void pluss ()
  // {
  //   counter++;
  //   emit(plus());
  // }
}

