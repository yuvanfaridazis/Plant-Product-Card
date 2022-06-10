import 'package:flutter/material.dart';
import 'package:plant_card/theme.dart';
import 'package:intl/intl.dart';
import 'package:supercharged/supercharged.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool onClicked = false;

  @override
  Widget build(BuildContext context) {

    double productWidth =
    ((MediaQuery.of(context).size.width / 2) - 10  - 15);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: productCard(productWidth, "assets/plant.png", "Exclusive Australian Snake Plant", 75000, 100000, 25, 4.5, 1458, "Mind-Well"),
      ),
    );
  }

  Widget productCard(double width, String image, String name, int price, int price_discount, int percentage, double rating, int sold, String label){
    return Stack(
        children: [
          Container(
            width: width,
            height: 310,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: Offset(0, 0),
                  )
                ]
            ),
            child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        child: Container(
                          alignment: Alignment.center,
                          width: 185,
                          height: 180,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/plant.png"), fit: BoxFit.cover
                              )),
                        )
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${name}" ?? "",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: blackFontStyle.copyWith(
                                fontSize: 11, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: (name.length <= 21) ? 17 : 2 ,
                          ),
                          Text(
                            NumberFormat.currency(
                              locale: 'id_ID',
                              decimalDigits: 0,
                              symbol: 'Rp',
                            ).format(price),
                            style: blackFontStyle.copyWith(
                                fontSize: 13, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal:2, vertical:0.5),
                                  color: Colors.red.shade100,
                                  child: Text(
                                    percentage.toString() + "%",
                                    style: blackFontStyle.copyWith(color: Colors.red.shade300,
                                        fontSize: 8, fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  NumberFormat.currency(
                                    locale: 'id_ID',
                                    decimalDigits: 0,
                                    symbol: 'Rp',
                                  ).format(price_discount),
                                  style: blackFontStyle.copyWith(color: Colors.grey.shade400,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 10, fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.left,
                                ),
                              ]
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Icon(
                                          Icons.star, color: Colors.yellow.shade700, size: 13,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        "${rating}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: blackFontStyle.copyWith(color: Colors.grey,
                                            fontSize: 10, fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "|",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: blackFontStyle.copyWith(color: Colors.grey,
                                      fontSize: 10, fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  child: Text(
                                    "${sold} Sold",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: blackFontStyle.copyWith(color: Colors.grey,
                                        fontSize: 10, fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                        ],
                      ),
                    )
                  ],
                )
            ),
          ),
          Positioned(
            top: 162.5,
            right: 15,
            child: InkWell(
                onTap: () async {

                  setState(() {
                    onClicked = true;
                  });

                  Future.delayed(Duration(milliseconds: 300)).whenComplete(() {
                    setState(() {
                      onClicked = false;
                    });
                  });

                },
                child: Container(
                    width: 30,
                    height: 30,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (onClicked == true) ? "E6B5B6".toColor() : Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 2,
                          offset: Offset(0, 0),
                        )
                      ],
                    ),
                    child: Icon(Icons.favorite, size: 16, color: (onClicked == true) ? Colors.white : "E6B5B6".toColor())
                )
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 75,
                height: 20,
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 2, right: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(0)),
                  color: "6BCD50".toColor(),
                ),
                child: Text(
                  "${label}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: blackFontStyle.copyWith(color: Colors.white,
                      fontSize: 7, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              )
          ),
        ]
    );
  }
}
