import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:riverpodkit/models/Posts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewListController extends StateNotifier {
  ViewListController(state) : super(state);

  // ViewListController(Posts state) : super(state);

  Future<List<Posts>> getAll() async {
    
      
      var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      if(response.statusCode == 200){

        List<dynamic> body = jsonDecode(response.body);
        return body.map((posts) => Posts.fromJson(posts)).toList();

      }
      else{
        throw Exception("Failed to upload product list");
      }
    

  }

}

final viewListControl = StateNotifierProvider((ref){
  return ViewListController(ref);
});