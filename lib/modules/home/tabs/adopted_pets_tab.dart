import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/modules/adopted_pet/adopted_pet_list.dart';
import 'package:pet_rescue/modules/adopted_pet/tabs/adopted_pet_tabs_controller.dart';
import 'package:pet_rescue/modules/adopted_pet/tabs/pending_pets_list.dart';
import 'package:pet_rescue/shared/constants/color.dart';

class AdoptedPetsTab extends StatelessWidget {
  final _adoptedPetTabs = Get.find<AdoptedPetTabsController>();
  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        // _buildChipsRow(),
        _buildTabBar(context),
        _buildContent(context),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Expanded(
      child: Container(
        // height: MediaQuery.of(context).size.height * 0.75,
        child: TabBarView(
          controller: _adoptedPetTabs.controller,
          children: [
            AdoptedPetList(),
            PendingPetsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      child: Container(
        child: TabBar(
          isScrollable: true,
          unselectedLabelColor: ColorConstants.red,
          labelColor: Colors.black87,
          indicatorSize: TabBarIndicatorSize.label,
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          indicatorPadding: const EdgeInsets.symmetric(vertical: 5.0),
          indicator: BoxDecoration(
              gradient: LinearGradient(colors: [
                ColorConstants.primary,
                ColorConstants.primary.withOpacity(0.7)
              ]),
              borderRadius: BorderRadius.circular(50),
              color: ColorConstants.primary),
          controller: _adoptedPetTabs.controller,
          tabs: _adoptedPetTabs.adoptedPetTabs,
        ),
      ),
    );
  }
}
