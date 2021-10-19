import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/shared/widgets/app_logo.dart';

class ReportForm extends StatefulWidget {
  @override
  _ReportFormState createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
          leading: AppLogo(),
          title: Text('Report Abandoned Pet',
              style: Theme.of(context).appBarTheme.titleTextStyle),
          actions: [
            IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.clear,
                color: Colors.black,
              ),
            ),
          ]),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Row(
              children: [
                Text(
                  'Emergency case:',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(width: 5),
                Icon(
                  Icons.check_box,
                  color: Color(0xFF0A9396),
                )
              ],
            ),
            const SizedBox(height: 20),
            Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ThemeData().colorScheme.copyWith(
                      primary: Color(0xFF0A9396),
                    ),
              ),
              child: Container(
                height: 70,
                width: 100,
                padding: const EdgeInsets.only(
                  right: 10.0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFb5b0ac),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(children: [
                          const SizedBox(width: 20),
                          Icon(
                            FontAwesomeIcons.map,
                            color: Color(0xFFb5b0ac),
                            size: 30,
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Text(
                                '153 Nguyễn Thông, phường 9, quận 3, thành '
                                'phố Hồ Chí Minh.',
                                style: Theme.of(context).textTheme.headline6),
                          ),
                        ]),
                      ]),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 70,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFb5b0ac),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(children: [
                        const SizedBox(width: 20),
                        Icon(
                          FontAwesomeIcons.paw,
                          color: Color(0xFFb5b0ac),
                          size: 30,
                        ),
                        const SizedBox(width: 20),
                        Text('Cat',
                            style: Theme.of(context).textTheme.headline6),
                      ]),
                    ]),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 70,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFb5b0ac),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(children: [
                        const SizedBox(width: 20),
                        Icon(
                          FontAwesomeIcons.calculator,
                          color: Color(0xFFb5b0ac),
                          size: 30,
                        ),
                        const SizedBox(width: 25),
                        Text('2 cats',
                            style: Theme.of(context).textTheme.headline6),
                      ]),
                    ]),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 70,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFb5b0ac),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(children: [
                        const SizedBox(width: 20),
                        Icon(
                          FontAwesomeIcons.weight,
                          color: Color(0xFFb5b0ac),
                          size: 30,
                        ),
                        const SizedBox(width: 25),
                        Text('Under 2kg',
                            style: Theme.of(context).textTheme.headline6),
                      ]),
                    ]),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 70,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFb5b0ac),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(children: [
                        const SizedBox(width: 20),
                        Icon(
                          FontAwesomeIcons.notesMedical,
                          color: Color(0xFFb5b0ac),
                          size: 30,
                        ),
                        const SizedBox(width: 25),
                        Text('Bleeding',
                            style: Theme.of(context).textTheme.headline6),
                      ]),
                    ]),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 70,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFb5b0ac),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(children: [
                        const SizedBox(width: 20),
                        Icon(
                          FontAwesomeIcons.stickyNote,
                          color: Color(0xFFb5b0ac),
                          size: 30,
                        ),
                        const SizedBox(width: 25),
                        Text('No information',
                            style: Theme.of(context).textTheme.headline6),
                      ]),
                    ]),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10.0),
              height: 200,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFb5b0ac),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network('https://i.redd.it/8c6p67ikaoe71.jpg',
                                fit: BoxFit.cover, height: 100, width: 100),
                            const SizedBox(width: 20),
                            Image.network(
                                'https://www.hospitalveterinariglories'
                                '.com/wp-content/uploads/2019/04/Toxoplasmosis-en-gatos-676x449.jpeg',
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100),
                          ]),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
