import 'package:flutter/material.dart';
import 'package:portfolio/screens/home/components/sideMenu.dart';

import '../../../../constants.dart';
import '../../../../responsive.dart';

import '../../main/components/side_menu.dart';

class MainScreen extends StatelessWidget {

  const MainScreen({super.key, required this.children,this.controller,});
  final List<Widget> children;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //We hide the appbar on desktop
      appBar:Responsive.isDesktop(context)?null: AppBar(backgroundColor: secondaryColor,leading: Builder(
        builder: (context) {
          return IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: Icon(Icons.menu));
        }
      ),),
      drawer:SideMenus() ,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(
            'assets/images/g1.png', // Make sure this path is correct
            // Ensures the image covers the whole area
          ),fit: BoxFit.cover, )
        ),
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Row(
              children: [
                if(Responsive.isDesktop(context))
                Expanded(
                  flex: 2,
                  child: SideMenus(),
                ),
                SizedBox(width: defaultPadding,),
                Expanded(
                  flex: 7,
                  child: SingleChildScrollView(
                    controller: controller,
                    child: Column(
                      children: [
                        ...children,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
