import 'package:flutter/material.dart';
class PizzaImageWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    AssetImage pizzaAsset = AssetImage("images/pizza.png");
    Image image = Image(image: pizzaAsset, width: 100.00, height: 100.0,);
    return Container(child: image, padding: EdgeInsets.only(top: 10.0 ),);
  }
}

//SingleChildScrollView singleChildScrollView = SingleChildScrollView (child: pizzaAsset,);

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 50.0, left: 10.0),
        color: Colors.deepOrange,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: buildText(label: "Mussarela", size: 30.0,) ,
                ),
                Expanded(
                  child: buildText(label: "Molho, mussarela, tomate em rodelas e orégano", size: 20.0,) ,
                ),
              ],
            ),
            PizzaImageWidget(),
            OrderButton(),
          ],
        ),
      ),
    );
  }

  

  Widget buildText({String label, double size}){
    return Text(
      label,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        color: Colors.black,
        fontSize: size,
        decoration: TextDecoration.none,
      ),
    );
  }
}

class OrderButton extends StatelessWidget {

  void order(BuildContext context){
    var alert = AlertDialog(
      title: Text("Order Completed"),
      content: Text("Thanks for your order"),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    var button = Container(
      margin: EdgeInsets.only(top: 50.0),
      child: RaisedButton(
          onPressed: () {
            order(context);
          },
          child: Text("Order your Pizza!"),
          color: Colors.lightGreen,
          elevation: 5.0,
      ),
    );
    return button;
  }
}