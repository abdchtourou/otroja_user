import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/constant.dart';
import '../../data/datasource/api_services.dart';


part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  ApiService apiService = ApiService();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  postData() async {
    final data=
    {
      "userName":userNameController.text,
    "password":passwordController.text
    };
     final response=await apiService.post("login", data: data);

    print(response.data);
    Map<String,dynamic> responseBody= response.data;
    print(responseBody['data']['token']);
    token=responseBody['data']['token'];
    print(token);
    print('.......................');
  }
}
