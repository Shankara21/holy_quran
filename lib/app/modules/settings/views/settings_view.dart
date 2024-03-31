import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holy_quran/app/config/themes.dart';
import 'package:holy_quran/app/data/models/city.dart';
import 'package:holy_quran/app/data/models/province.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    controller.getAllProvince();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Settings',
              style: titleStyle.copyWith(
                fontSize: 22,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          ListTile(
            onTap: () {
              _showUsernameDialog(context);
            },
            title: Text('Username', style: primaryTextStyle),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
          Obx(
            () => SwitchListTile(
              activeColor: appBlue,
              activeTrackColor: appBlue.withOpacity(0.5),
              inactiveThumbColor: appGray,
              inactiveTrackColor: appGray.withOpacity(0.2),
              title: Text(
                'Dark Mode',
                style: primaryTextStyle,
              ),
              value: controller.isDark.value,
              onChanged: (value) {
                controller.changeTheme();
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
          ListTile(
            onTap: () {
              _showLocationDialog(context);
            },
            title: Text('Location', style: primaryTextStyle),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
          ListTile(
            onTap: () {
              _showUsernameDialog(context);
            },
            title: Text('Audio', style: primaryTextStyle),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
          Spacer(), // Spacer untuk menempatkan row ke bagian bawah
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Developed by', style: secondaryTextStyle),
                  const SizedBox(width: 5),
                  Text(
                    'Muhammad Lazuardi Timur',
                    style: primaryTextStyle.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showUsernameDialog(BuildContext context) {
    Get.defaultDialog(
      backgroundColor:
          controller.isDark.isTrue ? Colors.grey[900] : Colors.white,
      buttonColor: appBlue,
      title: 'Username',
      middleText: 'Enter your username',
      content: TextField(
        controller: controller.usernameController,
        decoration: const InputDecoration(
          hintText: 'Username',
        ),
      ),
      textCancel: 'Cancel',
      textConfirm: 'Confirm',
      onConfirm: () {
        controller.saveUsername();
      },
    );
  }

  void _showLocationDialog(BuildContext context) {
    Get.defaultDialog(
      title: "Your Location",
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _dropdownProvince('Province'),
            Obx(() {
              if (controller.cities.isNotEmpty) {
                return _dropdownCity('City');
              } else {
                return const SizedBox();
              }
            })
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back();
            controller.cities.clear();
          },
          child: Text(
            "Tutup",
            style: secondaryTextStyle,
          ),
        ),
      ],
    );
  }

  Widget _dropdownProvince(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: primaryTextStyle),
          const SizedBox(height: 8),
          DropdownButtonFormField<Province>(
            isExpanded: true,
            items: controller.provinces.map((province) {
              return DropdownMenuItem<Province>(
                value: province,
                child: Text(
                    province.name), // Assuming Province has a 'name' property
              );
            }).toList(),
            onChanged: (Province? selectedProvince) {
              if (selectedProvince != null) {
                controller.getCities(selectedProvince.id);
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: 'Select $label',
            ),
          ),
        ],
      ),
    );
  }

  Widget _dropdownCity(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: primaryTextStyle),
          const SizedBox(height: 8),
          DropdownButtonFormField<City>(
            isExpanded: true,
            items: controller.cities.map((city) {
              return DropdownMenuItem<City>(
                value: city,
                child: Text(city.name),
              );
            }).toList(),
            onChanged: (City? selectedCity) {
              if (selectedCity != null) {
                Map<String, dynamic> selectedCityData = {
                  "coordinate": {
                    "latitude": selectedCity.coordinate.latitude,
                    "longitude": selectedCity.coordinate.longitude
                  },
                  "id": selectedCity.id,
                  "name": selectedCity.name,
                  "slug": selectedCity.slug,
                  "provinceId": selectedCity.provinceId
                };
                controller.saveLocation(selectedCityData);
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: 'Select $label',
            ),
          ),
        ],
      ),
    );
  }
}
