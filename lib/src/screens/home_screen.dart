
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.green,

      child: Column(
        children: [
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: ElevatedButton(
                  child: Text("button1"),
                  onPressed: () {  },

                ),
              ),
              SizedBox(
                child: ElevatedButton(
                  child: Text("button1"),
                  onPressed: () {  },

                ),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: ElevatedButton(
                  child: Text("button1"),
                  onPressed: () {  },

                ),
              ),
              SizedBox(
                child: ElevatedButton(
                  child: Text("button1"),
                  onPressed: () {  },

                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(onPressed: () {}, icon: Image.asset('assets/kakao_login_medium_narrow.png'))
            ],
          ),
          Container(
            color: Colors.black,
            child: Text('Container2'),
          ),
          Container(
            color: Colors.yellow,
            child: Text('Container3'),
          ),
          Text("Column Widget"),
          Column(
            children: [
              Text("Column Widget2"),
              Text("Column Widget2"),
              Text("Column Widget2"),
              Text("Column Widget2"),
            ],
          ),
        ],
      ),

    );
  }
}