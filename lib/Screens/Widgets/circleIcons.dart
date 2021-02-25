import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class CircleIcon extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      key: _key,
      children: <Widget>[
        Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: 75,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 5, left: 1, right: 1, bottom: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.drumstickBite,
                        size: 30.0,
                        color: Colors.grey.shade800,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'อาหาร',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Mitr-SemiBold',
                            color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.pepperHot,
                        size: 30.0,
                        color: Colors.grey.shade800,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'อาหาร',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Mitr-SemiBold',
                            color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.appleAlt,
                        size: 30.0,
                        color: Colors.grey.shade800,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'อาหาร',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Mitr-SemiBold',
                            color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.feather,
                        size: 30.0,
                        color: Colors.grey.shade800,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'อาหาร',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Mitr-SemiBold',
                            color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            Show_Hide(),
          ],
        ),
      ],
    );
  }
}

// ignore: camel_case_types
class Show_Hide extends StatefulWidget {
  @override
  _Show_HideState createState() => _Show_HideState();
}

// ignore: camel_case_types
class _Show_HideState extends State<Show_Hide> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Icon(
                    FontAwesomeIcons.cuttlefish,
                    size: 30.0,
                    color: Colors.grey.shade800,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'อาหาร',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Mitr-SemiBold',
                        color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Icon(
                    FontAwesomeIcons.glassCheers,
                    size: 30.0,
                    color: Colors.grey.shade800,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'อาหาร',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Mitr-SemiBold',
                        color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Icon(
                    FontAwesomeIcons.coffee,
                    size: 30.0,
                    color: Colors.grey.shade800,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'อาหาร',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Mitr-SemiBold',
                        color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
            Container(
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(50)),
              child: IconButton(padding: EdgeInsets.only(bottom: 20),
                icon: Icon(Icons.more_horiz,size: 25,color: Colors.black54,),
                onPressed: () {
                  setState(
                    () {
                      _visible = !_visible;
                    },
                  );
                },
              ),
            ),
          ],
        ),
        // Container(
        //   width: MediaQuery.of(context).size.width,
        //   height: 46,
        //   decoration: BoxDecoration(
        //    color: Colors.grey.shade50
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Container(
        //         // width: MediaQuery.of(context).size.width,
        //         decoration: BoxDecoration(
        //             color: Colors.white,
        //             borderRadius: BorderRadius.circular(10)),
        //         child: IconButton(
        //           icon: Icon(Icons.unfold_more),
        //           onPressed: () {
        //             setState(
        //                   () {
        //                 _visible = !_visible;
        //               },
        //             );
        //           },
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Visibility(
              visible: _visible,
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 80,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                // ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 1, right: 1, bottom: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            Icon(
                              FontAwesomeIcons.drumstickBite,
                              size: 30.0,
                              color: Colors.grey.shade800,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'อาหาร',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Mitr-SemiBold',
                                  color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            Icon(
                              FontAwesomeIcons.pepperHot,
                              size: 30.0,
                              color: Colors.grey.shade800,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'อาหาร',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Mitr-SemiBold',
                                  color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            Icon(
                              FontAwesomeIcons.appleAlt,
                              size: 30.0,
                              color: Colors.grey.shade800,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'อาหาร',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Mitr-SemiBold',
                                  color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            Icon(
                              FontAwesomeIcons.feather,
                              size: 30.0,
                              color: Colors.grey.shade800,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'อาหาร',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Mitr-SemiBold',
                                  color: Colors.grey.shade700),
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
        SizedBox(height: 5),
        Divider(thickness: 1.5, height: 20, endIndent: 40, indent: 40),
      ],
    );
  }
}
