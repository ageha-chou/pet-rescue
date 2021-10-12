

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PestListController extends GetxController{

  final BuildContext context;
  PestListController({required this.context});

  List<int>  ActiveButton = [1,0,0];
  int counter = 0;
  @override
  void onInit() {
    super.onInit();
    _incrementCounter();
  }

  void _incrementCounter(){
      counter++;
  }
  void ChangeToValue(int value){
    for(int current_value=0; current_value < ActiveButton.length; current_value++){
       if(current_value == value){
         ActiveButton[current_value] =  1;
       }else{
         ActiveButton[current_value] =  0;
       }
    }
  }

}