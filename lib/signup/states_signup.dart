
import 'package:handzz/login/login_model.dart';

abstract class ShopSignUpStates {}

class InitialSignUpState extends ShopSignUpStates{}
class LoadingSignUpState extends ShopSignUpStates{}
class SuccessSignUpState extends ShopSignUpStates
{
   final ShopLoginModel loginModel;
   SuccessSignUpState(this.loginModel);

}
class ErrorSignUpState extends ShopSignUpStates
{
  final String error;
  ErrorSignUpState(this.error);

}
class ShopingChangePasworrdVisibilityStatee extends ShopSignUpStates {}