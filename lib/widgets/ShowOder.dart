import 'package:flutter/material.dart';
import '../Flutter_app_icons.dart';
import '../app_themes.dart';
import '../models/sushiModel.dart';
import 'circle_bouton_widgets.dart';

class OrderView extends StatefulWidget {
  OrderView({required this.selected});

  final SushiModel selected;

  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  late Offset _location=const Offset(0, 0);
  late int priceSelectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgColor,
      body: Column(
        children: [
          const SizedBox(height: 27),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 12),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleButtonWidgets(Icons.arrow_back_ios)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, right: 12),
                child: CircleButtonWidgets(
                  Icons.favorite,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            widget.selected.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 12),
          Text(widget.selected.desc),
          const SizedBox(height: 12),
          SizedBox(
            width: MediaQuery.of(context).size.width * .6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleButtonWithTitle(
                  icon: MyFlutterApp.salmon,
                  title: "Salmon",
                ),
                CircleButtonWithTitle(
                  icon: MyFlutterApp.caviar,
                  title: "Caviar",
                ),
                CircleButtonWithTitle(
                  icon: MyFlutterApp.rice,
                  title: "Rice",
                ),
              ],
            ),
          ),
          Image.asset(
            widget.selected.image,
            height: 200,
          ),
          const SizedBox(height: 24),
          const Text("Choose the quality:"),
          const SizedBox(height: 12),
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DrawUnit(
                        selected: priceSelectedIndex == 0,
                        callBack: (offset) {
                          setState(() {
                            _location = offset;
                            priceSelectedIndex = 0;
                          });
                        },
                        child:  const Text("6 units"),
                      ),
                      const SizedBox(width: 24),
                      DrawUnit(
                        selected: priceSelectedIndex == 1,
                        callBack: (offset) {
                          setState(() {
                            _location = offset;
                            priceSelectedIndex = 1;
                          });
                        },
                        child: const Text("12 units"),
                      ),
                      const SizedBox(width: 24),
                      DrawUnit(
                        selected: priceSelectedIndex == 2,
                        callBack: (offset) {
                          setState(() {
                            _location = offset;
                            priceSelectedIndex = 2;
                          });
                        },
                        child: const Text("24 units"),
                      ),
                      const SizedBox(height: 20.0,)
                    ],
                    
                  ),
                ),
                // ignore: unnecessary_null_comparison
                if (_location != null)
                 buildPrice(),
                // ignore: unnecessary_null_comparison
                if (_location != null)
                  AnimatedPositioned(
                    left: _location.dx,
                    top: _location.dy,
                    duration: const Duration(milliseconds: 250),
                    child: const Icon(
                      MyFlutterApp.sort_up,
                      color: Colors.white,
                      size: 30,
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPrice() {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      child: Padding(
        padding: EdgeInsets.only(
          top: _location.dy + 15, // 15 = iconsize /2
          left: 12,
          right: 12,
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text.rich(
                      TextSpan(text: "\$", children: [
                        TextSpan(
                          text: "6.00",
                          style: TextStyle(fontSize: 24),
                        ),
                      ]),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.darkColor,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text("Total Price"),
                  ],
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(AppTheme.darkColor),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ))),
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          "Place Order",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(width: 24),
                        Icon(
                          MyFlutterApp.purchase_order,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircleButtonWithTitle extends StatelessWidget {
   CircleButtonWithTitle({Key? key, required this.icon, required this.title}) : super(key: key);

  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleButtonWidgets(
        icon,
        ),
        const SizedBox(height: 12),
        Text(title),
      ],
    );
    ;
  }
}

typedef TargetCallBack(Offset offset);

class DrawUnit extends StatelessWidget {
  DrawUnit(
      {required this.child, required this.callBack, this.selected = false});

  final Widget child;
  final TargetCallBack callBack;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final OverlayState? overlayState = Overlay.of(context);
        final RenderBox box = context.findRenderObject() as RenderBox;
        final Offset target = box.localToGlobal(
          box.size.center(Offset.zero),
          ancestor: overlayState?.context.findRenderObject(),
        );
        callBack(
          Offset(target.dx - 15, box.size.height),
        );
      },
      child: child,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
            selected ? AppTheme.darkColor : Colors.white),
        foregroundColor: MaterialStateProperty.all<Color>(
            !selected ? AppTheme.darkColor : Colors.white),
      ),
    );
  }
}
