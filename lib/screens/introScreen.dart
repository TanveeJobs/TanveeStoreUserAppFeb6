import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final VoidCallback onPressed;

  IntroScreen(this.imageUrl, this.title, this.description, this.onPressed);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imageUrl), fit: BoxFit.cover)),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.08),
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25)),
                  SizedBox(height: height * 0.05),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height * 0.05),
                  InkWell(
                    onTap: onPressed,
                    child: Container(
                      width: width * 0.20,
                      height: height * 0.05,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10,
                                offset: Offset(1, 2))
                          ]),
                      child: const Center(
                        child: Text('Next',
                            style: TextStyle(
                                color: Colors.white,
                                // fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
