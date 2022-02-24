import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:riverpodkit/models/Posts.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthViewController extends StateNotifier {
  AuthViewController(state) : super(state);
  Future login(String email,String password) async {
     var  response = await http.post(Uri.parse('https://jivandeep-crud.herokuapp.com/api-auth/login'),body:{
        'email':email,
        'password':password
     });
     if(response.statusCode == 200){
      //  print("User Logged in");
      //  print(response.body);
      var storage = GetStorage();
      var decode = jsonDecode(response.body);
      var token = storage.write("MyToken", decode['token']);
      return token;
     }
     else {
       print('Invalid Credentials');
       throw('Invalid credentials');
    }
  }
}

final authViewProvider = StateNotifierProvider((ref){
  return AuthViewController(ref);
});