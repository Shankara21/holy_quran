import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holy_quran/app/config/themes.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Settings Page',
              style: titleStyle.copyWith(
                fontSize: 22,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
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
}
