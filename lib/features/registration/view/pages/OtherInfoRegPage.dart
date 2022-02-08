import 'package:flutter/material.dart';
import 'package:ltcapp/features/registration/viewmodel/OtherRegViewModel.dart';
import 'package:ltcapp/features/registration/viewmodel/SignupRegViewModel.dart';
import 'package:ltcapp/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:ltcapp/features/registration/view/widgets/widgets.dart';
import 'package:ltcapp/core/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import '../../../login/view/pages/WelcomePage.dart';
import '../../../../main.dart';


class OtherInfoRegistrationPage extends StatelessWidget {
  OtherInfoRegistrationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ViewModelBuilder<OtherRegViewModel>.reactive(
      viewModelBuilder: () => OtherRegViewModel(),
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
                  key: model.otherRegFormKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      CircularLogo(),
                      SizedBox(
                        height: 30,
                      ),
                      _title(context),
                      SizedBox(
                        height: 50,
                      ),
                      RegistrationTextField("Hobbies", FontAwesomeIcons.paintBrush,
                          model.hobbiesController),
                      RegistrationTextField("Civilian License",
                          FontAwesomeIcons.idCardAlt, model.civilianLicenseController),
                      RegistrationTextField("License No.",
                          FontAwesomeIcons.idCard, model.civilianLicenseNoController),
                      DateTextField(
                          "License Date of Issue",
                          FontAwesomeIcons.calendarAlt,
                          model.civilianLicenseDOIController),
                      SizedBox(
                        height: 20,
                      ),
                      _submitButton(context, model),
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

    );
  }

  Widget _title(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Other Info',
        style: GoogleFonts.openSans(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Color(0xffffffff),
        ),
      ),
    );
  }

  Widget _submitButton(BuildContext context, OtherRegViewModel model) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: InkWell(
        onTap: () => model.otherSignUpValidation(context),
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
    );
  }
}
