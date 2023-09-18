import 'package:flutter/material.dart';

class ListPaw extends StatelessWidget {
  const ListPaw({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(left: BorderSide(color: Colors.grey[600]!)),
      ),
      child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return const SizedBox(
              height: 110,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 35,
                    height: 35,
                    child: Image(image: AssetImage('assets/paw.png')),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 35,
                      height: 35,
                      child: Image(image: AssetImage('assets/paw.png')),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
