import 'package:handzz/cart/cart_item_model.dart';
import 'package:handzz/cart/get_cart_model.dart';
import 'package:handzz/favorites/change_favorites_model.dart';
import 'package:handzz/favorites/favorites_item_model.dart';
import 'package:handzz/home/home_model.dart';
import 'package:handzz/login/login_model.dart';

abstract class ShopStates{}
class ShopInisialState extends ShopStates{}
class ShopChangeBottomNavState extends ShopStates{}

class ShopLoadingHomeDataState extends ShopStates{}
class ShopSuccessHomeDataState extends ShopStates{}
class ShopErrorHomeDataState extends ShopStates{}

class ShopSuccessCategoriesState extends ShopStates{}
class ShopErrorCategoriesState extends ShopStates{}

class ShopLoadingGetProduct extends ShopStates{}
class ShopChangeProduct extends ShopStates{}
class ShopErrorChangeProduct extends ShopStates{}
class ShopSuccessGetProduct extends ShopStates
{
  final ProductModel model;
  ShopSuccessGetProduct(this.model);
}

class ShopSuccessChangeFavorits extends ShopStates
{
  final ChangeFavoritsModel model;
  ShopSuccessChangeFavorits(this.model);
}
class ShopChangeFavorits extends ShopStates{}
class ShopErrorChangeFavorits extends ShopStates{}

class ShopSuccessGetFavoritsState extends ShopStates{}
class ShopLoadingGetFavoritsState extends ShopStates{}
class ShopErrorGetFavoritsState extends ShopStates{}

class ShopSuccessUserDataState extends ShopStates
{
  final ShopLoginModel loginModel;

  ShopSuccessUserDataState(this.loginModel);
}
class ShopLoadingUserDataState extends ShopStates{}
class ShopErrorUserDataState extends ShopStates{}

class ShopSuccessUbdateUserDataState extends ShopStates
{
  final ShopLoginModel loginModel;

  ShopSuccessUbdateUserDataState(this.loginModel);
}
class ShopLoadingUbdateUserDataState extends ShopStates{}
class ShopErrorUbdateUserDataState extends ShopStates{}

class ShopSuccessMyProfileState extends ShopStates
{
  final ShopLoginModel loginModel;

  ShopSuccessMyProfileState(this.loginModel);
}
class ShopLoadingMyProfileState extends ShopStates{}
class ShopErrorMyProfileState extends ShopStates{}

class SearchInitialState extends ShopStates{}
class SearchLoadingState extends ShopStates{}
class SearchSucssesState extends ShopStates{}
class SearchErrorState extends ShopStates{}

class ChangeCartsState extends ShopStates{}
class SuccessCartsState extends ShopStates
{
  final AddCartModel addCartModel;

  SuccessCartsState(this.addCartModel);
}
class ErrorCartsState extends ShopStates
{
  final String erorr;
  ErrorCartsState(this.erorr );
}
class ShopingCartsVisibilityState extends ShopStates{}
class ShopSuccessGetCartState extends ShopStates{}
class ShopLoadingGetCartState extends ShopStates{}
class ShopErrorGetCartState extends ShopStates{}
class ShopSuccessUbdateQuantatyCartState extends ShopStates
{
  final GetCartsModel getCartsModel;

  ShopSuccessUbdateQuantatyCartState(this.getCartsModel);
}
class ShopLoadingUbdateQuantatyCartState extends ShopStates{}
class ShopErrorUbdateQuantatyCartState extends ShopStates{}

class plus extends ShopStates{}
class mins extends ShopStates{}
