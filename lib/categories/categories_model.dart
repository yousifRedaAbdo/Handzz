class CategoriesModel {

  late final bool status;
  late CategoriesDataModel data;

  CategoriesModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = CategoriesDataModel.fromJson(json['data']);
  }
}
class CategoriesDataModel
{
  late int current_page;
  List<Data> data = [];
  CategoriesDataModel.fromJson(Map<String, dynamic> json){
    current_page = json['current_page'];
    json['data'].forEach((element) {
      data.add(Data.fromJson(element));
    });}
}
class Data {

  late int id;
  late String name;
  late String image;

  Data.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

}