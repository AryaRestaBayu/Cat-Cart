import 'package:flutter/material.dart';

class Slogan extends StatelessWidget {
  const Slogan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          // color: Colors.red,
          height: MediaQuery.of(context).size.height,
          width: 400,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Image(image: AssetImage('assets/gifkucing.gif')),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Text(
                      'Solusi untuk kucing',
                      style: TextStyle(fontSize: 30, color: Colors.grey[600]),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20, top: 10),
                    child: Text(
                      'Kesayanganmu',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          left: 20,
          top: 20,
          child: SizedBox(
              height: 50, child: Image(image: AssetImage('assets/logo.png'))),
        ),
      ],
    );
  }
}
