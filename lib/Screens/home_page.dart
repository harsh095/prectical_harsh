import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:prectical_harsh/Controller/home_controller.dart';
import 'package:prectical_harsh/Screens/view_page.dart';

import '../Weights/List_weight.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _serchController = TextEditingController();
  HomeController _homeController = Get.put(HomeController());
  @override
  void initState() {
    _homeController.DataLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final me = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: me.height * .05,
              color: Colors.blueGrey,
            ),
            //SerchBar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              color: Colors.blueGrey,
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _serchController,
                  onSubmitted: (value) {
                    if (value != "") {
                      print("Harsh");
                      _homeController.DataSerch(value.toString());
                    } else {
                      Fluttertoast.showToast(msg: "Serch Value is Empty");
                    }
                  },
                  cursorColor: Colors.white,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search_sharp,
                      color: Colors.white,
                      size: 14,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        print("object");

                        _serchController.clear();
                        _homeController.Nodata.value = false;
                        _homeController.DataLoad();
                      },
                      icon: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Center(
                          child: Icon(
                            Icons.close,
                            color: Colors.blueGrey,
                            size: 14,
                          ),
                        ),
                      ),
                    ),
                    hintText: "Search!",
                    hintStyle: TextStyle(fontSize: 14, color: Colors.white),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black12,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black12,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Obx(() {
              return _homeController.isload.value == false
                  ? Column(
                      children: [
                        //ListView
                        ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            primary: false,
                            itemCount: _homeController.dataList.value.length,
                            itemBuilder: (context, index) {
                              String inputString = _homeController
                                  .dataList.value[index].time
                                  .toString();
                              DateTime dateTime = DateTime.parse(inputString);
                              String formattedDateTime =
                                  DateFormat('E,d MMM y hh:mm a')
                                      .format(dateTime);
                              return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ViewPage(
                                                  name: _homeController.dataList
                                                      .value[index].Name
                                                      .toString(),
                                                  add: _homeController.dataList
                                                      .value[index].adderess
                                                      .toString(),
                                                  time: formattedDateTime,
                                                  image: _homeController
                                                      .dataList
                                                      .value[index]
                                                      .image
                                                      .toString(),
                                                )));
                                  },
                                  child: ListWeight(
                                      context,
                                      _homeController.dataList.value[index].Name
                                          .toString(),
                                      _homeController
                                          .dataList.value[index].adderess
                                          .toString(),
                                      formattedDateTime,
                                      _homeController
                                          .dataList.value[index].image
                                          .toString()));
                            })
                      ],
                    )
                  : _homeController.Nodata.value == true
                      ? Center(
                          child: Text(
                            "No Data There!",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: CircularProgressIndicator(
                              color: Colors.blueGrey,
                            ),
                          ),
                        );
            }),
          ],
        ),
      ),
    );
  }
}
