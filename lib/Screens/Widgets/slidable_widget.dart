import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum SlidableAction {more, delete }

class SlidableWidget<T> extends StatelessWidget {
  final Widget child;
  final Function(SlidableAction action) onDismissed;

  const SlidableWidget({
    @required this.child,
    @required this.onDismissed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
        actionPane: SlidableDrawerActionPane(),
        child: child,
        /// right side
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'ลบรายการนี้',
            foregroundColor: Colors.red,
            color: Colors.grey.shade50,
            iconWidget:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Colors.blue[600],
                    borderRadius: BorderRadius.circular(4.5),
                    boxShadow: [
                      BoxShadow(color: Colors.black45, offset: Offset(1.9, 2.0)),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'X',
                      style: TextStyle(
                          fontSize: 13.5,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Signatra'),
                    ),
                  ),
                ),
              ],
            ),
            onTap: () => onDismissed(SlidableAction.delete),
          ),
        ],
      );
}
