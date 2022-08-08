import 'package:flutter/material.dart';
import 'package:student_data_in_state/widgets/navigation.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '          NY NOTE\n____________________',
                style: TextStyle(
                    color: Color.fromARGB(255, 243, 214, 126),
                    fontSize: 45,
                    fontWeight: FontWeight.w800,
                    height: -0.01),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Explore at its Extreme',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                    height: 1.5),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '     Store the data. Experience the application... \nYou can easly create a profile and store the data.... ',
                style: TextStyle(letterSpacing: 1),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'Assets/images/welcome page.png',
                height: 360,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 50,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (ctx) => NavigationBarPage()),
                      (route) => false);
                },
                child: const Icon(
                  Icons.arrow_forward_sharp,
                  size: 100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
