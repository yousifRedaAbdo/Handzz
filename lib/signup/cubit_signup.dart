import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handzz/login/login_model.dart';
import 'package:handzz/signup/states_signup.dart';
import 'package:handzz/dio_helper.dart';
class ShopSignUpCubit extends Cubit<ShopSignUpStates>
{
  ShopSignUpCubit() : super(InitialSignUpState());
  static ShopSignUpCubit get(context) => BlocProvider.of(context);
  late ShopLoginModel loginModel;
  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  })
  {
    emit(LoadingSignUpState());
     dioHelper.postdata(
        url: 'register',
        data:{
          'name':name,
          'email':email,
          'password':password,
          'phone':phone
        }).then((value){
      print(value.data);
      loginModel = ShopLoginModel.fromJson(value.data);
      emit(SuccessSignUpState(loginModel));
    }).catchError((erorr){
       emit(ErrorSignUpState(erorr.toString()));
     }) ;
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassowrdShow = true;

  void changePassowrdVisibility()
  {
    isPassowrdShow = !isPassowrdShow;
    suffix = isPassowrdShow ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopingChangePasworrdVisibilityStatee());
  }
}