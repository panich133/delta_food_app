import 'package:delta_food_app/Models/activity_model.dart';
import 'package:delta_food_app/Screens/foods_screen.dart';
import 'package:delta_food_app/Teching/shoping_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

FToast fToast;

List foodsDetail = [];

// ignore: must_be_immutable
class HomeFood extends StatefulWidget {
  DetailFoods detailFoods;

  HomeFood({this.detailFoods});

  @override
  _HomeFoodState createState() => _HomeFoodState();
}

class _HomeFoodState extends State<HomeFood> {
  int count = listDetail.length;

  // ignore: non_constant_identifier_names
  void Reload() {
    setState(() {
      count = listDetail.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 220,
                    child: ClipRRect(
                      child: Image(
                        image: AssetImage(widget.detailFoods.imageUrl),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 13, left: 15, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          splashColor: Colors.blue.shade200,
                          enableFeedback: false,
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Stack(
                            fit: StackFit.loose,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    top: 3, bottom: 3, right: 3),
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(
                                  CupertinoIcons.chevron_back,
                                  size: 25,
                                  color: Colors.blue.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShoppingCart(
                                          function: Reload,
                                        )));
                          },
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/shopping.png',
                                      fit: BoxFit.fill,
                                      width: 30,
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(7, 0, 7, 0),
                                margin: EdgeInsets.only(
                                    bottom: 20, left: 25, right: 0, top: 2.5),
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(100),
                                    left: Radius.circular(100),
                                  ),
                                ),
                                child: Text(
                                  '$count',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Mitr-Light',
                                      shadows: [
                                        BoxShadow(
                                            color: Colors.black,
                                            spreadRadius: 10)
                                      ],
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            widget.detailFoods.foodname,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Mitr-Light',
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, right: 10),
                              child: Text(
                                widget.detailFoods.price.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontFamily: 'Mitr-Light',
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: new EdgeInsets.only(left: 10),
                              child: Text(
                                "บาท",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade700,
                                  fontFamily: 'Mitr-Light',
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 1),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black45, fontSize: 15),
                          children: [
                            TextSpan(
                              text: widget.detailFoods.type,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: "Mitr-Light",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(thickness: 0.5, color: Colors.black45),
                    Column(
                      children: [
                        Container(
                          // margin: EdgeInsets.only(left: 80),
                          padding: EdgeInsets.only(left: 10),
                          // color: Colors.red,
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.white70,
                                radius: 25,
                                child: Icon(
                                  Icons.add_circle_outline_sharp,
                                  size: 30,
                                  color: Colors.green.shade700,
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Text(
                                  'เพิ่มFood',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Mitr-Light',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 10),
                                    child: Text(
                                      "15.50",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                        fontFamily: 'Mitr-Light',
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: new EdgeInsets.only(left: 20),
                                    child: Text(
                                      "บาท",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green.shade700,
                                        fontFamily: 'Mitr-Light',
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.only(left: 80),
                          padding: EdgeInsets.only(left: 10),
                          // color: Colors.red,
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.white70,
                                radius: 25,
                                child: Icon(
                                  Icons.add_circle_outline_sharp,
                                  size: 30,
                                  color: Colors.green.shade700,
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Text(
                                  'เพิ่มFood',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Mitr-Light',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 10),
                                    child: Text(
                                      "37.50",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                        fontFamily: 'Mitr-Light',
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: new EdgeInsets.only(left: 20),
                                    child: Text(
                                      "บาท",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green.shade700,
                                        fontFamily: 'Mitr-Light',
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.only(left: 80),
                          padding: EdgeInsets.only(left: 10),
                          // color: Colors.red,
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.white70,
                                radius: 25,
                                child: Icon(
                                  Icons.add_circle_outline_sharp,
                                  size: 30,
                                  color: Colors.green.shade700,
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Text(
                                  'เพิ่มFood',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Mitr-Light',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 10),
                                    child: Text(
                                      "18.50",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                        fontFamily: 'Mitr-Light',
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: new EdgeInsets.only(left: 20),
                                    child: Text(
                                      "บาท",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green.shade700,
                                        fontFamily: 'Mitr-Light',
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.only(left: 80),
                          padding: EdgeInsets.only(left: 10),
                          // color: Colors.red,
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.white70,
                                radius: 25,
                                child: Icon(
                                  Icons.add_circle_outline_sharp,
                                  size: 30,
                                  color: Colors.green.shade700,
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Text(
                                  'เพิ่มFood',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Mitr-Light',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 10),
                                    child: Text(
                                      "37.50",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                        fontFamily: 'Mitr-Light',
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: new EdgeInsets.only(left: 20),
                                    child: Text(
                                      "บาท",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green.shade700,
                                        fontFamily: 'Mitr-Light',
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.only(left: 80),
                          padding: EdgeInsets.only(left: 10),
                          // color: Colors.red,
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.white70,
                                radius: 25,
                                child: Icon(
                                  Icons.add_circle_outline_sharp,
                                  size: 30,
                                  color: Colors.green.shade700,
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Text(
                                  'เพิ่มFood',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Mitr-Light',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 10),
                                    child: Text(
                                      "55.50",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                        fontFamily: 'Mitr-Light',
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: new EdgeInsets.only(left: 20),
                                    child: Text(
                                      "บาท",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green.shade700,
                                        fontFamily: 'Mitr-Light',
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.only(left: 80),
                          padding: EdgeInsets.only(left: 10),
                          // color: Colors.red,
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.white70,
                                radius: 25,
                                child: Icon(
                                  Icons.add_circle_outline_sharp,
                                  size: 30,
                                  color: Colors.green.shade700,
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Text(
                                  'เพิ่มFood',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Mitr-Light',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 10),
                                    child: Text(
                                      "80.50",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                        fontFamily: 'Mitr-Light',
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: new EdgeInsets.only(left: 20),
                                    child: Text(
                                      "บาท",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green.shade700,
                                        fontFamily: 'Mitr-Light',
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            // blue[300],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 2.5, spreadRadius: 2.5),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              setState(() {
                listDetail.add(widget.detailFoods);
                count = listDetail.length;
              });
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return Container(
                      child: Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Colors.blue.shade200,
                      )),
                    );
                  });
              Future.delayed(Duration(seconds: 1), () {
                Navigator.pop(context);
              });
              // print('Click');
              // displayToastMessage("เพิ่มอาหารนี้แล้ว", context);
              displayToastMessage('เพิ่มอาหารนี้แล้ว',
                  TextStyle(backgroundColor: Colors.white60), context);
            },
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Text(
                        'จำนวน',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Mitr-Light',
                        ),
                      ),
                    ),
                    CustomPersonWidget(),
                  ],
                ),
                Container(
                  height: 50,
                  width: 240,
                  decoration: BoxDecoration(
                    color: Colors.blue[600],
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue[300],
                          blurRadius: 2.5,
                          spreadRadius: 2.5),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          'เพิ่มในตะกร้า',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightGreenAccent.shade400,
                              fontFamily: 'Mitr-Light'),
                        ),
                        SizedBox(width: 25),
                        Text(
                          widget.detailFoods.price.toString(),
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightGreenAccent.shade100,
                              fontFamily: 'Mitr-Light'),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'บาท',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightGreenAccent.shade400,
                              fontFamily: 'Mitr-Light'),
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
// String returnTotalAmount(DetailFoods foodsDetail) {
//   int totalAmount = 0;
//
//   for (int i = 0; i < listDetail.length; i++) {
//     setState(() {
//       totalAmount = listDetail.length;
//     });
//   }
//   return totalAmount.toStringAsFixed(0);
// }
}

class CustomPersonWidget extends StatefulWidget {
  @override
  _CustomPersonWidgetState createState() => _CustomPersonWidgetState();
}

class _CustomPersonWidgetState extends State<CustomPersonWidget> {
  int noOfPersons = 1;

  double _buttonWidth = 30;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: _buttonWidth,
            height: _buttonWidth,
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  if (noOfPersons > 1) {
                    noOfPersons--;
                  }
                });
              },
              child: Text(
                "-",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    fontFamily: 'Mitr-Light'),
              ),
            ),
          ),
          Text(
            noOfPersons.toString(),
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                fontFamily: 'Mitr-Light'),
          ),
          SizedBox(
            width: _buttonWidth,
            height: _buttonWidth,
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  noOfPersons++;
                });
              },
              child: Text(
                "+",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    fontFamily: 'Mitr-Light'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

displayToastMessage(String message, TextStyle style, BuildContext context) {
  Fluttertoast.showToast(
      msg: message,
      webShowClose: true,
      textColor: Colors.white,
      fontSize: 20,
      backgroundColor: Colors.blue.shade400,
      gravity: ToastGravity.TOP,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 0);
}
