import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:delta_food_app/Models/food_item.dart';
import 'package:delta_food_app/Screens/cart.dart';
import 'package:delta_food_app/bloc/cartlistBloc.dart';
import 'package:delta_food_app/const/themeColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              FirstHalf(),
              SizedBox(height: 45),
              for (var foodItem in fooditemList.foodItems)
                Builder(
                  builder: (context) {
                    return ItemContainer(foodItem: foodItem);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemContainer extends StatelessWidget {
  ItemContainer({
    @required this.foodItem,
  });

  final FoodItem foodItem;
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  addToCart(FoodItem foodItem) {
    bloc.addToList(foodItem);
  }

  removeFromList(FoodItem foodItem) {
    bloc.removeFromList(foodItem);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addToCart(foodItem);
        final snackBar = SnackBar(
          content: Text(
            'เพิ่ม > ${foodItem.quantity} รายการไปที่ช็อป',
            style: TextStyle(color: Colors.black87, fontSize: 18),
          ),
          duration: Duration(milliseconds: 950),
          backgroundColor: Colors.blue.shade600,
        );

        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Items(
        hotel: foodItem.hotel,
        itemName: foodItem.title,
        itemPrice: foodItem.price,
        imgUrl: foodItem.imgUrl,
        leftAligned: (foodItem.id % 2) == 0 ? true : false,
      ),
    );
  }
}

class FirstHalf extends StatelessWidget {
  const FirstHalf({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          //you could also use the spacer widget to give uneven distances, i just decided to go with a sizebox
          // title(context),
          // SizedBox(height: 10),
          // Divider(thickness: 0.4,color: Colors.black45,indent: 40,),
          // searchBar(),
          // categories(),
        ],
      ),
    );
  }
}
//
// Widget categories() {
//   return Container(
//     height: 185,
//     child: ListView(
//       scrollDirection: Axis.horizontal,
//       children: <Widget>[
//         CategoryListItem(
//           categoryIcon: Icons.bug_report,
//           categoryName: "Burgers",
//           availability: 12,
//           selected: true,
//         ),
//         CategoryListItem(
//           categoryIcon: Icons.bug_report,
//           categoryName: "Pizza",
//           availability: 12,
//           selected: false,
//         ),
//         CategoryListItem(
//           categoryIcon: Icons.bug_report,
//           categoryName: "Rolls",
//           availability: 12,
//           selected: false,
//         ),
//         CategoryListItem(
//           categoryIcon: Icons.bug_report,
//           categoryName: "Burgers",
//           availability: 12,
//           selected: false,
//         ),
//         CategoryListItem(
//           categoryIcon: Icons.bug_report,
//           categoryName: "Burgers",
//           availability: 12,
//           selected: false,
//         ),
//       ],
//     ),
//   );
// }

class Items extends StatelessWidget {
  Items({
    @required this.leftAligned,
    @required this.imgUrl,
    @required this.itemName,
    @required this.itemPrice,
    @required this.hotel,
  });

  final bool leftAligned;
  final String imgUrl;
  final String itemName;
  final double itemPrice;
  final String hotel;

  @override
  Widget build(BuildContext context) {
    // double containerPadding = 45;
    // double containerBorderRadius = 10;

    return Column(
      children: <Widget>[
        Container(
          // color: Colors.lightBlue,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 2),
          // padding: EdgeInsets.only(
          //   left: leftAligned ? 0 : containerPadding,
          //   right: leftAligned ? containerPadding : 0,
          // ),
          child: Column(
            children: <Widget>[
              Container(
                // width: double.infinity,
                height: 150,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                // padding: EdgeInsets.only(
                //   left: leftAligned ? 20 : 0,
                //   right: leftAligned ? 0 : 20,
                // ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(itemName,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              )),
                        ),
                        Text("$itemPrice B.",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            )),
                      ],
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                            style:
                                TextStyle(color: Colors.black45, fontSize: 15),
                            children: [
                              TextSpan(
                                  text: hotel,
                                  style: TextStyle(fontWeight: FontWeight.w700))
                            ]),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    Key key,
    @required this.categoryIcon,
    @required this.categoryName,
    @required this.availability,
    @required this.selected,
  }) : super(key: key);

  final IconData categoryIcon;
  final String categoryName;
  final int availability;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: selected ? Themes.color : Colors.white,
        border: Border.all(
            color: selected ? Colors.transparent : Colors.grey[200],
            width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[100],
            blurRadius: 15,
            offset: Offset(15, 0),
            spreadRadius: 5,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    color: selected ? Colors.transparent : Colors.grey[200],
                    width: 1.5)),
            child: Icon(
              categoryIcon,
              color: Colors.black,
              size: 30,
            ),
          ),
          SizedBox(height: 10),
          Text(
            categoryName,
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.black, fontSize: 15),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 6, 0, 10),
            width: 1.5,
            height: 15,
            color: Colors.black26,
          ),
          Text(
            availability.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}

Widget searchBar() {
  return Row(
    children: <Widget>[
      SizedBox(width: 20),
      Icon(
        Icons.search,
        color: Colors.blueAccent,
        size: 20,
      ),
      SizedBox(width: 2),
      Expanded(
        child: TextField(
          decoration: InputDecoration(
            hintText: " Search....",
            // contentPadding: EdgeInsets.symmetric(vertical: 0),
            hintStyle: TextStyle(
              color: Colors.black26,
            ),
            // border: UnderlineInputBorder(
            //   borderSide: BorderSide(color: Colors.lightBlue),
            // ),
          ),
        ),
      ),
    ],
  );
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            child: ClipRRect(
              child: Image(
                image: AssetImage('assets/images/bgdelltafood.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Icon(
                    CupertinoIcons.back,
                    size: 35,
                    color: Colors.blue.shade400,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: StreamBuilder(
                    stream: bloc.listStream,
                    builder: (context, snapshot) {
                      List<FoodItem> foodItems = snapshot.data;
                      int length = foodItems != null ? foodItems.length : 0;

                      return buildGestureDetector(length, context, foodItems);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildGestureDetector(
      int length, BuildContext context, List<FoodItem> foodItems) {
    return GestureDetector(
      onTap: () {
        if (length > 0) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else {
          return;
        }
      },
      child: Container(
        margin: EdgeInsets.only(right: 18, top: 5),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              FontAwesomeIcons.shoppingCart,
              color: Colors.cyanAccent.shade200,
              size: 30,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 2, 5, 3.5),
              margin: EdgeInsets.only(bottom: 20, left: 25),
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                length.toString(),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue.shade800),
              ),
            ),
          ],
        ),
        //
        // Text(length.toString()),
        //
      ),
    );
  }
}
