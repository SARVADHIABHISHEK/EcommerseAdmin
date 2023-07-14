import 'package:ecommerse_admin/src/admin/constant/color.dart';
import 'package:ecommerse_admin/src/admin/constant/enum.dart';
import 'package:ecommerse_admin/src/admin/constant/text.dart';
import 'package:ecommerse_admin/src/admin/utils/charts/chartsutils.dart';
import 'package:ecommerse_admin/src/admin/utils/localizaion/multi_language.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class VenderSalesReport extends StatefulWidget {
  const VenderSalesReport({Key? key}) : super(key: key);

  @override
  State<VenderSalesReport> createState() => _VenderSalesReportState();
}

class _VenderSalesReportState extends State<VenderSalesReport> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 7,
      child: Container(
        constraints: const BoxConstraints(minHeight: 465),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ConstText.lightText(
              text: languageModel.eCommerceAdmin.monthlyReport,
              fontWeight: FontWeight.bold,
            ),
            FxBox.h24,
            _dateAndPrice(),
            FxBox.h40,
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 240,
              // child: _chart(),
              child: getChart(ChartType.piaChart),
            ),
            // FxBox.h24,
            // ListView.separated(
            //   separatorBuilder: (context, index) {
            //     return Divider(
            //       height: 1,
            //       color: ColorConst.grey800.withOpacity(0.2),
            //     );
            //   },
            //   shrinkWrap: true,
            //   itemCount: _chartList.length,
            //   itemBuilder: (context, index) {
            //     return _chartValue(
            //       bedgeTitle: _chartList[index]['bedgeTitle'],
            //       badgeColor: _chartList[index]['badgeColor'],
            //       title: _chartList[index]['title'],
            //       percentage: _chartList[index]['percentage'],
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  Widget _dateAndPrice() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'November 01 - November 30',
          softWrap: true,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        // Text(
        //   '\$${2730}',
        //   softWrap: true,
        //   style: TextStyle(
        //     fontSize: 16,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
      ],
    );
  }

  // Widget _chartValue({
  //   required String bedgeTitle,
  //   required Color badgeColor,
  //   required String title,
  //   required String percentage,
  // }) {
  //   return Column(
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.all(10.0),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             FxBadge(
  //               text: bedgeTitle,
  //               radius: 4,
  //               color: badgeColor,
  //             ),
  //             Text(
  //               title,
  //               softWrap: true,
  //               style: const TextStyle(
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.w600,
  //               ),
  //             ),
  //             Text(
  //               percentage,
  //               softWrap: true,
  //               style: const TextStyle(
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.w600,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget _chart() {
  //   return PieChart(
  //     PieChartData(
  //       centerSpaceRadius: 80,
  //       sections: showingSections(),
  //     ),
  //   );
  // }
}
