import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ltcapp/features/registration/viewmodel/SignupRegViewModel.dart';
import 'package:ltcapp/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';

import 'package:ltcapp/features/registration/view/widgets/widgets.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltcapp/features/registration/model/individual_identity.dart';
import 'package:ltcapp/core/widgets/widgets.dart';
import 'package:ltcapp/core/utils/Validators.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import '../../../login/view/pages/WelcomePage.dart';

//TODO Validate all fields, implement viewmodel for all signup pages, and clean up code
class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ViewModelBuilder<RegistrationViewModel>.nonReactive(
        viewModelBuilder: () => RegistrationViewModel(),
        builder: (context, model, child) {
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
                color: Theme.of(context).backgroundColor,
              ),
              child: Stack(
                children: <Widget>[
                  Form(
                    key: model.signUpFormKey,
                    child: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                        ),
                        CircularLogo(),
                        SizedBox(
                          height: 30,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'LTC Registration',
                            style: GoogleFonts.openSans(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: darkTextColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Personal Data',
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: darkTextColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RegistrationTextField(
                          "Full Name",
                          Icons.perm_identity_rounded,
                          model.nameController,
                          validationAction: (String? input) => input!
                                  .isValidName()
                              ? null
                              : "Name cannot have numbers or special characters",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Consumer<RegistrationViewModel>(
                                builder: (context, vm, child) =>
                                    DropDownField<RankType?>(
                                        hint: "Rank",
                                        values: RankType.getValues(),
                                        value: vm.currentRankValue,
                                        icon: FontAwesomeIcons.certificate,
                                        onChanged: (value) =>
                                            vm.rankDropDownOnChanged(value!)),
                              ),
                            ),
                            Expanded(
                              child: RegistrationTextField(
                                "NRIC",
                                Icons.assessment,
                                model.nricController,
                                helperText: "Last 4 characters only",
                                validationAction: (String? input) =>
                                    input!.isValidNRIC()
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
                          model.emailController,
                          validationAction: (String? input) =>
                              input!.isValidEmail()
                                  ? null
                                  : "Enter valid email",
                        ),
                        RegistrationTextField(
                          "Username",
                          FontAwesomeIcons.user,
                          model.usernameController,
                          helperText: "Please input a username you'll remember",
                          maxLength: 24,
                        ),
                        RegistrationTextField(
                          "Password",
                          Icons.key,
                          model.passwordController,
                          isPassword: true,
                        ),
                        RegistrationTextField(
                          "Confirm Password",
                          Icons.key_outlined,
                          model.confirmPasswordController,
                          isPassword: true,
                          validationAction: (String? input) =>
                              model.confirmPasswordValidation(input),
                        ),
                        RegistrationTextField(
                          "Phone Number",
                          Icons.phone_android,
                          model.numberController,
                          validationAction: (String? input) =>
                              input!.isValidPhoneNumber()
                                  ? null
                                  : "Enter a valid number",
                        ),
                        DateTextField("Date of Enlistment",
                            FontAwesomeIcons.calendarAlt, model.doeController),
                        DateTextField("ORD Date", Icons.calendar_today,
                            model.ordController),
                        DateTextField("Date of posting", Icons.calendar_today,
                            model.dopController),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: RegistrationTextField(
                                "Class 3 Mileage",
                                Icons.assessment,
                                model.nricController,
                                validationAction: (String? input) =>
                                    input!.isValidNumber()
                                        ? null
                                        : "Numbers only",
                              ),
                            ),
                            Expanded(
                              child: RegistrationTextField(
                                "Class 4 Mileage",
                                Icons.assessment,
                                model.nricController,
                                validationAction: (String? input) =>
                                    input!.isValidNumber()
                                        ? null
                                        : "Numbers only",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Consumer<RegistrationViewModel>(
                          builder: (context, vm, child) =>
                              DropDownField<PESType?>(
                                  hint: "PES",
                                  values: PESType.getValues(),
                                  value: vm.currentPESValue,
                                  icon: Icons.fitness_center,
                                  onChanged: (value) =>
                                      vm.pesDropDownOnChanged(value!)),
                        ),
                        Consumer<RegistrationViewModel>(
                          builder: (context, vm, child) =>
                              DropDownField<VocationType?>(
                                  hint: "Vocation",
                                  values: VocationType.getValues(),
                                  value: vm.currentVocationValue,
                                  icon: FontAwesomeIcons.briefcase,
                                  onChanged: (value) =>
                                      vm.vocationDropDownOnChanged(value!)),
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
        });
  }

  Widget _submitButton() {
    return Consumer<RegistrationViewModel>(
      builder: (context, model, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: InkWell(
          onTap: () => model.signUpValidation(context),
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
