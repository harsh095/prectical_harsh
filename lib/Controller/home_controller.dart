import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../Api/all_data_Api.dart';
import '../Api/serch_api.dart';
import '../Model/all_model.dart';

class HomeController extends GetxController {
  RxBool isload = true.obs;
  var dataList = <DataModel>[].obs;
  RxBool Nodata = false.obs;

  void DataLoad() {
    DataApi().data().then((value) {
      if (value != "") {
        var data = jsonDecode(value);
        for (int i = 0; i < data['events'].length; i++) {
          dataList.value.add(DataModel(
            id: data['events'][i]['id'].toString(),
            Name: data['events'][i]['performers'][0]['name'].toString() +
                " At " +
                data['events'][i]['venue']['city'].toString(),
            image: data['events'][i]['performers'][0]['image'].toString(),
            time: data['events'][i]['datetime_utc'].toString(),
            adderess: data['events'][i]['venue']['display_location'].toString(),
          ));
          isload.value = false;
        }
      } else {}
    });
  }

  void DataSerch(String data) {
    isload.value = true;
    SerchApi().data(data).then((value) {
      if (value != "") {
        var data = jsonDecode(value);
        if (data['events'].length != 0) {
          for (int i = 0; i < data['events'].length; i++) {
            dataList.value.add(DataModel(
              id: data['events'][i]['id'].toString(),
              Name: data['events'][i]['performers'][0]['name'].toString() +
                  " At " +
                  data['events'][i]['venue']['city'].toString(),
              image: data['events'][i]['performers'][0]['image'].toString(),
              time: data['events'][i]['datetime_utc'].toString(),
              adderess:
                  data['events'][i]['venue']['display_location'].toString(),
            ));
          }
          isload.value = false;
        } else {
          Nodata.value = true;
          Fluttertoast.showToast(msg: "No Data");
        }
      } else {
        print("All Data Null");
      }
    });
  }
}
