

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class CheckStatusViewModel extends BaseViewModel {

 void backPush(BuildContext context){
   Navigator.pushNamed(context, '/afterLogin');
 }

}