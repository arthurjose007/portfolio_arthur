import 'package:flutter/material.dart';

import '../../../constants.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Column(
        children: [
          Spacer(flex: 2),
          Stack(

            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 108,
                width: 108,
                child: CircularProgressIndicator(

                  value: 0.5,

                  strokeWidth: 4,
                  color: primaryColor,
                  backgroundColor: Color(0xFF26C0F6),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 42,
                  backgroundImage: AssetImage("assets/images/profile.jpg"),
                ),
              ),
            ],
          ),
          // CircularProgressIndicator(
          //   child: CircleAvatar(
          //     radius: 50,
          //     backgroundImage: AssetImage("assets/images/profile.jpg"),
          //   ),
          // ),
          Spacer(),
          Text(
            "Arthur Jose",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            "Flutter Developer",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w200,
              height: 1.5,
            ),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
