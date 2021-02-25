import 'package:carousel_slider/carousel_slider.dart';
import 'package:delta_food_app/Models/activity_model.dart';
import 'package:delta_food_app/Models/baner_model.dart';
import 'package:delta_food_app/Screens/Widgets/appbarr.dart';
import 'package:delta_food_app/Screens/Widgets/circleIcons.dart';
import 'package:delta_food_app/Screens/Widgets/curvedNavigationBar.dart';
import 'package:delta_food_app/Screens/Widgets/listbody.dart';
import 'package:delta_food_app/Screens/foods_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class Restaurants extends StatefulWidget {

  // final BanerModel banner;
  //  Restaurants({this.banner});

  @override
  _RestaurantsState createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  final GlobalKey<ScaffoldState> _scaffold = new GlobalKey<ScaffoldState>();

  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffold,
        backgroundColor: Colors.blue[700],
        body: Container(
          // width: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              BodyRestaurant(banner: BanerModel(),
              ),
              Container(color: Colors.teal),
              Container(color: Colors.greenAccent),
              Container(color: Colors.lightGreen),

              // Home(),
              // ItemFoods(),
              // ResFoods(),
              // Test(),
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          items: [
            Icon(Icons.food_bank_outlined),
            Icon(Icons.apps),
            Icon(Icons.person),
            Icon(Icons.settings),
          ],
          color: Colors.blue[400],
          animationDuration: Duration(milliseconds: 450),
          backgroundColor: Colors.blue[700],
          buttonBackgroundColor: Colors.white,
          height: 50,
          index: _currentIndex,
          onTap: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class BodyRestaurant extends StatefulWidget {
  CarouselController carouselController = CarouselController();

  BanerModel banner;

  BodyRestaurant({@required this.banner});

  @override
  _BodyRestaurantState createState() => _BodyRestaurantState();
}

class _BodyRestaurantState extends State<BodyRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AAppBar(),
            Texts('ประเภทร้านอาหาร'),
            CircleIcon(),
            BannerBody(),
            Texted('ร้านอาหารใกล้คุณ'),
            Divider(thickness: 1.5, height: 10, endIndent: 80, indent: 80),
            ResBody(),
            TextColumn('ร้านอาหาร'),
            Divider(
              thickness: 1.5,
              height: 10,
              endIndent: 80,
              indent: 80,
            ),
            SizedBox(height: 10),
            ListBBody(),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Texts(String text) => Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15, bottom: 5),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Mitr-Light'),
              ),
            ),
          ],
        ),
      );

  // ignore: non_constant_identifier_names
  Widget Texted(String text) => Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15, bottom: 5),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Mitr-Light'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 5, right: 10),
              child: SizedBox(
                height: 25,
                width: 50,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green[500],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'เปิด',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Mitr-Light'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  // ignore: non_constant_identifier_names
  Widget TextColumn(String text) => Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 4, bottom: 5),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Mitr-Light'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 5, right: 10),
              child: SizedBox(
                height: 25,
                width: 50,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green[500],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'เปิด',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Mitr-Light'),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );

// ignore: non_constant_identifier_names
  Widget BannerBody() {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: 175,
      child: CarouselSlider.builder(
        carouselController: widget.carouselController,
        options: CarouselOptions(
          height: 150,
          enableInfiniteScroll: true,
          autoPlay: true,
          reverse: false,
          enlargeCenterPage: true,
          autoPlayAnimationDuration: Duration(seconds: 2),
          pauseAutoPlayOnTouch: true,
          autoPlayInterval: Duration(seconds: 4),
          // onPageChanged: (index, reason) {
          //   setState(
          //     () {},
          //   );
          // },
        ),
        itemCount: banerModels.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          BanerModel banerModel = banerModels[index];
          return Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 5, left: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      offset: Offset(2.5, 6.0),
                      blurRadius: 7.0,
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: () => print('Banner'),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Image(
                      image: AssetImage(banerModel.imageUrl),
                      width: MediaQuery.of(context).size.width - 90,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Tests() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        BanerModel banerModel = banerModels[index];
        return Row(
          children: [
            Container(
              padding: EdgeInsets.only(right: 5, left: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(2.5, 3.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () => print('Banner'),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: Image(
                    image: AssetImage(banerModel.imageUrl),
                    width: 300,
                    fit: BoxFit.fitWidth,
                    height: 150,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ignore: non_constant_identifier_names
  Widget ResBody() {
    // ร้านอาหารใกล้คุณ
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: detailRestaurants.length,
        itemBuilder: (BuildContext context, int index) {
          DetailRestaurant detailrestaurant = detailRestaurants[index];
          return Container(
            width: 170,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 10),
                Container(
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                topLeft: Radius.circular(8)),
                            child: Image(
                              height: 136.5,
                              width: 150.0,
                              image: AssetImage(detailrestaurant.imageUrl),
                              fit: BoxFit.cover,
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
      ),
    );
  }
}
