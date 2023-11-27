import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:smart_website_creater/shared/screen_size.dart';
import 'package:smart_website_creater/view/dashboard/dashboard_page_controller.dart';

import '../../../shared/app_colors.dart';

class BusinessWidget {
  String? selectedValue;
  Widget mobileBusinessWidget(BuildContext context) {
    return GetBuilder<DashboardViewController>(builder: (controller) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CREATE BUSINESS PROFILE',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text('Start Building Your'),
            Text('Business Profile'),
            SizedBox(
              height: 20,
            ),
            Container(
              width: Screen.width(context) / 1.3,
              child: TextFormField(
                controller: controller.buisnessNameController,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelText: 'Business Name',
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200]),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: Screen.width(context) / 1.3,
              // padding: EdgeInsets.all(10),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  labelText: 'Select Option',
                  labelStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                value: selectedValue,
                onChanged: (newValue) {
                  controller.buisnesstypeController.text = newValue.toString();
                  // Handle dropdown value changes here

                  selectedValue = newValue;
                },
                items: ['Ecommerce', 'Retail', 'Entertainment']
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      );
    });
  }

  Widget locationContact(BuildContext context) {
    return GetBuilder<DashboardViewController>(builder: (controller) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ADD BUSINESS lOCATION',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: Screen.width(context) / 1.3,
              // padding: EdgeInsets.all(10),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  labelText: 'Select Country',
                  labelStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                value: selectedValue,
                onChanged: (newValue) {
                  controller.cou8ntryController.text = newValue.toString();
                  // Handle dropdown value changes here

                  selectedValue = newValue;
                },
                items: ['India', 'China', 'Pakistan']
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: Screen.width(context) / 1.3,
              // padding: EdgeInsets.all(10),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  labelText: 'State',
                  labelStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                value: selectedValue,
                onChanged: (newValue) {
                  // Handle dropdown value changes here
                  controller.stateController.text = newValue.toString();

                  selectedValue = newValue;
                },
                items: ['TamilNadu', 'Pondycheri', 'kerala']
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: Screen.width(context) / 1.3,
              child: TextFormField(
                controller: controller.cityController,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelText: 'City',
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200]),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: Screen.width(context) / 1.3,
              child: TextFormField(
                controller: controller.pincodeController,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelText: 'PinCode',
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200]),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: Screen.width(context) / 1.3,
              child: TextFormField(
                controller: controller.addressController,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelText: 'Address Line',
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200]),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: Screen.width(context) / 1.3,
              child: TextFormField(
                controller: controller.mobileController,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelText: 'Mobile Number',
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200]),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget googleLocationWidget(BuildContext context) {
    return GetBuilder<DashboardViewController>(builder: (controller) {
      return Container(
        child: Column(
          children: [
            Text(
              'PIN YOUR BUSINESS LOCATION',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text('Add Map Location'),
            Text('For Your Business'),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                EasyLoading.instance
                  ..displayDuration = const Duration(milliseconds: 1500)
                  ..loadingStyle = EasyLoadingStyle.light
                  ..indicatorType = EasyLoadingIndicatorType.wave
                  ..maskType = EasyLoadingMaskType.clear
                  ..userInteractions = false;
                EasyLoading.show();
                await controller.requestLocationPermission(context);
                EasyLoading.dismiss();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                        'https://heera.it/wp-content/uploads/2011/11/google-maps-new-interface1.jpg')),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25)),
              ),
            ),
            Text(controller.currentAddressController.text)
          ],
        ),
      );
    });
  }

  Widget businessDescription(BuildContext context) {
    return GetBuilder<DashboardViewController>(builder: (controller) {
      return Container(
        child: Column(
          children: [
            Text(
              'ENTER YOUR BUSINESS DESCRIPTION',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text('Provide an Overview of the'),
            Text('buisness, This description provides'),
            Text('extensive details outining the business'),
            SizedBox(
              height: 20,
            ),
            Container(
              width: Screen.width(context) / 1.3,
              child: TextFormField(
                maxLines: 7,
                controller: controller.descController,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    hintText:
                        'Enter Your business overview for about page\n descriptin',
                    hintStyle: TextStyle(fontSize: 12),
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200]),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: Screen.width(context) / 1.3,
              child: TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelText: 'Email ID',
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200]),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: Screen.width(context) / 1.3,
              child: TextFormField(
                controller: controller.webController,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelText: 'Exisiting WebSite URL (Optional)',
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200]),
              ),
            )
          ],
        ),
      );
    });
  }

  Widget addImageForBusiness(BuildContext context) {
    return GetBuilder<DashboardViewController>(builder: (controller) {
      return Container(
        child: Column(children: [
          Text(
            'ADD PHOTOS OF YOUR BUSINESS',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
              "Business photos creatge your customer's first\nimpression of your company. The best\nphotos send a message to customers about\nthe  company's value, create brand loyality\n and sign a more professional appereance. "),
          SizedBox(
            height: 5,
          ),
          Text('Upload logo for your buisness the'),
          Text('websites is effective and creative'),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              controller.showPickerBottomSheet(context);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              primary: themeColor,
              padding: EdgeInsets.symmetric(
                  vertical: 5, horizontal: Screen.width(context) / 7),
              elevation: 5.0,
            ),
            child: Text('Upload Logo'),
          ),
          controller.image.value != null
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 30),
                  child: ClipRRect(child: Image.file(controller.image.value!)))
              : Container()
        ]),
      );
    });
  }

  Widget publish(BuildContext context) {
    return GetBuilder<DashboardViewController>(builder: (controller) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'PUBLISH',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Text('EASILY IN MINUTES',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Text('Create a Website for Your Business'),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () async {
                EasyLoading.instance
                  ..displayDuration = const Duration(milliseconds: 1500)
                  ..loadingStyle = EasyLoadingStyle.light
                  ..indicatorType = EasyLoadingIndicatorType.wave
                  ..maskType = EasyLoadingMaskType.clear
                  ..userInteractions = false;
                EasyLoading.show();
                await controller.buisnessRegistration();
                EasyLoading.dismiss();
                Get.toNamed('/complete');
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                primary: themeColor,
                padding: EdgeInsets.symmetric(
                    vertical: 5, horizontal: Screen.width(context) / 7),
                elevation: 5.0,
              ),
              child: Text('Publish'),
            ),
          ],
        ),
      );
    });
  }
}
