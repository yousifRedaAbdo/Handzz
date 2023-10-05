
import 'package:handzz/login/login_model.dart';

abstract class ShopLoginStates {}

class InitialLoginState extends ShopLoginStates{}
class LoadingLoginState extends ShopLoginStates{}
class SuccessLoginState extends ShopLoginStates
{
  final ShopLoginModel loginModel;

  SuccessLoginState(this.loginModel);
}
class ErrorLoginState extends ShopLoginStates
{
  final String erorr;
  ErrorLoginState(this.erorr );
}
class ShopingChangePasworrdVisibilityState extends ShopLoginStates{}