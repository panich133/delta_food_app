import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              width: MediaQuery.of(context).size.width,
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: 180,
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.deepOrange,
                          maxRadius: 40,
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 70),
                          width: 80,
                          height: 23,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade500,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.edit,
                                  size: 10,
                                ),
                                Text(
                                  'แก้ไข',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10, top: 10),
                        child: Text(
                          'คะแนน',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            child: Icon(Icons.star_rate_outlined),
                          ),
                          Text(
                            '0',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 70,
                        height: 21,
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Text(
                                'คะแนน',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 250,
              color: Colors.pinkAccent,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(color: Colors.yellow),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
