import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/data/roles.dart';
import 'package:pet_rescue/data/tabs.dart';
import 'package:pet_rescue/models/user.dart';
import 'package:pet_rescue/modules/home/main_controller.dart';
import 'package:pet_rescue/routes/app_pages.dart';
import 'package:pet_rescue/shared/shared.dart';

class MainScreen extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Obx(() => _buildWidget(context)),
      onWillPop: () async => false,
    );
  }

  Widget _buildWidget(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildTab(controller.currentTab.value),
      bottomNavigationBar: BottomAppBar(
        // color: Color.fromRGBO(246, 225, 225, 1),
        color: Theme.of(context).colorScheme.secondary,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavButton(
                label: 'Home',
                index: 0,
                imageUrl: 'assets/images/home.png',
                onPressHandler: () {
                  controller.onSwitchTab(0);
                }),
            _buildNavButton(
                label: 'Adopted Pets',
                index: 1,
                imageUrl: 'assets/images/paw.png',
                onPressHandler: () {
                  controller.onSwitchTab(1);
                }),
            Spacer(),
            _buildNavButton(
                label: 'Notifications',
                index: 2,
                imageUrl: 'assets/images/notifications.png',
                onPressHandler: () {
                  controller.onSwitchTab(2);
                }),
            _buildNavButton(
                label: 'Me',
                index: 3,
                imageUrl: 'assets/images/person.png',
                onPressHandler: () {
                  controller.onSwitchTab(3);
                }),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: FittedBox(
          child: FloatingActionButton(
            elevation: 4,
            backgroundColor: const Color.fromRGBO(210, 88, 88, 0.8),
            child: Image.asset(
              'assets/images/sos.png',
              color: const Color.fromRGBO(255, 245, 238, 0.9),
              height: 45,
            ),
            onPressed: () async {
              var result = await Get.toNamed(Routes.REPORT);
              if (result != null) {
                Get.toNamed(Routes.ADOPTER_REPORT_LIST);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildAppBarTextButton({
    required BuildContext ctx,
    required String title,
    VoidCallback? onTapHandler,
  }) {
    return TextButton(
      onPressed: onTapHandler,
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.headline6,
      ),
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    User user = controller.user;
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      actions: [
        if (user.role == Roles.guest)
          Row(
            children: [
              _buildAppBarTextButton(
                  ctx: context, title: 'Sign In', onTapHandler: () {}),
              _buildAppBarTextButton(
                  ctx: context, title: 'Sign Up', onTapHandler: () {}),
            ],
          ),
      ],
      leading: AppLogo(),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (user.role != Roles.guest)
            Row(
              children: [
                CircleAvatar(
                  child: Icon(Icons.person),
                  foregroundColor: Color.fromRGBO(19, 44, 51, 1),
                ),
                SizedBox(width: 5),
                Text(
                  user.fullName,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildTab(MainTabs tab) {
    switch (tab) {
      case MainTabs.home:
        return controller.homeTab;
      case MainTabs.adoptedPets:
        return controller.adoptedPetsTab;
      case MainTabs.notifications:
        return controller.notificationsTab;
      case MainTabs.me:
        return controller.meTab;
      default:
        return controller.homeTab;
    }
  }

  Widget _buildNavButton(
      {required String label,
      required String imageUrl,
      required int index,
      VoidCallback? onPressHandler}) {
    return TextButton(
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: onPressHandler,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imageUrl,
            color: controller.isActiveTab(index)
                ? const Color.fromRGBO(19, 44, 51, 1)
                : const Color.fromRGBO(19, 44, 51, 0.45),
            height: controller.isActiveTab(index) ? 32 : 28,
          ),
          SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              color: controller.isActiveTab(index)
                  ? Colors.white70
                  : Colors.black26,
              fontSize: controller.isActiveTab(index) ? 13 : 12,
            ),
          ),
        ],
      ),
    );
  }
}
