import 'dart:convert';
import 'package:flutter/widgets.dart';

class MyHomePageProvider extends ChangeNotifier {
  MyData data;

  Future getData(context) async {
    // You can call an API to get data, once we've the data from API or any other flow... Following part would always be the same.
    // We forgot about one more important part .. lets do that first

    // We need access to BuildContext for loading this string and it's not recommended to store this context in any variable here
    // in change notifier..
    var response =
        await DefaultAssetBundle.of(context).loadString('assets/mJson.json');
    // now we have response as String from local json or and API request...
    var mJson = json.decode(response);
    // now we have a json...
    this.data = MyData.fromJson(mJson);
    this.notifyListeners(); // for callback to view
  }
}

class MyData {
  List<Results> results;

  MyData.fromJson(Map<String, dynamic> json) {
    json['results'].forEach((v) {
      results.add(new Results.fromJson(v));
    });
  }
}

class Results {
  String firstName;
  String lastName;
  String email;
  String phone;
  bool verified;

  Results.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    verified = json['verified'];
  }
}
