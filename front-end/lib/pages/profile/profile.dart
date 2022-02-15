import 'package:flutter/material.dart';
import 'package:frontend/pages/profile/customer_profile.dart';
import 'package:frontend/pages/profile/login.dart';
import 'package:frontend/pages/profile/merchant_profile.dart';
import 'package:frontend/utils/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  List<Widget> _pageList = [
    CustomerProfile(),
    MerchantProfile(),
    Login(),
  ];

  late int _loginStat = -1;

  _updateLoginState() async {
    int res = await SPUtil.getLoginState();
    setState(() {
      _loginStat = res;
    });
  }

  @override
  void initState() {
    super.initState();
    _updateLoginState();
  }

  @override
  Widget build(BuildContext context) {
    if (_loginStat == 0) {
      return CustomerProfile();
    }
    else if (_loginStat == 1) {
      return MerchantProfile();
    }
    else {
      return Login();
    }
  }
}


