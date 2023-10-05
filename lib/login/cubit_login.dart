import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handzz/login/login_model.dart';
import 'package:handzz/login/states_login.dart';
import 'package:handzz/dio_helper.dart';
class ShopLoginCubit extends Cubit<ShopLoginStates>
{
  ShopLoginCubit() : super(InitialLoginState());
  static ShopLoginCubit get(context) => BlocProvider.of(context);
  late ShopLoginModel loginModel;
  void userLogin({
    required String email,
    required String password
  })
  {
    emit(LoadingLoginState());
    dioHelper.postdata(
        url: 'login',
        data:{
          'email':email,
          'password':password
        }).then((value){
      loginModel = ShopLoginModel.fromJson(value.data);
      emit(SuccessLoginState(loginModel));
    }).catchError((erorr){
      emit(ErrorLoginState(erorr.toString()));
    }) ;
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassowrdShow = true;

  void changePassowrdVisibility()
  {
    isPassowrdShow = !isPassowrdShow;
    suffix = isPassowrdShow ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopingChangePasworrdVisibilityState());
  }
}