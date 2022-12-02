import 'package:flutter/material.dart';
import 'package:sushi_restaurant_ui/Flutter_app_icons.dart';
import 'package:sushi_restaurant_ui/app_themes.dart';
import 'package:sushi_restaurant_ui/models/TextStyer.dart';
import 'package:sushi_restaurant_ui/widgets/HomeTopSushView.dart';
import 'package:sushi_restaurant_ui/widgets/circle_bouton_widgets.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 35.0,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CircleButtonWidgets(Icons.menu),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextStyler("👋 Hi, Angle!",fontSize: 20.0, fontWeight: FontWeight.bold,),
            ),
            const SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextStyler("What  is your favorite Sushi?",fontSize: 25.0,fontWeight: FontWeight.bold,),
            ),
            buildSearch(),
            const SizedBox(height: 10.0,),
            buildHeader("Categories", () {}),
            const SizedBox(height: 12.0,),
            buildCategories(),
            const SizedBox(height: 12.0,),
            buildHeader("Top sushi", () {}),
            SizedBox(
              height: 300,
              child: HomeTopSushiView(),
              ),
          ],
        ),
      ),
    );
  }

//Barre de recherche
  Widget buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: TextField(
            //autocorrect:true,
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
      ),
    );
  }

  Widget buildHeader(String Title, VoidCallback onSeeAllTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextStyler(
            Title,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          InkWell(
            onTap: onSeeAllTap,
            child: TextStyler("See all"),
          )
        ],
      ),
    );
  }

  Widget buildCategories() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildCircleButtonWithTitle(MyFlutterApp.salmon, "Salmon"),
            buildCircleButtonWithTitle(MyFlutterApp.caviar, "Caviar"),
            buildCircleButtonWithTitle(MyFlutterApp.rice, "Rice"),
            buildCircleButtonWithTitle(MyFlutterApp.tentacles, "Tentacles"),
            buildCircleButtonWithTitle(MyFlutterApp.prawn, "Prawn"),
          ],
        ));
  }

  Widget buildCircleButtonWithTitle(IconData icon, title) {
    return Column(
      children: [
        CircleButtonWidgets(icon),
        const SizedBox(
          height: 12.0,
        ),
        TextStyler(title),
      ],
    );
  }
}
