import 'package:bismillahfinalproject/pages/ReviewPages.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget{
  String img;
  String imgList;
  String imgPrice;
  ItemPage(this.img, this.imgList, this.imgPrice);
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 5, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back,
                    color: Colors.blue.withOpacity(0.5)
                    ),
                  ),
                  
                  ),
                  
                  SizedBox(height: 10),
                  Center(
                    child: Image.asset(
                      "images/$img.jpg",
                      width: MediaQuery.of(context).size.width/1.2,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 25, right: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                           imgList,
                           style: TextStyle(
                          fontSize: 18,
                           color: Colors.deepPurple.withOpacity(0.4),
                           letterSpacing: 3,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                           img,
                           style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                           color: Colors.deepPurple,
                           letterSpacing: 1,
                    ),
                  ),
SizedBox(height: 10),
 Text(
                           "Deskripsi",
                           style: TextStyle(
                          fontSize: 18,
                           color: Colors.black,
                           letterSpacing: 1,
                    ),
                  ),
SizedBox(height: 10),
Text(
                           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                           textAlign: TextAlign.justify,
                           style: TextStyle(
                          fontSize: 15,
                           color: Colors.black,
                           letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: 8
                  ),
                  Text(
                           imgPrice,
                           style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                           color: Colors.deepPurple,
                    ),
                  ),
                   SizedBox(height: 10
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(
                           "Review",
                           style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                           color: Colors.deepPurple,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ReviewPage(),
                  )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24),
                     child:
                        Text("View All", style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                           color: Colors.deepPurple,
                    ),
                  ),
                    ),
                  )
                  ],
                  ),
                   SizedBox(height: 10
                  ),
                 Text(
                           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                           textAlign: TextAlign.justify,
                           style: TextStyle(
                          fontSize: 15,
                           color: Colors.black,
                           letterSpacing: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: (){
                           Navigator.of(context).pushNamed("/CartPage");
                        },
                        child: Container(
                          padding: EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(
                            Icons.shopping_cart,
                            size: 32,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                       InkWell(
                        onTap: (){},
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 70),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                           "Buy Now",
                           style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                           color: Colors.deepPurple.withOpacity(0.8),
                    ),
                  ),
                        ),
                      )
                    ],
                  )
                      ],
                    ),
                    )
              ],
            ),)
          ),
      ),
    );
}
}

