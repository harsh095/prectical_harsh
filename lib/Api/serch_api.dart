import 'dart:convert';

import 'package:http/http.dart' as http;

class SerchApi {
  Future<String> data(String serch) async {
    var headers = {
      'Cookie':
          'datadome=VoUe4sIg1F4KtCqPqYzxIQdS4Bv63ty7J7pGI3ZD3HHoM8D05FL6e8_QqHf_q6bbXCCUyZ~x8Iig7uzCtu02hDLYoqT4lzLMRGUYyofnpB4NOz5qR1spTb9bKT2C0GTp'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://api.seatgeek.com/2/events?client_id=NDAwMDQ4MzB8MTcwODU3NTU5OS4yNjA1OTU&q=' +
                serch.toString()));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      return "";
    }
  }
}
