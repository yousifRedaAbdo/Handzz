class AddCartModel
{
  late bool status;
  late String message;

  AddCartModel.fromJson(Map <String,dynamic> json)
  {
    status = json['status'];
    message = json['message'];
  }
}