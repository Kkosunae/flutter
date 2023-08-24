import 'package:flutter/material.dart';

import 'main_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('사용자 정보 입력'),
            Container(
              width: 300,
              margin: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  labelText: 'input',
                ),
              ),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  labelText: 'input',
                ),
              ),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  labelText: 'input',
                ),
              ),
            ),
            ElevatedButton(
              child: const Text('완료'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('반려동물 정보 입력'),
              Container(
                width: 300,
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    labelText: 'input',
                  ),
                ),
              ),
              Container(
                width: 300,
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    labelText: 'input',
                  ),
                ),
              ),
              Container(
                width: 300,
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    labelText: 'input',
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('완료'),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()),);

                },
              ),
            ],
          ),
        ),
      );
  }
}
