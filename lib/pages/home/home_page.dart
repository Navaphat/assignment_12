import 'package:flutter/material.dart';
import 'package:flutter_food/models/api_result.dart';
import 'package:flutter_food/models/food_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<FoodItem> _foodData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FLUTTER FOOD'),
      ),
      body: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _handleClickButton,
              child: Text('LOAD FOODS DATA'),
            ),
            SizedBox(height: 10.0),
            Flexible(
                child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              itemCount: _foodData.length,
              itemBuilder: (context, index) => _viewFoods(context, index),
            )),
          ]),
    );
  }

  Future<void> _handleClickButton() async {
    final Uri url = Uri.parse('https://cpsu-test-api.herokuapp.com/foods');
    var result = await http.get(url);

    var json = jsonDecode(result.body);
    var apiResult = ApiResult.fromJson(json);
    /*String status = json['status'];
    String? message = json['message'];*/

    setState(() {
      for (var element in apiResult.data) {
        var foodItem = FoodItem.fromJson(element);
        _foodData.add(foodItem);
      }
    });
  }

  Widget _viewFoods(BuildContext context, int index) {
    var food = _foodData[index];
    return Card(
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Image.network(food.image.toString(), width: 125.0),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${food.name}", style: TextStyle(fontSize: 20.0)),
                Text("${food.price} บาท", style: TextStyle(fontSize: 15.0))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
