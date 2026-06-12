import 'package:ecommerce_app/home/model/list_of_models.dart';
import 'package:flutter/material.dart';

class HomeModel {
  List<Banners> banners;
  List<Featured> feature;
  List<Deal> deals;
  List<Category> categories;

  HomeModel(this.banners, this.feature, this.deals, this.categories);
}
