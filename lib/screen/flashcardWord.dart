import 'package:articulation/screen/options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'singleFlipCard.dart';
import 'options.dart';


class flashCardWord extends StatefulWidget {


  final dict;
  const flashCardWord(@required this.dict);

  @override
  _flashCardState createState() => _flashCardState();
}

class _flashCardState extends State<flashCardWord> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        child:  Stack(
          children: [
            GestureDetector(
              child: Container(
                margin: EdgeInsets.all(10),
                width: 50,
                height: 50,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(360)
                  ),
                ),
                child: Icon(Icons.arrow_back_ios, size: 50),
              ),
              onTap: (){
                Navigator.of(context).pop(
                );
              },
            ),
            Center(
              child: Container(
                //color: Colors.white,
                width: 700,
                height: 700,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)
                  ),
                ),
                child: CarouselSlider(
                  items: widget.dict.map<Widget>((pictureOptions) =>
                  CarouselCard(picturesOptions: pictureOptions)).toList(),
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height,
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                    onPageChanged: (position,reason){

                    },
                    enableInfiniteScroll: false,
                  ),


                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 750, left: 1000, right: 10, bottom: 10),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(360)
                ),
              ),
              child: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
    //);
  }
}

class CarouselCard extends StatelessWidget {
  final PicturesOptions picturesOptions;

  const CarouselCard({required this.picturesOptions});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: [
            Container(
              width: 400,
              height: 450,
              padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Image.asset(picturesOptions.image, fit: BoxFit.contain)),
            Positioned(
                right: 0.0,
                bottom: 150.0,
                left: 0.0,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Center(
                    child: Text(picturesOptions.word,
                    style: TextStyle(color: Colors.black,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold),),
                  ),
                )),
            Positioned(
                right: 0.0,
                bottom: 80.0,
                left: 0.0,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Comment",
                  ),
                ),
            ),
            Positioned(
              right: 0.0,
              bottom: 20.0,
              left: 0.0,
              child: ElevatedButton(
                onPressed: (){
                  // Button Functionality
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white
                )
              ),
            ),

          ],
        ),
      ),
    );
  }
}

