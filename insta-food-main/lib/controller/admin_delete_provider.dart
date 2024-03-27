import 'package:firstproject/service/admin_function.dart';
import 'package:flutter/material.dart';

class Adminprovider extends ChangeNotifier {
  DeleteAdmin deleteaddmin = DeleteAdmin();
  admindeleteprovider() {
    deleteaddmin.deleteAll();
  }
}
