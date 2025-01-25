import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../controller/charcts_ctr.dart';
import 'Widgets/error_data.dart';
import 'Widgets/loading.dart';
import 'Widgets/menu_bar_drawer.dart';
import 'Widgets/not_data.dart';
import 'helpers/theme_app.dart';
import 'model/gdp_data_model.dart';

class Charcts extends StatefulWidget {
  const Charcts({
    Key? key,
  }) : super(key: key);

  @override
  State<Charcts> createState() => _CharctsState();
}

class _CharctsState extends State<Charcts> {
  CharctsCtr controller = Get.put(CharctsCtr());
  //TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    controller.charData != null ? controller.charData!.clear() : {};
    controller.loadPage();
    controller.getCharcts();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
            child: Scaffold(
                drawer: const MenuBarDrawer(),
                appBar: AppBar(
                    elevation: 0,
                    centerTitle: true,
                    backgroundColor: Colors.blue,
                    title: Text(
                      'إحصائية الخزائن ',
                      style: ThemeApp.styleSelected(
                          color: Colors.white, size: 20.0),
                    )),
                body: Obx(() {
                  if (controller.loadData.value) {
                    return const Loading();
                  } else if (controller.notFound.value) {
                    return const NotData();
                  } else if (controller.errorRequest.value) {
                    return const ErrorData(
                      fromHome: true,
                    );
                  } else {
                    return SfCircularChart(
                      // backgroundColor: Colors.amber,
                      title: ChartTitle(
                        text: 'تحليل القيود بأنواعها',
                        textStyle: ThemeApp.styleSelected(
                            color: const Color.fromARGB(255, 112, 170, 218),
                            size: 20.0),
                      ),
                      legend: Legend(
                        isVisible: true,
                        overflowMode: LegendItemOverflowMode.wrap,
                        iconHeight: 30,
                        iconWidth: 30,
                      ),
                      //tooltipBehavior: _tooltipBehavior,
                      series: <CircularSeries>[
                        DoughnutSeries<GDPDataModel, String>(
                            dataSource: controller.charData,
                            xValueMapper: (GDPDataModel data, _) =>
                                data.continet,
                            yValueMapper: (GDPDataModel data, _) => data.gdp,
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: true),
                            enableTooltip: true)
                      ],
                    );
                  }
                }))));
  }
}
