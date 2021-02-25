// import 'package:delta_food_app/Screens/Widgets/food_screen.dart';
import 'package:delta_food_app/Models/activity_model.dart';
import 'package:delta_food_app/Screens/Widgets/slidable_widget.dart';
import 'package:delta_food_app/Screens/foods_screen.dart';
import 'package:delta_food_app/Teching/food_res.dart';
import 'package:delta_food_app/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List foodsDetail = [];
int chang = 0;

// ignore: must_be_immutable
class ShoppingCart extends StatefulWidget {
  final DetailFoods foods;
  final Function function;

  const ShoppingCart({Key key, this.function, this.foods}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List list;

  @override
  void initState() {
    list = listDetail;
    super.initState();
  }

  // ignore: non_constant_identifier_names
  void Reload() async {
    setState(() {
      list = listDetail;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(list.length);
    return SafeArea(
      child: Scaffold(
        body: BodyCart(
          function: widget.function,
          reload: Reload,
        ),
        bottomNavigationBar: BottomCart(),
      ),
    );
  }
}

// ignore: must_be_immutable
class BottomCart extends StatefulWidget {
  DetailFoods foods;
  List list;

  BottomCart({this.foods, this.list});

  @override
  _BottomCartState createState() => _BottomCartState();
}

class _BottomCartState extends State<BottomCart> {
  int count = 0;
  int listlength = listDetail.length;

  void setlist() {
    count = 0;
    listDetail.forEach((element) {
      DetailFoods foods = element;
      count += foods.price;

      // print(listDetail.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    setlist();
    FoodItemList();
    // print(listlength);
    return Container(
      margin: EdgeInsets.only(left: 35, bottom: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          totalPrice(),
          // CustomPersonWidget(),
          SizedBox(height: 5),
          InkWell(
              onTap: () {
                print('ชำระเงิน$count');
                listDetail = [];
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);

                displayToastMessage('ชำระเงินจำนวน$countเสร็จสิ้น',
                    TextStyle(backgroundColor: Colors.white60), context);
              },
              child: nextButtonBar()),
        ],
      ),
    );
  }

  Container totalPrice() {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.fromLTRB(20, 5, 30, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "ราคารวม :",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontFamily: 'Mitr-Light',
                color: Colors.green.shade900),
          ),
          Text(
            // {returnTotalAmount(foodItems)}
            '$count',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.green.shade500,
                fontFamily: 'Mitr-Light',
                fontSize: 25),
          ),
          Text(
            // {returnTotalAmount(foodItems)}
            " บาท.",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.green.shade900,
                fontFamily: 'Mitr-Light',
                fontSize: 23),
          ),
        ],
      ),
    );
  }

  Container nextButtonBar() {
    return Container(
      margin: EdgeInsets.only(
        left: 25,
        right: 55,
      ),
      padding: EdgeInsets.fromLTRB(25, 13.5, 30, 12.5),
      decoration: BoxDecoration(
        color: Colors.blue[600],
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
              color: Colors.blue[300], blurRadius: 2.5, spreadRadius: 2.5),
        ],
      ),
      child: Center(
        child: Text(
          "ชำระเงิน",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              fontFamily: 'Mitr-Light',
              color: Colors.white),
        ),
      ),
    );
  }
}

class BodyCart extends StatelessWidget {
  final Function function;
  final Function reload;

  const BodyCart({Key key, this.function, this.reload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 25, 0),
      child: Column(
        children: [
          CartBar(function: function),
          CartTitle(),
          DateTitle(),
          IconCart(),
          Expanded(
            child: FoodItemList(
              reload: reload,
            ),
          ),
          Divider(thickness: 0.6, indent: 20, endIndent: 10),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget CartTitle() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(top: 0, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "รายการรวมทั้งหมด",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Mitr-Light',
                  fontSize: 24,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget DateTitle() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Thu, 11th of Feb",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Mitr-Light',
                  fontSize: 24,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class FoodItemList extends StatefulWidget {
  final Function reload;

  const FoodItemList({Key key, this.reload}) : super(key: key);

  @override
  _FoodItemListState createState() => _FoodItemListState();
}

class _FoodItemListState extends State<FoodItemList> {
  Map item = {};
  List newlist = [];
  List<DetailFoods> list;

  // ignore: non_constant_identifier_names
  void Reload() {
    item = {};
    list = listDetail;
    list.forEach((element) {
      item['${element.id}'] =
      item.containsKey('${element.id}') ? item['${element.id}'] + 1 : 1;
    });
  }

  @override
  void initState() {
    list = listDetail;
    super.initState();
    list.forEach((element) {
      item['${element.id}'] =
          item.containsKey('${element.id}') ? item['${element.id}'] + 1 :  1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var values = item.values.toList();
    var keys = item.keys.toList();
    print(keys);

    return ListView.builder(
      itemCount: keys.length,
      itemBuilder: (context, index) {
        int J = list.indexWhere((element) => element.id == int.parse(keys[index]));
        // print(keys[index]);
        int i = detailfoods.indexWhere((element) => element.id == int.parse(keys[index]));
        print(keys[0]);
        // print(keys[index]);
        // print(values[index]);
        DetailFoods foods = detailfoods[i];
        return SlidableWidget(
            onDismissed: (SlidableAction action) =>
                dismissSlidableItem(context, J, action),
            child: ItemCart(
              foods: foods,count: values[index],
            ));
      },
    );
  }

  void dismissSlidableItem(
      BuildContext context, int index, SlidableAction action) {
    setState(() {
      // list.removeWhere((element) => element.)
      list.removeAt(index);
      Reload();
      widget.reload();
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
    switch (action) {
      case SlidableAction.delete:
        Utils.showSnackBar(context,
            'ลบอาหารแล้ว เหลืออีก${listDetail.length.toString()}รายการ');
        break;
      case SlidableAction.more:
        // TODO: Handle this case.
        break;
    }
  }
}

class IconCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: 6, left: 20, top: 7),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text(
              "+ เพิ่มอาหาร",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w800,
                fontFamily: 'Mitr-Light',
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemCart extends StatelessWidget {
  final int count;
  final DetailFoods foods;

  const ItemCart({Key key, this.foods, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemWidget(
          foods: foods,
          count: count,
        ),
      ],
    );
  }
}

class ItemWidget extends StatelessWidget {
  final int count;
  final DetailFoods foods;

  const ItemWidget({Key key, this.foods, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    height: 60,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38, offset: Offset(2.3, 2.6)),
                      ],
                      image: DecorationImage(
                        image: AssetImage(foods.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: foods.foodname,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Mitr-Light'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomPerson(count: count),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${foods.price * count}',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Mitr-Light'),
                      ),
                      TextSpan(
                        text: " บาท",
                        style: TextStyle(
                            color: Colors.green[800],
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Mitr-Light'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomPerson extends StatefulWidget {
  final int count;

  const CustomPerson({Key key, this.count}) : super(key: key);

  @override
  _CustomPersonState createState() => _CustomPersonState();
}

class _CustomPersonState extends State<CustomPerson> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white12, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '${widget.count}',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                fontFamily: 'Mitr-Light'),
          ),
        ],
      ),
    );
  }
}

class CartBar extends StatelessWidget {
  final Function function;

  const CartBar({Key key, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: InkWell(
            splashColor: Colors.blue.shade200,
            enableFeedback: false,
            onTap: () {
              function();
              Navigator.pop(context);
            },
            child: Stack(
              fit: StackFit.loose,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 3, bottom: 3, right: 3),
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
        ),
      ],
    );
  }
}
