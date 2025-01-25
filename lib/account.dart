import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Widgets/calendar_cont.dart';
import 'Widgets/template_account.dart';
import 'controller/account_ctr.dart';
import 'helpers/theme_app.dart';

class Account extends StatefulWidget {
  final String accountName;
  const Account({super.key, required this.accountName});
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  AccountCtr controller = Get.put(AccountCtr());

  @override
  void initState() {
    super.initState();
    controller.getXAccount(accountName: widget.accountName);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.blue,
            title: Text(
              'حركة حساب',
              style: ThemeApp.styleSelected(color: Colors.white, size: 25.0),
            ),
          ),
          body: ListView(
            children: [
              search(),
              cardDesign(),
            ],
          ),
        ));
  }

  Widget cardDesign() {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.88,
        // color: Colors.amber,
        child: Obx(() {
          if (controller.loadData.value) {
            return const Center(
              child: Text('LodingData'),
            );
          } else if (controller.notFound.value) {
            return const Center(child: Text('noData'));
          } else if (controller.errorRequest.value) {
            return const Center(child: Text('eeror'));
          } else {
            return ListView.builder(
                itemCount: controller.account.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                      onTap: () => {},
                      child: TemplateAccount(
                        title: controller.account[index].description1!,
                        subtitle: controller.account[index].value!,
                        trailing: controller.account[index].date!,
                      ));
                }));
          }
        }));
  }

  search() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Color.fromARGB(255, 248, 247, 247),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        children: [
          Expanded(
            child: CalendarCont(
              from: true,
              function: (date, context) {
                controller.changeDateFrom(date.split(' ')[0]);
                controller.getXAccount(accountName: widget.accountName);
              },
            ),
          ),
          Expanded(
            child: CalendarCont(
              from: false,
              function: (date, context) {
                controller.changeDateTo(date.split(' ')[0]);
                controller.getXAccount(accountName: widget.accountName);
              },
            ),
          )
        ],
      ),
    );
  }
}
