import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:pet_rescue/modules/adopter_report/adopter_report_controller.dart';
import 'package:pet_rescue/modules/adopter_report/center_route.dart';
import 'package:pet_rescue/routes/app_pages.dart';
import 'package:pet_rescue/shared/constants/color.dart';

class AdopterReportScreen extends GetView<AdopterReportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Reported Pets'),
      ),
      body: Obx(
        () => Column(
          children: [
            IconStepper(
              scrollingDisabled: true,
              activeStepColor: ColorConstants.red,
              icons: [
                Icon(
                  FontAwesomeIcons.clock,
                  color: controller.currentStep.value == 0
                      ? Colors.white
                      : Color(0xFF4D6A6D),
                ),
                Icon(
                  Icons.location_on_outlined,
                  color: controller.currentStep.value == 1
                      ? Colors.white
                      : Color(0xFF4D6A6D),
                ),
                Icon(
                  FontAwesomeIcons.paw,
                  color: controller.currentStep.value == 2
                      ? Colors.white
                      : Color(0xFF4D6A6D),
                ),
              ],
              activeStep: controller.currentStep.value,
              onStepReached: (index) {
                controller.currentStep.value = index;
              },
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     _buildLabel(
            //       text: 'Waiting for volunteer',
            //       margin: 52,
            //       activeMargin: 55,
            //       currentStep: 0,
            //     ),
            //     _buildLabel(
            //       text: 'Give pet to volunteer',
            //       margin: 25,
            //       activeMargin: 22,
            //       currentStep: 1,
            //     ),
            //     _buildLabel(
            //       text: 'Reported pets',
            //       margin: 22,
            //       activeMargin: 18,
            //       currentStep: 2,
            //     ),
            //   ],
            // ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              margin: EdgeInsets.symmetric(
                horizontal: 25.0,
                vertical: 10.0,
              ),
              child: _buildContent(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel({
    required String text,
    double margin = 0,
    double activeMargin = 0,
    required int currentStep,
  }) {
    return Container(
      margin: EdgeInsets.only(
        left:
            controller.currentStep.value == currentStep ? activeMargin : margin,
      ),
      width: 80,
      child: Text(
        text,
        textAlign: TextAlign.center,
        softWrap: true,
        style: controller.currentStep.value == currentStep
            ? Theme.of(Get.context!).textTheme.headline6!.copyWith(
                  color: ColorConstants.red,
                )
            : Theme.of(Get.context!).textTheme.headline5,
      ),
    );
  }

  Widget _buildText(String text) {
    return Container(
      margin: const EdgeInsets.only(
        top: 5.0,
        bottom: 5.0,
      ),
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: Theme.of(Get.context!).textTheme.headline6!.copyWith(
              color: ColorConstants.red,
              fontSize: 26,
            ),
      ),
    );
  }

  _buildCancelDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Why do you want to cancel?',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: Text('Cancel',
                    style: Theme.of(context).textTheme.headline6),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Confirm',
                    style: Theme.of(context).textTheme.headline6),
              ),
            ],
            content: Obx(
              () {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Form(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DropdownButtonFormField<String>(
                          isExpanded: true,
                          items: controller.reasons.toList().cast(),
                          value: controller.selectedReasons.value == ""
                              ? null
                              : controller.selectedReasons.value,
                          decoration: InputDecoration(
                            label: Text('Reason'),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFb5b0ac)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF0A9396)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) {
                            controller.selectedReasons.value = value.toString();
                          },
                        ),
                        if (controller.selectedReasons.value ==
                            'Other reasons') ...[
                          const SizedBox(height: 15.0),
                          Theme(
                            data: Theme.of(Get.context!).copyWith(
                              colorScheme: ThemeData().colorScheme.copyWith(
                                    primary: Color(0xFF0A9396),
                                  ),
                            ),
                            child: TextFormField(
                              controller: controller.reasonController,
                              style: Theme.of(Get.context!).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Reason',
                                labelStyle:
                                    Theme.of(Get.context!).textTheme.headline6,
                                hintText: 'Your reason...',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFb5b0ac)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF0A9396)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        });
  }

  Widget _buildContent(BuildContext context) {
    switch (controller.currentStep.value) {
      case 0:
        return Container(
          child: Column(
            children: [
              _buildText('Waiting for volunteer'),
              Expanded(
                child: ListView(
                  children: [
                    _buildCard(
                      context,
                      onTapHandler: () => Get.toNamed(Routes.REPORT,
                          arguments: controller.report),
                      location: controller.report.location,
                      petType: controller.report.petType,
                      quantity: controller.report.quantity.toString(),
                      healthCondition: controller.report.healCondition,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      case 1:
        return Container(
          child: Column(
            children: [
              _buildText('Give pet to volunteer'),
              Expanded(
                child: ListView(
                  children: [
                    _buildCard(
                      context,
                      onTapHandler: () => Get.toNamed(Routes.VOLUNTEER_ROUTE),
                      location: controller.report.location,
                      petType: controller.report.petType,
                      quantity: controller.report.quantity.toString(),
                      healthCondition: controller.report.healCondition,
                      volunteer: _buildVolunteer(context,
                          volunteerName: 'Volunteer Name',
                          subTitle: '2km away'),
                      acceptWidget: Row(
                        children: [
                          Flexible(
                            child: Text(
                              'Please press \'Give to Volunteer\' when volunteer picks '
                              'these pets up',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 10.0,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                controller.currentStep++;
                              },
                              child: Text(
                                'Give to Volunteer',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    ColorConstants.red),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      case 2:
        return Container(
          child: Column(
            children: [
              _buildText('Reported pets'),
              Expanded(
                child: ListView(
                  children: [
                    _buildCard(
                      context,
                      location: controller.report.location,
                      petType: controller.report.petType,
                      quantity: controller.report.quantity.toString(),
                      healthCondition: controller.report.healCondition,
                      volunteer: _buildVolunteer(
                        context,
                        volunteerName: 'Volunteer Name',
                        subTitle: '2km to go to the Center',
                      ),
                      onTapHandler: () {
                        if (!controller.isCompleted.value) {
                          Get.to(() => CenterRoute());
                        }
                      },
                      acceptWidget: controller.isCompleted.value
                          ? Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: Text(
                                  'Your pet is safe',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                        color: Colors.green,
                                      ),
                                ),
                              ),
                            )
                          : Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    'Please press \'confirm\' to confirm volunteer '
                                    'brought pet to center',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 10.0,
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      controller.isCompleted.value = true;
                                    },
                                    child: Text(
                                      'Confirm',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              ColorConstants.red),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      default:
        return Container();
    }
  }

  Widget _buildCard(BuildContext context,
      {required String location,
      required String petType,
      required String quantity,
      required String healthCondition,
      Widget? volunteer,
      Widget? acceptWidget,
      VoidCallback? onTapHandler}) {
    return InkWell(
      onTap: onTapHandler,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5.0,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  if (volunteer == null) ...[
                    const SizedBox(height: 8),
                    ..._buildLocation(context, location),
                    _buildPopupMenu(context),
                  ],
                  // Spacer(),
                ],
              ),
              if (volunteer != null) ...[
                volunteer,
                Divider(),
              ],
              if (volunteer != null)
                Row(
                  children: _buildLocation(context, location),
                ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.paw,
                    size: 22,
                    color: ColorConstants.red,
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      petType,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    FontAwesomeIcons.calculator,
                    size: 22,
                    color: ColorConstants.red,
                  ),
                  const SizedBox(width: 5),
                  const SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      quantity,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.notesMedical,
                    size: 22,
                    color: ColorConstants.red,
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      healthCondition,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Spacer(),
                  if (controller.report.emergencyCase)
                    Container(
                      height: 40,
                      child: Chip(
                        backgroundColor: Colors.deepOrange,
                        label: Text(
                          'Emergency',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        avatar: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 5.0,
                          ),
                          child: Icon(
                            Icons.warning_amber_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              if (volunteer == null) ...[
                Divider(),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        'Volunteer:',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    const SizedBox(width: 10),
                    AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText('Finding...'),
                      ],
                      repeatForever: true,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        _buildCancelDialog(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 10.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          border: Border.all(color: Colors.black, width: 0.5),
                        ),
                        child: Text(
                          'Cancel',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              if (acceptWidget != null) ...[
                Divider(),
                acceptWidget,
              ]
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVolunteer(BuildContext context,
      {required volunteerName, required subTitle}) {
    return Row(
      children: [
        CircleAvatar(
          // child: Icon(Icons.person),
          backgroundImage: NetworkImage(
              'https://img.freepik.com/free-photo/friendly-smiling-woman-looking-pleased-front_176420-20779.jpg?size=626&ext=jpg&ga=GA1.2.1483557378.1620259200'),
          // backgroundColor: Theme.of(context).primaryColor,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              volunteerName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: ColorConstants.red,
                  ),
            ),
            Text(
              subTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
        Spacer(),
        _buildPopupMenu(context),
      ],
    );
  }

  Widget _buildPopupMenu(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        if (value == 0) {
          _buildCancelDialog(context);
        }
      },
      child: Container(
        height: 20,
        margin: EdgeInsets.only(
          left: 5,
        ),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: Image.asset('assets/images/kebab_menu.png'),
        ),
      ),
      itemBuilder: (ctx) => [
        PopupMenuItem(
          value: 0,
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildLocation(BuildContext context, String location) {
    return [
      Icon(
        Icons.location_pin,
        size: 22,
        color: ColorConstants.red,
      ),
      const SizedBox(width: 10),
      Flexible(
        child: Text(
          location,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    ];
  }
}
