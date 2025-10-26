import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/responsive.dart';

class HightLightsInfoNew extends StatelessWidget {
  const HightLightsInfoNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobileLarge(context)?
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimationTextCounterNew(valueupto: 100, subtitle: "Subscribers"),
          SizedBox(width: defaultPadding,),

          AnimationTextCounterNew(valueupto: 30, subtitle: "GitHub Project"),

          SizedBox(width: defaultPadding,)

        ]):
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
      AnimationTextCounterNew(valueupto: 100, subtitle: "Subscribers"),
      SizedBox(width: defaultPadding,),
      AnimationTextCounterNew(valueupto: 20, subtitle: "Videos"),
      SizedBox(width: defaultPadding,)
,
      AnimationTextCounterNew(valueupto: 30, subtitle: "GitHub Project"),

          SizedBox(width: defaultPadding,)

        ]);
  }
}


class AnimationTextCounterNew extends StatelessWidget {
  const AnimationTextCounterNew({super.key, required this.valueupto,required this.subtitle});
  final int valueupto;
 final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
        children: [
      TweenAnimationBuilder(
          tween: IntTween(begin: 0, end: valueupto),
          duration: Duration(seconds: 5),
          builder: (context, value, child) => Text("$value+",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: primaryColor))),
      SizedBox(width: defaultPadding/2,),
      Text(subtitle,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)
    ]);
  }
}
