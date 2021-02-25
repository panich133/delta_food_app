// import 'package:delta_food_app/Models/activity_model.dart';
// // import 'package:delta_food_app/Screens/Widgets/food_screen.dart';
import 'package:flutter/material.dart';

class ItemFoods extends StatefulWidget {
  // final DetailFoods foods;
  // const ItemFoods({Key key, this.foods}) : super(key: key);

  @override
  _ItemContainerState createState() => _ItemContainerState();
}

class _ItemContainerState extends State<ItemFoods> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => null
              // FoodScreen(itemfoods: widget.itemfoods),
              ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/bgdelltafood.jpg',
              height: 120,
            ),
            Text(
              'widget.foods.foodname',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "\$" + 'widget.foods.price'.toString(),
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.orangeAccent,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    color: Colors.white12,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    iconSize: 15,
                    icon: Icon(Icons.check),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
