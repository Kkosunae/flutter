
import 'package:flutter/material.dart';
import 'package:kkosunae/src/screens/pet_onboarding_screen.dart';

class UserOnboardingScreen extends StatelessWidget {
  const UserOnboardingScreen({Key? key}) : super(key: key);

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
                  MaterialPageRoute(builder: (context) => const PetOnboardingScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}