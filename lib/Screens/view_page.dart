import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  const ViewPage(
      {super.key,
      required this.name,
      required this.add,
      required this.time,
      required this.image});
  final String? name;
  final String? time;
  final String? image;
  final String? add;
  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    final me = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: me.height * .06,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.blue,
                    )),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                    width: me.width * .65,
                    child: Text(widget.name.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ))),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(
                height: 1,
                thickness: 1,
                color: Colors.black38,
              ),
            ),
            Container(
              height: me.height * .4,
              width: me.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12),
                  image: DecorationImage(
                      image: NetworkImage(widget.image.toString()),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: me.height * .01,
            ),
            SizedBox(
                width: me.width * .8,
                child: Text(widget.time.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ))),
            SizedBox(
                width: me.width * .8,
                child: Text(widget.add.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 14,
                    ))),
          ],
        ),
      ),
    );
  }
}
