import 'package:flutter/material.dart';

class HomeModel
{
  late bool status;
  HomeDataModel? data;
  HomeModel.fromJson(Map<String,dynamic> json)
  {
    status = json['status'];
    data = HomeDataModel.fromJson(json['data']);
  }
}
class HomeDataModel
{
  List<BannerModel>banners=[];
  List<ProductModel>products=[];
  HomeDataModel.fromJson(Map<String,dynamic> json)
  {
    json['banners'].forEach((element)
    {
      banners.add(BannerModel.fromJson(element));
    }
    );
    json['products'].forEach((element)
    {
      products.add(ProductModel.fromJson(element));
    }
    );
  }
}
class BannerModel
{
  late int id;
  late String image;
  BannerModel.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    image = json['image'];
  }
}
class ProductModel
{
  late int id;
  dynamic price;
  dynamic oldprice;
  dynamic discount;
  late String image;
  late String name;
  String? description;
  List<String>? images;
  late bool infavorites;
  late bool incart;
  ProductModel.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    price = json['price'];
    oldprice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    infavorites = json['in_favorites'];
    incart = json['in_cart'];

  }
}
