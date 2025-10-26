import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/screens/main/components/my_info.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:universal_html/html.dart' as html;

Future<void> _launchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}
void _downloadCV() {
    final cvPath = '${Uri.base.origin}${Uri.base.path}assets/cv/Arthur_Jose_cv.pdf';
  // const cvPath = 'assets/cv/Arthur_Jose_cv.pdf';
  final anchor = html.AnchorElement(href: cvPath)
    ..setAttribute('download', 'Arthur_Jose_cv.pdf') 
    ..click(); // triggers browser download
}


class SideMenus extends StatelessWidget {
  const SideMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Color(0xFF161A3F),
        // shape: OutlineInputBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomRight: Radius.circular(25)),),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            border: Border.all(
              color: Color(0xFF2E3468),
              width: 2,
            ),
          ),
          child: Column(
            children: [
              MyInfo(),
              Expanded(
                  child: SingleChildScrollView(
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    AreaInfoText(title: "Residence", text: "Thrissur"),
                    AreaInfoText(title: "City", text: "Kodakara"),
                    AreaInfoText(title: "Age", text: "24"),
                    Divider(),
                    Padding(
                        padding: EdgeInsets.symmetric(
                      vertical: defaultPadding,
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Skills",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: CircularAnimationProgress(
                                percentage: 0.8, skillName: "Flutter")),
                        SizedBox(
                          width: defaultPadding,
                        ),
                        Expanded(
                            child: CircularAnimationProgress(
                                percentage: 0.7, skillName: "FireBase")),
                        SizedBox(
                          width: defaultPadding,
                        ),
                        Expanded(
                            child: CircularAnimationProgress(
                                percentage: 0.5, skillName: "HTML")),
                        SizedBox(
                          width: defaultPadding,
                        )
                      ],
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: defaultPadding,
                      ),
                      child: Text(
                        "Coding",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    AnimaitonLinearProgressIndicatior(
                        percentage: 0.7, codinglanguage: "Dart"),
                    AnimaitonLinearProgressIndicatior(
                        percentage: 0.50, codinglanguage: "Python"),
                    AnimaitonLinearProgressIndicatior(
                        percentage: 0.85, codinglanguage: "Html"),
                    AnimaitonLinearProgressIndicatior(
                        percentage: 0.70, codinglanguage: "Css"),
                    AnimaitonLinearProgressIndicatior(
                        percentage: 0.65, codinglanguage: "C"),
                    AnimaitonLinearProgressIndicatior(
                        percentage: 0.7, codinglanguage: "C++"),
                    Divider(),
                    KnowledgeText(text: "Flutter,Dart"),
                    KnowledgeText(text: "Stylus,Sass,Less"),
                    KnowledgeText(text: "Gulp,,WebPack,Grunt"),
                    KnowledgeText(text: "GIT Knowledge"),
                    Divider(),
                    TextButton(
                        onPressed: _downloadCV,
                        child: FittedBox(
                          child: Row(
                            children: [
                              Text(
                                "DOWNLOAD CV",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color),
                              ),
                              SizedBox(
                                width: defaultPadding / 2,
                              ),
                              Icon(Icons.file_download_sharp)
                            ],
                          ),
                        )),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF2E3468)),
                          borderRadius: BorderRadius.circular(7)),
                      margin: EdgeInsets.only(top: defaultPadding),
                      child: Row(
                        children: [
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                _launchUrl('https://www.linkedin.com/in/arthur-jose-965abb290/');
                              },
                              icon: SvgPicture.asset(
                                color: Colors.blue,
                                  "assets/icons/linkedin.svg")),
                          IconButton(
                              onPressed: () {
                                _launchUrl('https://github.com/arthurjose007');
                              },
                              icon:
                                  SvgPicture.asset(
                                      color: Colors.blue,
                                      "assets/icons/github.svg")),
                          IconButton(
                              onPressed: () {
                                _launchUrl('https://x.com/ArthurJose2001');

                              },
                              icon:
                                  SvgPicture.asset(
                                      color: Colors.blue,

                                      "assets/icons/twitter.svg")),
                          Spacer(),
                        ],
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class AreaInfoText extends StatelessWidget {
  String title, text;
  AreaInfoText({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        Text(text),
      ],
    );
  }
}

class CircularAnimationProgress extends StatelessWidget {
  double percentage;
  String skillName;

  CircularAnimationProgress(
      {super.key, required this.percentage, required this.skillName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: percentage),
              duration: defaultDuration,
              builder: (context, double value, child) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: value,
                      color: primaryColor,
                      backgroundColor: darkColor,
                    ),
                    Center(
                      child: Text(
                        (value * 100).toInt().toString() + "%",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    )
                  ],
                );
              }),
        ),
        SizedBox(
          height: defaultPadding / 2,
        ),
        Text(
          skillName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}

class AnimaitonLinearProgressIndicatior extends StatelessWidget {
  double percentage;
  String codinglanguage;
  AnimaitonLinearProgressIndicatior(
      {super.key, required this.percentage, required this.codinglanguage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: defaultPadding),
          child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: percentage),
              duration: defaultDuration,
              builder: (context, double value, child) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          codinglanguage,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          (value * 100).toInt().toString() + "%",
                        ),
                      ],
                    ),
                    LinearProgressIndicator(
                      value: value,
                      color: primaryColor,
                      backgroundColor: darkColor,
                    ),
                  ],
                );
              }),
        )
      ],
    );
  }
}

class KnowledgeText extends StatelessWidget {
  String text;
  KnowledgeText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          color: Color(0xFF40C9F0),
            "assets/icons/check.svg"),

        SizedBox(
          width: defaultPadding / 2,
        ),
        Text(
          text,
        )
      ],
    );
  }
}
