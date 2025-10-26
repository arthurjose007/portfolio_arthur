import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/models/Project.dart';
import 'package:portfolio/responsive.dart';

class MyprojectsNew extends StatelessWidget {
  const MyprojectsNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "MY Project",
          style:TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.bold)
          // Theme.of(context)
          //     .textTheme
          //     .headlineMedium!
          //     .copyWith(color: Colors.white),
        ),
        SizedBox(
          height: defaultPadding,
        ),
        Responsive(
            mobile: Padding(
              padding: const EdgeInsets.only(right: defaultPadding),
              child: ProjectGridView(crossAxisCount: 1, childAspectRation: 1.7),
            ),
            mobileLarge: ProjectGridView(crossAxisCount: 2),
            tablet: ProjectGridView(
              childAspectRation: 1.1,
            ),
            desktop: Padding(
              padding: const EdgeInsets.only(right: defaultPadding),
              child: ProjectGridView(),
            )),
      ],
    );
  }
}

class ProjectGridView extends StatelessWidget {
  const ProjectGridView(
      {super.key, this.crossAxisCount = 3, this.childAspectRation = 1.3});
  final int crossAxisCount;
  final double childAspectRation;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: projects.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRation,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding),
        itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                  color: secondaryColor,
border: Border.all(color: Color(0xFF3984D8),
),
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    projects[index].title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Spacer(),
                  Text(
                    projects[index].description!,
                    maxLines: Responsive.isMobileLarge(context) ? 3 : 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(height: 1.5),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Read More>>",
                        style: TextStyle(color: primaryColor),
                      )),
                ],
              ),
            ));
  }
}
