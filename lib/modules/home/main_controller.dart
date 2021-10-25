import 'package:get/get.dart';
import 'package:pet_rescue/data/roles.dart';
import 'package:pet_rescue/data/tabs.dart';
import 'package:pet_rescue/models/user.dart';
import 'package:pet_rescue/modules/home/tabs/adopted_pets_tab.dart';
import 'package:pet_rescue/modules/home/tabs/home_tab.dart';
import 'package:pet_rescue/modules/home/tabs/me_tab.dart';
import 'package:pet_rescue/modules/home/tabs/notifications_tab.dart';

class MainController extends GetxController {
  var currentTab = MainTabs.home.obs;

  late HomeTab homeTab;
  late AdoptedPetsTab adoptedPetsTab;
  late NotificationsTab notificationsTab;
  late MeTab meTab;

  late User user;

  @override
  void onInit() {
    super.onInit();

    homeTab = HomeTab();
    adoptedPetsTab = AdoptedPetsTab();
    notificationsTab = NotificationsTab();
    meTab = MeTab();

    user = User(
      fullName: 'Nguyễn Xuân Mai Trinh',
      password: '12345678',
      phone: '0123456798',
      // role: Roles.adopter,
      role: Roles.volunteer,
    );
  }

  void onSwitchTab(int index) {
    var tab = _getCurrentTab(index);
    currentTab.value = tab;
  }

  bool isActiveTab(int index) {
    return currentTab.value == _getCurrentTab(index);
  }

  int getCurrentIndex(MainTabs tab) {
    switch (tab) {
      case MainTabs.home:
        return 0;
      case MainTabs.adoptedPets:
        return 1;
      case MainTabs.notifications:
        return 2;
      case MainTabs.me:
        return 3;
    }
  }

  MainTabs _getCurrentTab(int index) {
    switch (index) {
      case 0:
        return MainTabs.home;
      case 1:
        return MainTabs.adoptedPets;
      case 2:
        return MainTabs.notifications;
      case 3:
        return MainTabs.me;
      default:
        return MainTabs.home;
    }
  }

  String get roleText {
    switch (user.role) {
      case Roles.guest:
        return "Guest";
      case Roles.adopter:
        return "Adopter";
      case Roles.volunteer:
        return "Volunteer";
      default:
        return "Guest";
    }
  }
}
