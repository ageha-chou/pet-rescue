
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double addHeight = 0.03;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      appBar: AppBar(

      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Form(//key for form
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: height * addHeight,
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10) ),
                child: GridTile(
                  child: Image.asset(
                    'assets/images/doctor_pic2.png',
                    width: 200,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: height * addHeight,
              ),
              TextFormField(
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  readOnly: true,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: "Full Name",
                    hintText: "Nguyen Xuan Mai Trinh",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty )
                           {
                      return "Enter your name";
                    } else {
                      return null;
                    }
                  }),
              SizedBox(
                height: height * addHeight,
              ),
              TextFormField(
                  autofocus: true,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Phone",
                    hintText: '0773 853 338',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter correct phone";
                    } else {
                      return null;
                    }
                  }),
              SizedBox(
                height: height * addHeight,
              ),
              TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Address",
                    hintText: '144 Duong Dinh Hoi, Thu Duc,\n Ho Chi Minh.',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty)
                    {
                      return "Enter correct address";
                    } else {
                      return null;
                    }
                  }),
              SizedBox(
                height: height * addHeight,
              ),
              TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Teacher",
                    hintText: 'Teacher',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty){
                      return "Enter your job";
                    } else {
                      return null;
                    }
                  }),
              SizedBox(
                height: height * addHeight,
              ),

              //combobox
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(5),
              //     border: Border.all(color: Colors.black, width: 4),
              //   ),
              //   child:  GetBuilder<ReferralController>(
              //     builder: (referralController){
              //       return  DropdownButtonHideUnderline(
              //         child: DropdownButton<String>(
              //           hint: Text('Please choose discount'),
              //           value: referralController.selectedValue == null ? "Please choose a voucher" : referralController.selectedValue,
              //           iconSize: 36,
              //           isExpanded: true,
              //           items: referralController.vouchers.map((e) => buildMenuItem(e)).toList(),
              //           onChanged: (selectedValue){
              //             referralController.relationShipStatus(selectedValue);
              //           },
              //         ),
              //       );
              //     }
              //   ),
              //
              //   ),


              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 30, bottom: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(250, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Save',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    onPressed: (){
                      if (_formKey.currentState!.validate()) {
                        //Check if form data are valid,
                        //your process atsk ahead if all data are valid
                        final snackBar = SnackBar(content: Text('Submit form'));
                        _scaffoldKey.currentState!.showSnackBar(snackBar);
                      }
                    },
                  ),
                ),

              ]),
            ]),
          ),
        ),
      ),
    );
  }
}
