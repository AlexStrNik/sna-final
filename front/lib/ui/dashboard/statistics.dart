import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:front/providers/dashboard_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final random = Random();

class Statistics extends HookConsumerWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedValue1 = useState('No builds');
    final stats = ref.watch(projectStatsProvider);
    return stats.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Text(
        'No build info found. $err',
        style: TextStyle(color: Colors.white),
      ),
      data: (data) => Container(
        padding: EdgeInsets.all(
          30,
        ),
        color: const Color(0xFFCCD7E2),
        child: Column(children: [
          Row(children: [
            Text(
              'Statistics'.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.black),
            ),
            const Spacer(),
            SizedBox(
                height: 40,
                width: 140,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    buttonHeight: 40,
                    buttonWidth: 140,
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    isExpanded: true,
                    hint: Text(
                      selectedValue1.value,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    iconSize: 30,
                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    items: ['All classes', 'Unit', 'Lib']
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      selectedValue1.value = value.toString();
                    },
                  ),
                )),
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: PieChart(
              dataMap: data.languages,
              animationDuration: Duration(milliseconds: 800),
              chartLegendSpacing: 32,
              chartRadius: MediaQuery.of(context).size.width / 3.2,
              colorList: List<Color>.generate(
                  data.languages.length,
                  (_) => Color.fromRGBO(
                        random.nextInt(256),
                        random.nextInt(256),
                        random.nextInt(256),
                        1,
                      )),
              initialAngleInDegree: 0,
              chartType: ChartType.disc,
              ringStrokeWidth: 32,
              centerText: "Tech Stack",
              legendOptions: LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.right,
                showLegends: true,
                legendShape: BoxShape.circle,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: true,
                showChartValues: true,
                showChartValuesInPercentage: false,
                showChartValuesOutside: false,
                decimalPlaces: 1,
              ),
              // gradientList: ---To add gradient colors---
              // emptyColorGradient: ---Empty Color gradient---
            ),
          )
        ]),
      ),
    );
  }
}
