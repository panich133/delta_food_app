import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:delta_food_app/Screens/home_restaurants.dart';
import 'package:delta_food_app/Teching/shoping_cart.dart';
import 'package:delta_food_app/bloc/cartlistBloc.dart';
import 'package:delta_food_app/bloc/listTileColorBloc.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final _route = <String, WidgetBuilder>{
    '/shopping_cart' : (BuildContext context) => ShoppingCart(),
    // '/foods_screen' : (BuildContext context) => FoodsScreen(foods: ,),
  };

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => CartListBloc()),
        Bloc((i) => ColorBloc()),
      ],
      child: MaterialApp(
        routes: _route,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blue[600]),
        home:
        Restaurants(),
        //   Test(),
      ),
    );
  }
}

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// // MyApp is a StatefulWidget. This allows updating the state of the
// // widget when an item is removed.
// class MyApp extends StatefulWidget {
//   MyApp({Key key}) : super(key: key);
//
//   @override
//   MyAppState createState() {
//     return MyAppState();
//   }
// }
//
// class MyAppState extends State<MyApp> {
//   final items = List<String>.generate(100, (i) => "Item ${i + 1}");
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(),
//         body: ListView.builder(
//           itemCount: items.length,
//           itemBuilder: (context, index) {
//             final item = items[index];
//
//             return Dismissible(
//               // Each Dismissible must contain a Key. Keys allow Flutter to
//               // uniquely identify widgets.
//               key: Key(item),
//               // Provide a function that tells the app
//               // what to do after an item has been swiped away.
//               onDismissed: (direction) {
//                 // Remove the item from the data source.
//                 setState(() {
//                   items.removeAt(index);
//                 });
//
//                 // Then show a snackbar.
//                 Scaffold.of(context)
//                     .showSnackBar(SnackBar(content: Text("$item dismissed")));
//               },
//               // Show a red background as the item is swiped away.
//               background: Container(
//                 color: Colors.red,
//                 child: Icon(Icons.cancel_outlined),
//               ),
//               resizeDuration: Duration(seconds: 2),
//               direction: DismissDirection.endToStart,
//               child: ListTile(title: Text('$item')),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
