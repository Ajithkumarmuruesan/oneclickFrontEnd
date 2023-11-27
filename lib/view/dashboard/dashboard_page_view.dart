import 'package:flutter/material.dart';
import 'package:smart_website_creater/shared/app_colors.dart';
import 'package:smart_website_creater/shared/screen_size.dart';
import 'package:smart_website_creater/view/dashboard/widgets/business_widget.dart';

class BusinessRegistrationScreen extends StatefulWidget {
  @override
  _BusinessRegistrationScreenState createState() =>
      _BusinessRegistrationScreenState();
}

class _BusinessRegistrationScreenState
    extends State<BusinessRegistrationScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: Screen.height(context),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                themeColor.withOpacity(0.6),
                Colors.white.withOpacity(0.5),
                Colors.white,
                Colors.white,
                Colors.white
              ],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    RegistrationStep(
                      step: 1,
                      imageURL:
                          'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FBP.png?alt=media&token=691c22f3-68af-4df3-a66c-97d23e551355',
                      title: 'Business Profile',
                      child: BusinessWidget().mobileBusinessWidget(context),
                    ),
                    RegistrationStep(
                      step: 2,
                      imageURL:
                          'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2Finfo.png?alt=media&token=574c6342-3ccd-4d9b-91ea-937844c9229c',
                      title: 'Location & Contact Info',
                      child: BusinessWidget().locationContact(context),
                    ),
                    RegistrationStep(
                      step: 3,
                      imageURL:
                          'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FGL.png?alt=media&token=9f42df4f-44dd-4395-81b6-5f1c38257596',
                      title: 'Google Location',
                      child: BusinessWidget().googleLocationWidget(context),
                    ),
                    RegistrationStep(
                      step: 4,
                      imageURL:
                          'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FBD.png?alt=media&token=88d7acab-112e-47e1-b6b6-9b7c0f94b91a',
                      title: 'Add Business Description',
                      child: BusinessWidget().businessDescription(context),
                    ),
                    RegistrationStep(
                      step: 5,
                      imageURL:
                          'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FBI.png?alt=media&token=0d982904-2abe-4d03-811c-10364404ef8b',
                      title: 'Add Business Images',
                      child: BusinessWidget().addImageForBusiness(context),
                    ),
                    RegistrationStep(
                      step: 6,
                      imageURL:
                          'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2Fpub.png?alt=media&token=36a32f5b-6b53-428c-97f9-3210dc5cc22c',
                      title: 'Publish',
                      child: BusinessWidget().publish(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegistrationStep extends StatelessWidget {
  final int step;
  final Widget child;
  final String imageURL;
  final String title;

  RegistrationStep(
      {required this.step,
      required this.child,
      required this.imageURL,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          // padding: EdgeInsets.symmetric(vertical: 10 ),
          height: Screen.height(context) / 1.05,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 38.0,
                    backgroundImage: NetworkImage(imageURL),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    title.toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: themeColor),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: themeColor)),
                    child: LinearProgressIndicator(
                      minHeight: 12,
                      backgroundColor: themeColor,
                      value: (step + 1) / 7,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                ),
              ),
              // Text(
              //   'Step $step',
              //   style: TextStyle(fontSize: 24.0),
              // ),
              // SizedBox(height: 16.0),

              Container(height: Screen.height(context) / 2.13, child: child),
              // Spacer(),
              Container(
                height: Screen.height(context) / 5.2,
                padding: EdgeInsets.all(5),
                // color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2Fimg1.png?alt=media&token=8aa401b4-5635-451f-af67-3dcd82117797'),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        step != 1
                            ? Image.network(
                                'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2FLefi.png?alt=media&token=6ce0a918-d370-46ac-8569-13be12e85940')
                            : Container(),
                        SizedBox(
                          width: 3,
                        ),
                        Text('SWIPE'),
                        SizedBox(
                          width: 3,
                        ),
                        Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2FRight.png?alt=media&token=6f429db7-33c2-4063-865b-f0f8417a4acc'),
                      ],
                    ),
                    Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2Fimg2.png?alt=media&token=b8fcb386-3ab4-4f9c-bece-bc3be039c5e5'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
