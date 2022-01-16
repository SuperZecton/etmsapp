import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ltcapp/features/registration/viewmodel/RegistrationViewModel.dart';
import 'package:ltcapp/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/globals.dart';

import 'package:ltcapp/features/registration/view/widgets/widgets.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltcapp/features/registration/model/individual_identity.dart';
import 'package:ltcapp/utils/extensions.dart';
import 'package:ltcapp/core/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../../../login/view/pages/WelcomePage.dart';

//TODO Validate all fields, implement viewmodel for all signup pages, and clean up code
class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<RegistrationViewModel>(context, listen: false);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          color: primaryColor,
        ),
        child: Stack(
          children: <Widget>[
            Form(
              key: vm.signUpFormKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  CircularLogo(),
                  SizedBox(
                    height: 30,
                  ),
                  _title(),
                  SizedBox(
                    height: 50,
                  ),
                  _personalDataTitle(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: RegistrationTextField(
                          "Full Name",
                          Icons.perm_identity_rounded,
                          vm.nameController,
                          validationAction: (String input) => input
                                  .isValidName()
                              ? null
                              : "Name cannot have numbers or special characters",
                        ),
                      ),
                      Expanded(
                        child: RegistrationTextField(
                          "NRIC",
                          Icons.assessment,
                          vm.nricController,
                          helperText: "Last 4 characters only",
                          validationAction: (String input) =>
                              input.isValidNRIC()
                                  ? null
                                  : "Enter last 4 characters only",
                          maxLength: 4,
                        ),
                      ),
                    ],
                  ),
                  RegistrationTextField(
                    "Email Address",
                    Icons.alternate_email,
                    vm.emailController,
                    validationAction: (String input) =>
                        input.isValidEmail() ? null : "Enter valid email",
                  ),
                  RegistrationTextField(
                    "Username",
                    FontAwesomeIcons.user,
                    vm.usernameController,
                    helperText: "Please input a username you'll remember",
                  ),
                  RegistrationTextField(
                    "Password",
                    FontAwesomeIcons.key,
                    vm.passwordController,
                    isPassword: true,
                  ),
                  RegistrationTextField(
                      "Home Address", Icons.home, vm.addressController,
                      helperText: "Blk No, Street, Floor, Postal Code"),
                  RegistrationTextField(
                    "Phone Number",
                    Icons.phone_android,
                    vm.numberController,
                    validationAction: (String input) =>
                        input.isValidPhoneNumber()
                            ? null
                            : "Enter a valid number",
                  ),
                  RegistrationTextField(
                    "Home Number",
                    Icons.phone,
                    vm.homeNumberController,
                    validationAction: (String input) =>
                        input.isValidPhoneNumber()
                            ? null
                            : "Enter a valid number",
                  ),
                  DateTextField("Date of Birth", FontAwesomeIcons.calendar,
                      vm.dobController),
                  DateTextField("Date of Enlistment",
                      FontAwesomeIcons.calendarAlt, vm.doeController),
                  DateTextField(
                      "ORD Date", Icons.calendar_today, vm.ordController),
                  DateTextField("Date of posting", Icons.calendar_today,
                      vm.dopController),
                  Consumer<RegistrationViewModel>(
                    builder: (context, vm, child) => DropDownField<PESType>(
                        hint: "PES",
                        values: PESType.getValues(),
                        value: vm.currentPESValue,
                        icon: Icons.fitness_center,
                        onChanged: (value) => vm.pesDropDownOnChanged(value)),
                  ),
                  Consumer<RegistrationViewModel>(
                    builder: (context, vm, child) => DropDownField<RaceType>(
                        hint: "Race",
                        values: RaceType.getValues(),
                        value: vm.currentRaceValue,
                        icon: Icons.recent_actors,
                        onChanged: (value) => vm.raceDropDownOnChanged(value)),
                  ),
                  Consumer<RegistrationViewModel>(
                    builder: (context, vm, child) =>
                        DropDownField<ReligionType>(
                            hint: "Religion",
                            values: ReligionType.getValues(),
                            value: vm.currentReligionValue,
                            icon: FontAwesomeIcons.syringe,
                            onChanged: (value) =>
                                vm.religionDropDownOnChanged(value)),
                  ),
                  Consumer<RegistrationViewModel>(
                    builder: (context, vm, child) => DropDownField<BloodType>(
                        hint: "Blood Group",
                        values: BloodType.getValues(),
                        value: vm.currentBloodValue,
                        icon: Icons.fitness_center,
                        onChanged: (value) => vm.bloodDropDownOnChanged(value)),
                  ),
                  RegistrationTextField("Drug Allergy",
                      FontAwesomeIcons.tablets, vm.drugAllergyController),
                  RegistrationTextField("Food Allergy",
                      FontAwesomeIcons.hamburger, vm.foodAllergyController),
                  Consumer<RegistrationViewModel>(
                    builder: (context, vm, child) =>
                        DropDownField<VocationType>(
                            hint: "Vocation",
                            values: VocationType.getValues(),
                            value: vm.currentVocationValue,
                            icon: FontAwesomeIcons.briefcase,
                            onChanged: (value) =>
                                vm.vocationDropDownOnChanged(value)),
                  ),
                  RegistrationTextField(
                      "Medical Condition",
                      FontAwesomeIcons.hospitalUser,
                      vm.medicalConditionController),
                  SizedBox(height: 20),
                  _nokTitle(),
                  SizedBox(height: 20),
                  RegistrationTextField(
                    "Next of Kin Name",
                    FontAwesomeIcons.userFriends,
                    vm.nokController,
                    validationAction: (String input) => input.isValidName()
                        ? null
                        : "Name cannot have numbers or special characters",
                  ),
                  RegistrationTextField(
                    "Next of Kin Address",
                    FontAwesomeIcons.addressBook,
                    vm.nokAddressController,
                    helperText: "Blk No, Street, Floor, Postal Code",
                  ),
                  RegistrationTextField(
                    "Next of Kin Number",
                    FontAwesomeIcons.phone,
                    vm.nokNumberController,
                    validationAction: (String input) =>
                        input.isValidPhoneNumber()
                            ? null
                            : "Enter a valid number",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _submitButton(),
                  SizedBox(height: height * .14),
                ],
              ),
            ),
            Positioned(top: 40, left: 0, child: TopBackButton()),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'LTC Registration',
        style: GoogleFonts.openSans(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Color(0xffffffff),
        ),
      ),
    );
  }

  Widget _personalDataTitle() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Personal Data',
        style: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Color(0xffffffff),
        ),
      ),
    );
  }

  Widget _nokTitle() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Next of Kin',
        style: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Color(0xffffffff),
        ),
      ),
    );
  }

  Widget _submitButton() {
    final viewModel =
        Provider.of<RegistrationViewModel>(context, listen: false);
    return Consumer<RegistrationViewModel>(
      builder: (context, vm, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: InkWell(
          onTap: () => viewModel.signUpValidation(context),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            padding: EdgeInsets.symmetric(vertical: 13),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.blue,
            ),
            child: Text(
              'Next page',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
