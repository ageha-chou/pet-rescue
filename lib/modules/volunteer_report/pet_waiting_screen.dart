import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:pet_rescue/modules/volunteer_report/volunteer_report_controller.dart';
import 'package:pet_rescue/routes/app_pages.dart';
import 'package:pet_rescue/shared/constants/color.dart';

class WaitingPetScreen extends GetView<VolunteerReportController> {
  final volunteerController = Get.put(VolunteerReportController());
  // final adopterController = Get.find<AdopterReportController>();
  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Reported Pets'),
      ),
      body: Obx(
        () => new SingleChildScrollView(
          child: Column(
            children: [
              IconStepper(
                activeStepColor: const Color.fromRGBO(210, 88, 88, 0.8),
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

  Widget _buildContent(BuildContext context) {
    switch (controller.currentStep.value) {
      case 0:
        return Container(
          child: Column(
            children: [
              _buildText('On the way'),
              Expanded(
                child: ListView(
                  children: [
                    _buildCard(
                      context,
                      //Chổ này thêm bản đồ
                      onTapHandler: () => Get.toNamed(Routes.REPORTER_ROUTE),
                      location: controller.report.location,
                      petType: controller.report.petType,
                      quantity: controller.report.quantity.toString(),
                      healthCondition: controller.report.healCondition,
                      acceptWidget: Row(
                        children: [
                          Flexible(
                            child: Text(
                              'Give us the reason after press \'Cancel\' button',
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
                                showAlertDialog(context);
                              },
                              child: Text(
                                'Cancel',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(ColorConstants.red),
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
      case 1:
        return Column(
          children: [
            _buildText('Checking the pet...'),
            Expanded(
              child: ListView(
                children: [
                  _buildCard(
                    context,
                    location: controller.report.location,
                    petType: controller.report.petType,
                    quantity: controller.report.quantity.toString(),
                    healthCondition: controller.report.healCondition,
                    volunteer: _buildVolunteer(context,
                        volunteerName: 'Reporter Name', subTitle: '2km away'),
                    acceptWidget: Row(
                      children: [
                        Flexible(
                          child: Text(
                            'Please press \'Pick the pet\' when you \'ve arrived.',
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
                              'Pick the Pet',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(ColorConstants.red),
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
        );
      case 2:
        return Column(
          children: [
            _buildText('The rescuing pet is on the way back...'),
            Expanded(
              child: ListView(
                children: [
                  _buildCard(
                    context,
                    onTapHandler: () => Get.toNamed(Routes.REPORTER_ROUTE),
                    location: controller.report.location,
                    petType: controller.report.petType,
                    quantity: controller.report.quantity.toString(),
                    healthCondition: controller.report.healCondition,
                    volunteer: _buildVolunteer(
                      context,
                      volunteerName: 'Reporter Name',
                      subTitle: '2km to go to the Center',
                    ),
                    acceptWidget: Row(
                      children: [
                        Flexible(
                          child: Text(
                            'After giving the pet to the shelter, please press \'Done\' to exit. ',
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
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  Routes.HOME, (Route<dynamic> route) => false);
                            },
                            child: Text(
                              'Done',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(ColorConstants.red),
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
                    _buildPopupMenu(),
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
                    AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText('On the way...'),
                      ],
                      repeatForever: true,
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
          backgroundImage: AssetImage('assets/images/user_avatar.jpg'),
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
        _buildPopupMenu(),
      ],
    );
  }

  Widget _buildPopupMenu() {
    return PopupMenuButton(
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
        const PopupMenuItem(
          child: Text('Cancel'),
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

  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel the report"),
      onPressed:  () {
        Navigator.of(context).pop();
        _displayTextInputDialog(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert from the Pet Rescue"),
      content: Text("Are you sure to cancel this report ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Your reason'),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Ex: I accidently click on \'accept\' report."),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                print(_textFieldController.text);
                Navigator.of(context).pushNamedAndRemoveUntil(
                    Routes.HOME, (Route<dynamic> route) => false);
              },
            ),
          ],
        );
      },
    );
  }

}

