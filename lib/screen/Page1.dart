import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
//import 'package:flutter/services.dart' as rootBundel;
import 'package:flutter/services.dart'as rootBundle;

import '../modeldata/songmodel.dart';



class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  List<ModelData> dataList = [];

  @override
  void initState() {
    LoadData();
    super.initState();
  }
  Future<void> LoadData()async {
    try{
      String jsonString = await rootBundle.rootBundle.loadString("JasonData/data.jason");
      List<dynamic> jsonList = json.decode(jsonString);
      setState(() {
        dataList = jsonList.map((json) => ModelData.fromJson(json)).toList();
      });
    }
    catch(e){
      log("error: $e");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Container(
        height: 500,
        width: 500,
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: dataList.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                image: dataList[index].songImage != null
                    ? DecorationImage(image: NetworkImage(dataList[index].songImage!))
                    : const DecorationImage(image: AssetImage('path_to_placeholder_image')),
              ),
              child: Text("${dataList[index].artist}", style: const TextStyle(color: Colors.blue, fontSize: 20)),
            );
          },
        ),
      ),
    );
  }
}
