import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/screens/home/components/mainscreen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portfolio/responsive.dart';

class HomeScreenNew extends StatelessWidget {
  final VoidCallback onExplorePressed; // <-- Add this

  const HomeScreenNew({super.key, required this.onExplorePressed});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AspectRatio(
          aspectRatio:Responsive.isMobile(context)?2.5: 3,
          child: Stack(
            fit: StackFit.expand,
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create Digital Experience  \n With Flutter!",
                    style:Responsive.isDesktop(context)? Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold): Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)
                  ),
                  DefaultTextStyle(
                    //it applies same style to all the widgets under it
                    style: Theme.of(context).textTheme.titleSmall!,
                    maxLines: 1,
                    child: Row(
                      children: [
                        if(Responsive.isDesktop(context))

                          FluterCodedTextNew(),
                        if(Responsive.isDesktop(context))
                        SizedBox(
                          width: defaultPadding / 2,
                        ),
                        Text("Building "),
                        Expanded(
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText("intuitive and high-performance applications for mobile and web. ",
                                  speed: Duration(
                                    milliseconds: 60,
                                  )),
                              TyperAnimatedText(
                                " and Crafting seamless cross-platform solutions from a single codebase",
                                speed: Duration(
                                  milliseconds: 60,
                                ),
                              ),
                              TyperAnimatedText(
                                  "responsive mobile and web applications with native performance",
                                  speed: Duration(
                                    milliseconds: 60,
                                  )),
                            ],
                          ),
                        ),
                        if(Responsive.isDesktop(context))

                          SizedBox(
                          width: defaultPadding / 2,
                        ),
                        if(Responsive.isDesktop(context))

                          FluterCodedTextNew(),
                      ],
                    ),
                  ),
                  if(Responsive.isDesktop(context))

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ElevatedButton(

                        onPressed: onExplorePressed,
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

                            padding: EdgeInsets.symmetric(
                                horizontal: defaultPadding * 2,vertical: defaultPadding,),backgroundColor: primaryColor),
                        child: Text(
                          "Explore now",
                          style: TextStyle(color: darkColor),
                        )),
                    )
                ],
              )
            ],
          ))
    ]);
  }
}

class FluterCodedTextNew extends StatelessWidget {
  const FluterCodedTextNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(text: "<", children: [
      TextSpan(
        text: "Flutter",
        style: TextStyle(color: primaryColor),
      ),
      TextSpan(text: ">"),
    ]));
  }
}
