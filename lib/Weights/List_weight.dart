import 'package:flutter/material.dart';

Widget ListWeight(
    BuildContext context, String title, String add, String time, String image) {
  final me = MediaQuery.of(context).size;
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: me.height * .08,
          width: me.width * .2,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  image: NetworkImage(image.toString()), fit: BoxFit.cover)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: me.width * .65,
                child: Text(title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ))),
            SizedBox(
                width: me.width * .65,
                child: Text(add,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 14,
                    ))),
            SizedBox(
                width: me.width * .65,
                child: Text(time,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 14,
                    ))),
          ],
        )
      ],
    ),
  );
}
