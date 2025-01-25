import 'package:constructioncharts/extension/extension_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Widgets/text_field_theme.dart';
import 'charts.dart';
import 'helpers/setting.dart';
import 'helpers/theme_app.dart';
import 'main.dart';

class LogIn extends StatefulWidget {
  final String? phone, password;
  final bool? create;
  const LogIn({Key? key, this.phone, this.password, this.create})
      : super(key: key);
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  void initState() {
    super.initState();
    if (widget.create == true) {
      phone.text = widget.phone!;
      password.text = widget.password!;
    }
  }

  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Form(
          key: formState,
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height <= Setting.sizeJ7
                    ? MediaQuery.of(context).size.height * 0.06
                    : MediaQuery.of(context).size.height * 0.30,
              ),
              img(),
              data(),
              button(),
            ],
          ),
        ),
      ),
    );
  }

  img() {
    return SizedBox(
      //  color: Colors.black,
      height: MediaQuery.of(context).size.height * 0.30,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Center(
          child: CircleAvatar(
            radius: 100.0,
            backgroundImage: AssetImage('img'.png),
          ),
        ),
      ),
    );
  }

  data() {
    return SizedBox(
      height: MediaQuery.of(context).size.height <= Setting.sizeJ7
          ? MediaQuery.of(context).size.height * 0.20
          : MediaQuery.of(context).size.height * 0.22,
      // color: Colors.green,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFieldTheme(
                    //   keyboardType: TextInputType.name,
                    fillColor: Colors.white,
                    text: 'اسم المستخدم',
                    controller: password)),
            const SizedBox(
              height: 10,
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFieldTheme(
                    //   keyboardType: TextInputType.name,
                    fillColor: Colors.white,
                    text: 'كلمة المرور',
                    controller: phone)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }

  button() {
    return SizedBox(
        height: MediaQuery.of(context).size.height <= Setting.sizeJ7
            ? MediaQuery.of(context).size.height * 0.20
            : MediaQuery.of(context).size.height * 0.12,
        // color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              // color: Colors.red,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                onPressed: () {
                  if (phone.text == 'AB1337*' && password.text == '1') {
                    sharedPref.setString('id', Setting.userID.toString());
                    Get.to(const Charcts());
                  }
                },
                child: Text(
                  '  تسجيل دخول',
                  style:
                      ThemeApp.styleSelected(color: Colors.white, size: 18.0),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height <= Setting.sizeJ7
                  ? MediaQuery.of(context).size.height * 0.01
                  : MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ));
  }
}
