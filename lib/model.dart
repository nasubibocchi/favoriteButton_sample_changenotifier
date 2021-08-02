
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final controller = ChangeNotifierProvider.autoDispose((ref) => MainModel());

class MainModel extends ChangeNotifier {

  late List<ObjectedData> dataList = [];

  ///sample data
  List<ObjectedData> sampleData = [
    ObjectedData(isFavo: false, word: 'a', iConsColour: Colors.grey),
    ObjectedData(isFavo: false, word: 'i', iConsColour: Colors.grey),
    ObjectedData(isFavo: false, word: 'u', iConsColour: Colors.grey),
  ];

  ///アイコンがタップされたら色を変える
  List changeBool(bool change, Color color) {
    change = !change;
    change == false ? color = kInactiveColour : color = kActiveColour;
    notifyListeners();
    return [change, color];
  }

  ///stateが変化したらページをリロードするfunction（実際には使用していない）
  Future reload() async{
    notifyListeners();
  }

}



class ObjectedData {
  bool isFavo = false;
  late Color iConsColour;
  late String word;

  ObjectedData({required bool isFavo, required String word, required Color iConsColour}) {
    this.word = word;
    this.isFavo = isFavo;
    this.iConsColour = iConsColour;
  }

}


const kInactiveColour = Colors.grey;
const kActiveColour = Colors.red;



