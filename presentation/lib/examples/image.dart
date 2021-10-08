import 'package:flutter/material.dart';

class image extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: Center(
        child: Container(
          // height: 200,
          child: GridView.count(
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/1.JPG'))),
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/6.JPG'))),
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/3.JPG'))),
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/4.JPG'))),
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/5.JPG'))),
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/2.JPG'))),
              ),
              Container(
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('assets/test.gif'))),
              ),
              Container(
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('assets/test2.gif'))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
