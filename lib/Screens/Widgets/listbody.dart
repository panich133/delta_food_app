import 'package:delta_food_app/Models/activity_model.dart';
import 'file:///C:/Users/ACER/AndroidStudioProjects/delta_food_app8/lib/Screens/foods_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListBBody extends StatelessWidget {
// รายการร้านอาหาร
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: detailRestaurants.length,
        itemBuilder: (BuildContext context, int index) {
          final DetailRestaurant detailrestaurant = detailRestaurants[index];
          return Container(
            color: Colors.white70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 8),
                Container(
                  width: 180, // ขนาดกว้างง!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(1.0, 0.5),
                        blurRadius: 8.0,
                      ),
                    ],
                  ),
                  child: Container(
                    height: 190,
                    child: Stack(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FoodsScreen(
                                  foods: detailrestaurant,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            // height: 30,
                            margin: EdgeInsets.only(bottom: 55),
                            width: MediaQuery.of(context).size.width - 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              color: Colors.red,
                              image: DecorationImage(
                                image: AssetImage(detailrestaurant.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 8.8,
                          left: 8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                detailrestaurant.resname,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                    fontFamily: 'Mitr-Light'),
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.table,
                                    size: 10.0,
                                    color: Colors.blueGrey,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    detailrestaurant.detail,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 13,
                                        fontFamily: 'Mitr-Light'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250, mainAxisSpacing: 20),
      ),
    );
  }
}
