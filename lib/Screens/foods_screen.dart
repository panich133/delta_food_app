import 'package:delta_food_app/Models/activity_model.dart';
import 'package:delta_food_app/Teching/food_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';

List <DetailFoods>listDetail = [];

// ignore: must_be_immutable
class FoodsScreen extends StatefulWidget {
  final DetailRestaurant foods;

  FoodsScreen({@required this.foods});

  @override
  _FoodsScreenState createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      child: ClipRRect(
                        child: Image(
                          image: AssetImage(widget.foods.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(10),
                        ),
                      ),
                    ),
                    Positioned(
                      height: 200,
                      top: 120,
                      child: Container(
                        // height: MediaQuery.of(context).size.height,
                        width: 360,
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.elliptical(500, 420),
                              bottomRight: Radius.circular(100)),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.foods.resname,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                    fontFamily: 'Mitr-Light'),
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.angleDoubleRight,
                                    size: 15.0,
                                    color: Colors.white70,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    widget.foods.address,
                                    style: TextStyle(
                                        letterSpacing: 1.2,
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Mitr-Light'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 15,
                      bottom: 15,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 29, right: 0),
                          margin: EdgeInsets.only(
                            bottom: 95,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Stack(
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
                              GestureDetector(
                                onTap: () {
                                  print('ข้อมูลร้าน');
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      padding: EdgeInsets.all(0),
                                      decoration: BoxDecoration(
                                        color: Colors.white60,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Icon(
                                            Icons.info_outline_rounded,
                                            size: 30,
                                            color: Colors.blue.shade800,
                                            semanticLabel: 'ข้อมูลร้าน',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                TabBarType(),
                // BodyView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SelectType {
  final String text;
  final IconData icon;

  const SelectType({this.text, this.icon});
}

const List<SelectType> selectType = const <SelectType>[
  const SelectType(text: 'All', icon: Icons.clear_all_outlined),
  const SelectType(text: 'Type', icon: Icons.food_bank_outlined),
  const SelectType(text: 'Type', icon: Icons.food_bank_outlined),
  const SelectType(text: 'Type', icon: Icons.food_bank_outlined),
];

class TabBarType extends StatefulWidget {
  const TabBarType({Key key}) : super(key: key);

  @override
  _TabBarTypeState createState() => _TabBarTypeState();
}

class _TabBarTypeState extends State<TabBarType>
    with SingleTickerProviderStateMixin {
  int tabIndex = 0;
  TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController =
        TabController(length: 4, vsync: this, initialIndex: tabIndex);
  }

  // @override
  // void dispose() {
  //   tabController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          labelStyle: TextStyle(
            fontWeight: FontWeight.w700,
          ),
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.blue[700],
          unselectedLabelColor: Color(0xff5f6368),
          indicator: MD2Indicator(
            indicatorHeight: 2,
            indicatorColor: Colors.lightBlue,
            indicatorSize: MD2IndicatorSize.full,
          ),
          isScrollable: true,
          controller: tabController,
          onTap: (int index) {
            setState(() {
              tabIndex = index;
              tabController.animateTo(index);
            });
          },
          tabs: <Tab>[
            Tab(
              child: Row(
                children: <Widget>[
                  Icon(Icons.clear_all_outlined),
                  Container(
                    margin: EdgeInsets.only(left: 4),
                    child: Text('All'.toUpperCase()),
                  ),
                ],
              ),
            ),
            Tab(
              child: Row(
                children: <Widget>[
                  Icon(Icons.clear_all_outlined),
                  Container(
                    margin: EdgeInsets.only(left: 4),
                    child: Text('A'.toUpperCase()),
                  ),
                ],
              ),
            ),
            Tab(
              child: Row(
                children: <Widget>[
                  Icon(Icons.clear_all_outlined),
                  Container(
                    margin: EdgeInsets.only(left: 4),
                    child: Text('B'.toUpperCase()),
                  ),
                ],
              ),
            ),
            Tab(
              child: Row(
                children: <Widget>[
                  Icon(Icons.clear_all_outlined),
                  Container(
                    margin: EdgeInsets.only(left: 4),
                    child: Text('C'.toUpperCase()),
                  ),
                ],
              ),
            ),
          ],
        ),
        IndexedStack(
          index: tabIndex,
          sizing: StackFit.loose,
          children: [
            AllType(),
            AType(),
            BType(),
            CType(),
          ],
        ),
      ],
    );
  }
}

class AllType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _buildRatingStars(int rating) {
      String stars = '';
      for (int i = 0; i < rating; i++) {
        stars += '🌟 ';
      }
      stars.trim();
      return Text(stars);
    }

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 10, bottom: 15),
      shrinkWrap: true,
      itemCount: detailfoods.length,
      itemBuilder: (BuildContext context, int index) {
        DetailFoods foods = detailfoods[index];
        return Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeFood(detailFoods: foods),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(40, 5.0, 20.0, 5.0),
                height: 140.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(3.5, 1.2),
                      blurRadius: 4.5,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(100.0, 10.0, 20.0, 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 120,
                                child: Text(
                                  foods.foodname,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Mitr-Light'),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              Text(
                                foods.type,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: 'Mitr-Light'),
                              ),
                              _buildRatingStars(foods.rating),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '${foods.price}',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green,
                                    fontFamily: 'Mitr-Light'),
                              ),
                              Text(
                                'บาท',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green.shade700,
                                    fontSize: 15,
                                    fontFamily: 'Mitr-Light'),
                              ),
                              SizedBox(height: 5),
                              Icon(
                                Icons.add_circle_outline_sharp,
                                size: 35,
                                color: Colors.green.shade700,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20.0,
              bottom: 20,
              top: 20,
              child: ClipRRect(
                // clipper: Clip,
                borderRadius: BorderRadius.circular(8.0),
                child: Image(
                  width: 100,
                  image: AssetImage(foods.imageUrl,),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// ignore: must_be_immutable
class AType extends StatelessWidget {
  List a = [];
  @override
  Widget build(BuildContext context) {
    detailfoods.forEach((element) {
      print(element);
      if(element.type == 'A'){
      a.add(element);
      print(element.id);
      }});

    _buildRatingStars(int rating) {
      String stars = '';
      for (int i = 0; i < rating; i++) {
        stars += '🌟 ';
      }
      stars.trim();
      return Text(stars);
    }
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 10, bottom: 15),
      itemCount: a.length,
      itemBuilder: (BuildContext context, int index) {
        DetailFoods foods = a[index];

        return Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeFood(
                      detailFoods: foods,
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(40, 5.0, 20.0, 5.0),
                height: 140.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(3.5, 1.2),
                      blurRadius: 4.5,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(100.0, 10.0, 20.0, 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 120,
                                child: Text(
                                  foods.foodname,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Mitr-Light'),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              Text(
                                foods.type,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: 'Mitr-Light'),
                              ),
                              _buildRatingStars(foods.rating),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '${foods.price}',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green,
                                    fontFamily: 'Mitr-Light'),
                              ),
                              Text(
                                'บาท',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green.shade700,
                                    fontSize: 15,
                                    fontFamily: 'Mitr-Light'),
                              ),
                              SizedBox(height: 5),
                              Icon(
                                Icons.add_circle_outline_sharp,
                                size: 35,
                                color: Colors.green.shade700,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20.0,
              bottom: 20,
              top: 20,
              child: ClipRRect(
                // clipper: Clip,
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  foods.imageUrl,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// ignore: must_be_immutable
class BType extends StatelessWidget {
  List b = [];

  @override
  Widget build(BuildContext context) {
    detailfoods.forEach((element) {
      print(element);
      if(element.type == 'B'){
        b.add(element);
        print(element.id);
      }});

    _buildRatingStars(int rating) {
      String stars = '';
      for (int i = 0; i < rating; i++) {
        stars += '🌟 ';
      }
      stars.trim();
      return Text(stars);
    }

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 10, bottom: 15),
      itemCount: b.length,
      itemBuilder: (BuildContext context, int index) {
        DetailFoods foods = b[index];
        return Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeFood(
                              detailFoods: foods,
                            )));
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(40, 5.0, 20.0, 5.0),
                height: 140.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(3.5, 1.2),
                      blurRadius: 4.5,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(100.0, 10.0, 20.0, 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 120,
                                child: Text(
                                  foods.foodname,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Mitr-Light'),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              Text(
                                foods.type,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: 'Mitr-Light'),
                              ),
                              _buildRatingStars(foods.rating),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '${foods.price}',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green,
                                    fontFamily: 'Mitr-Light'),
                              ),
                              Text(
                                'บาท',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green.shade700,
                                    fontSize: 15,
                                    fontFamily: 'Mitr-Light'),
                              ),
                              SizedBox(height: 5),
                              Icon(
                                Icons.add_circle_outline_sharp,
                                size: 35,
                                color: Colors.green.shade700,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20.0,
              bottom: 20,
              top: 20,
              child: ClipRRect(
                // clipper: Clip,
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(foods.imageUrl,
                    fit: BoxFit.cover, width: 100),
              ),
            ),
          ],
        );
      },
    );
  }
}

// ignore: must_be_immutable
class CType extends StatelessWidget {
  List c = [];

  @override
  Widget build(BuildContext context) {
    detailfoods.forEach((element) {
      if(element.type == 'C'){
        c.add(element);
      }
    });
    _buildRatingStars(int rating) {
      String stars = '';
      for (int i = 0; i < rating; i++) {
        stars += '🌟 ';
      }
      stars.trim();
      return Text(stars);
    }

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 10, bottom: 15),
      shrinkWrap: true,
      itemCount: c.length,
      itemBuilder: (BuildContext context, int index) {
        DetailFoods foods = c[index];
        return Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeFood(
                              detailFoods: foods,
                            )));
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(40, 5.0, 20.0, 5.0),
                height: 140.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(3.5, 1.2),
                      blurRadius: 4.5,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(100.0, 10.0, 20.0, 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 120,
                                child: Text(
                                  foods.foodname,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Mitr-Light'),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              Text(
                                foods.type,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: 'Mitr-Light'),
                              ),
                              _buildRatingStars(foods.rating),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '${foods.price}',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green,
                                    fontFamily: 'Mitr-Light'),
                              ),
                              Text(
                                'บาท',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green.shade700,
                                    fontSize: 15,
                                    fontFamily: 'Mitr-Light'),
                              ),
                              SizedBox(height: 5),
                              Icon(
                                Icons.add_circle_outline_sharp,
                                size: 35,
                                color: Colors.green.shade700,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20.0,
              bottom: 20,
              top: 20,
              child: ClipRRect(
                // clipper: Clip,
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(foods.imageUrl,
                    fit: BoxFit.cover, width: 100),
              ),
            ),
          ],
        );
      },
    );
  }
}
