import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ltcapp/features/registration/viewmodel/SignupRegViewModel.dart';
import 'package:ltcapp/features/registration/viewmodel/TrainingRegViewModel.dart';
import 'package:ltcapp/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:ltcapp/features/registration/view/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltcapp/core/utils/extensions.dart';
import 'package:ltcapp/core/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import '../../../login/view/pages/WelcomePage.dart';

class TrainingRegistrationPage extends StatelessWidget {
  TrainingRegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ViewModelBuilder<TrainingRegViewModel>.reactive(
      viewModelBuilder: () => TrainingRegViewModel(),
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
              color: primaryColor,
            ),
            child: Stack(
              children: <Widget>[
                /*Positioned(
                top: -MediaQuery.of(context).size.height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: BezierContainer(),
              ),*/ //TODO: Make this nicer

                Form(
                  key: model.trainingRegFormKey,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: RegistrationTextField(
                              "Training Frame",
                              Icons.perm_identity_rounded,
                              model.trgFrameController,
                              validationAction: (String? input) =>
                                  input!.isValidFrame()
                                      ? null
                                      : "Example: 359A",
                              maxLength: 4,
                            ),
                          ),
                          Expanded(
                            child: DateTextField(
                              "Training Period",
                              Icons.calendar_today_sharp,
                              model.trgPeriodController,
                            ),
                          ),
                        ],
                      ),
                      RegistrationTextField(
                          "No. of attempts",
                          Icons.format_list_numbered_sharp,
                          model.noAttemptsController,
                          validationAction: (String? input) =>
                              input!.isValidAttempt() ? null : "Numbers only"),
                      RegistrationTextField(
                          "Military License",
                          FontAwesomeIcons.idCard,
                          model.militaryLicenseController),
                      RegistrationTextField(
                          "Military License Type",
                          FontAwesomeIcons.addressCard,
                          model.militaryLicenseTypeController),
                      DateTextField("Date of Issue",
                          Icons.calendar_today_outlined, model.doiController),
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
      },
    );
  }

  Widget _title(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Training Info',
        style: GoogleFonts.openSans(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Color(0xffffffff),
        ),
      ),
    );
  }

  Widget _submitButton(BuildContext context, TrainingRegViewModel model) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: InkWell(
        onTap: () => model.trainingSignUpValidation(context),
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
