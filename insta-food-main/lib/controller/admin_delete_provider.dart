import 'package:firstproject/functions/admin_function.dart';
import 'package:flutter/material.dart';

class Adminprovider extends ChangeNotifier {
  DeleteAdmin deleteaddmin = DeleteAdmin();
  admindeleteprovider() {
    deleteaddmin.deleteall();
  }
}
