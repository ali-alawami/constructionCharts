import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/theme_app.dart';
import 'dialog_content.dart';

class TemplateAccount extends StatefulWidget {
  final String title, subtitle, trailing;
  const TemplateAccount({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.trailing,
  }) : super(key: key);
  @override
  State<TemplateAccount> createState() => _TemplateAccountState();
}

class _TemplateAccountState extends State<TemplateAccount> {
  final DialogContent controller = Get.put(DialogContent());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      height: MediaQuery.of(context).size.height * 0.10,
      //MediaQuery.of(context).size.height <= Setting.sizeJ7
      // ? MediaQuery.of(context).size.height * 0.23
      //  : MediaQuery.of(context).size.height * 0.10,
      decoration: const BoxDecoration(
        // color: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      child: Card(
        child: ListTile(
          title: Text(
            widget.title,
            style: ThemeApp.styleSelected(color: Colors.black, size: 16.0),
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            widget.subtitle,
            style: ThemeApp.styleSelected(color: Colors.black, size: 12.0),
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            widget.trailing,
            style: ThemeApp.styleUnSelected(color: Colors.black, size: 12.0),
          ),
          onTap: () => {
            controller.openAndCloseDialogContent(
              context: context,
              content: widget.title,
            ),
          },
        ),
      ),
    );
  }
}
