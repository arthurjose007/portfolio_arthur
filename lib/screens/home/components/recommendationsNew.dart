import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/models/Recommendation.dart';

import '../../../responsive.dart';

class RecommendationsNew extends StatelessWidget {
  const RecommendationsNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5,),

        Text("Recommendations", style:Theme.of(context).textTheme.titleLarge),
       SizedBox(height: 10,),
       SingleChildScrollView(
         scrollDirection: Axis.horizontal,
         child: Row(children:
           List.generate(demo_recommendations.length, (index)=>Padding(

             padding: const EdgeInsets.only(left: defaultPadding),
             child: Container(
    decoration: BoxDecoration(
    color: secondaryColor,
    border: Border.all(color: Color(0xFF3984D8)),

    borderRadius: BorderRadius.all(Radius.circular(5),

    ),
    ),
               width:Responsive.isDesktop(context)?400:350 ,
               padding: EdgeInsets.all(defaultPadding),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Text(
                     demo_recommendations[index].name!,
                     style: Theme.of(context).textTheme.titleSmall,
                   ),
                   Text(
                     demo_recommendations[index].source!,
                     overflow: TextOverflow.ellipsis,
                     style: Theme.of(context).textTheme.bodyMedium,
                   ),
                   SizedBox(height: defaultPadding,),
                   Text(
                     demo_recommendations[index].text!,
                     overflow: TextOverflow.ellipsis,

                     maxLines: 4,
                     style: TextStyle(height: 1.5),
                   ),
                 ],
               ),
             ),
           ),)
         ,),
       ),
        SizedBox(height: 10,),

      ],
    );
  }
}
