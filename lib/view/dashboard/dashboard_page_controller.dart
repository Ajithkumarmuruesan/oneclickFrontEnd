import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smart_website_creater/model/buisness_registration_model.dart';
import 'package:smart_website_creater/sevices/apiservices.dart';
import 'package:dio/src/form_data.dart' as FormData1;
import 'package:dio/src/multipart_file.dart' as MP1;

class DashboardViewController extends GetxController {
  BusinessRegistrationModel? businessRegistrationModel;
  TextEditingController buisnessNameController = TextEditingController();
  TextEditingController buisnesstypeController = TextEditingController();
  TextEditingController cou8ntryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController webController = TextEditingController();
  TextEditingController currentAddressController = TextEditingController();
  Map<String, dynamic> post = {};

  Rx<File?> image = Rx<File?>(null);

  void showPickerBottomSheet(
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Take a Photo'),
                onTap: () {
                  pickImageFromCamera();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from Gallery'),
                onTap: () {
                  pickImageFromGallery();
                  if (context != null) {
                    Navigator.pop(context); // Close the bottom sheet
                  }
                },
              ),
              image.value != null
                  ? ListTile(
                      leading: Icon(Icons.delete),
                      title: Text('Delete Photo'),
                      onTap: () {
                        deleteImage();
                        Get.back();
                      },
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      image.value = File(pickedImage.path);
    }
    update();
  }

  Future<void> pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      image.value = File(pickedImage.path);
    }
    update();
    Get.back();
  }

  void deleteImage() {
    if (image.value != null) {
      image.value!.deleteSync();
      image.value = null;
    }
    update();
  }

  Future<void> requestLocationPermission(BuildContext context) async {
    var status = await Permission.location.request();

    if (status == PermissionStatus.granted) {
      await getCurrentAddress();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Location permission is required to get your address.'),
      ));
      openAppSettings();
      print('Location permission denied');
    }
  }

  Future<void> getCurrentAddress() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      String formattedAddress = '';
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        formattedAddress =
            '${placemark.street}, ${placemark.locality}, ${placemark.country}';
      } else {
        formattedAddress = 'Address not found';
      }

      currentAddressController.text = formattedAddress;
    } catch (e) {
      print('Error getting location: $e');
    }
    update();
  }

  Future buisnessRegistration() async {
    try {
      post = {
        "address": addressController.text,
        "businessdesc": descController.text,
        "businessmail": emailController.text,
        "businessname": buisnessNameController.text,
        "businesstype": buisnesstypeController.text,
        "businessweb": webController.text,
        "city": cityController.text,
        "country": cou8ntryController.text,
        "currentaddress": currentAddressController.text,
        "postalcode": pincodeController.text,
        "state": stateController.text,
        "mobile": mobileController.text,
      };
      if (image.value != null) {
        String filename = image.value!.path.split('/').last;
        post['image'] = await MP1.MultipartFile.fromFile(image.value!.path,
            filename: filename);
      }
      var formData = FormData1.FormData.fromMap(post);
      final res = await Apiservice().businessRegistration(formData);
      // if (res) {
      //   Get
      // }
    } catch (e) {}
  }
}
