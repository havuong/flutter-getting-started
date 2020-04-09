import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top:30,left:10),
        color: Colors.deepOrangeAccent,
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                  child: Text(
                "Margherita",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontSize: 30.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'Oxygen',
                    fontWeight: FontWeight.normal),
              )),
              Expanded(
                child: Text(
                  "Tomato, Mozzarella, Basil",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      fontSize: 30.0,
                      decoration: TextDecoration.none,
                      fontFamily: 'Oxygen',
                      fontWeight: FontWeight.normal),
                ),
              )
            ]),
            Row(children: <Widget>[
              Expanded(
                  child: Text(
                "Marinara",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontSize: 30.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'Oxygen',
                    fontWeight: FontWeight.normal),
              )),
              Expanded(
                child: Text(
                  "Tomato, Garlic",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      fontSize: 30.0,
                      decoration: TextDecoration.none,
                      fontFamily: 'Oxygen',
                      fontWeight: FontWeight.normal),
                ),
              )
            ]),
            PizzaImageWidget(),
          ],
        ));
  }
}

class PizzaImageWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AssetImage pizzaAsset = AssetImage('images/pizza.png');
    Image image = Image(image: pizzaAsset,width:400,height:400);
    return Container(child:image);
  }
  
}
