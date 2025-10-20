import 'package:flutter/material.dart';
import 'package:gamerconnect/Models/news_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsPro with ChangeNotifier {
  bool isLoadingNews = true;
  List<NewsModel> list = [];
  getNews() async {
    try {
      isLoadingNews = true;
      notifyListeners();
      list = [];
      var res = await http.get(
        Uri.parse(
          "https://api.apitube.io/v1/news/everything?language.code=en&category.id=medtop:20000548&api_key=api_live_L9mLscdYQ4Z79hXNmNUNRLKB7o1qhoqZiqXw4vEEuIKLvyIkAn5th9zQ",
        ),
      );
      var data = jsonDecode(res.body);
      if (data['status'] == 'ok') {
        for (int i = 0; i < data['results'].length; i++) {
          list.add(NewsModel.fromJson(data['results'][i]));
        }
      }
      isLoadingNews = false;
      notifyListeners();
    } catch (e) {
      isLoadingNews = false;
      notifyListeners();
    }
  }
}
