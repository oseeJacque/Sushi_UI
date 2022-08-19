import 'package:flutter/material.dart';
import 'package:sushi_restaurant_ui/app_themes.dart';
import 'package:sushi_restaurant_ui/models/TextStyer.dart';
import 'package:sushi_restaurant_ui/models/sushiModel.dart';
import 'package:sushi_restaurant_ui/widgets/ShowOder.dart';

class HomeTopSushiView extends StatelessWidget {
  final List<SushiModel> list = SushiModel.list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        physics:  ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          bool flag = index % 2 == 0;
          // ignore: sized_box_for_whitespace
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                OrderView(selected: list[index])
              ));
            },
            child: Container(
                width: 200,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  color: flag ? AppTheme.darkColor : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(list[index].image),
                        const Expanded(child: SizedBox.shrink()),
                        TextStyler(
                          list[index].title,
                          fontWeight: FontWeight.bold,
                          color: !flag ? AppTheme.darkColor : Colors.white,
                        ),
                        const SizedBox(height: 12.0,),
                        TextStyler(list[index].desc,color: !flag ? AppTheme.darkColor : Colors.white,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(text: "\$", children: [
                                TextSpan(
                                    text: list[index].price,
                                    style: const TextStyle(fontSize: 24.0))
                              ]),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      !flag ? AppTheme.darkColor : Colors.white),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              width: 30.0,
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      !flag
                                          ? AppTheme.darkColor
                                          : Colors.white.withAlpha(100),
                                    ),
                                    shape:
                                        MaterialStateProperty.all<OutlinedBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)))),
                                child: TextStyler("Order",color: Colors.white,fontWeight:FontWeight.bold,),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          );
        });
  }
}
