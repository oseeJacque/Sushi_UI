import 'package:flutter/material.dart'; 

class SushiModel{
  late String title;
  late String desc;
  late String price;
  late String image;

  SushiModel(this.title,this.desc,this.price,this.image); 
  static List<SushiModel> list=[
    SushiModel("Sushi Ebi", "Rice + Ebi", "6.50", "assets/image_sushi/ebi.png"),
    SushiModel("Sushi Salmon", "Rice + Salmon", "10.50", "assets/image_sushi/salomon.png"),
    SushiModel("Sushi Sushi", "Rice + Sushi", "4.50", "assets/image_sushi/sushi.png"),
    SushiModel("Sushi Tomago", "Rice + Tomago", "8.25", "assets/image_sushi/tomago.png"),
    SushiModel("Sushi Tuna", "Rice + Tuna", "15.00", "assets/image_sushi/tuna.png"),
    SushiModel("Sushi Wasabi", "Rice + Wasabi", "14.50", "assets/image_sushi/wasabi.png"),
  ];
}