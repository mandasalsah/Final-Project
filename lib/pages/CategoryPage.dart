
import 'package:bismillahfinalproject/pages/HomePage.dart';
import 'package:bismillahfinalproject/pages/square.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget{
    const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Ustad Adi Hidayat",
      "images":
          "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/07/08/876774867.jpg",
    },
    {
      "title": "Ustad Syamsuddin Nur Makka",
      "images":
          "https://assets.pikiran-rakyat.com/crop/85x46:688x393/x/photo/2022/03/03/3083478283.jpg",
    },
    {
      "title": "Ustad Tengku Hanan Attaki",
      "images":
          "https://1.bp.blogspot.com/-HxYE662vYyY/XSKrn1Km7dI/AAAAAAACcPc/9lR7W3zPeW0P5Wk12D33pG6o81UkTOR8gCLcBGAs/s1600/Hanan%2BAttaki%2BUHA.jpg",
    },
    {
      "title": "Ustad Handy Boni",
      "images":
          "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2021/09/18/2070338585.png",
    },
    
  ];

 @override
  Widget build(BuildContext context) {
    var child;
    return Scaffold(
     backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Category Doa"),
        backgroundColor: Color(0xFFFF884B),
        elevation: 0.0,
        leading: IconButton(
         icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                        context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
              const SizedBox(
                height: 20,
              ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Color(0xFFFFD384),
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                  ),
                ),
                ),
            ),
          ],
        ),
      ),
    );
  }
  }
