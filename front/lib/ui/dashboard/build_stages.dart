import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:front/providers/dashboard_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BuildStages extends HookConsumerWidget {
  const BuildStages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedValue2 = useState('Filter by');
    final stages = ref.watch(stagesProvider);
    return stages.when(data: (stages) {
      return Container(
        color: Colors.white,
        padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * 0.05,
          top: 30,
          left: 30,
          bottom: 30,
        ),
        child: ListView(
          children: [
            Row(
              children: [
                Text(
                  'Build stages'.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.black),
                ),
                const Spacer(),
                SizedBox(
                  height: 40,
                  width: 100,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      hint: Text(
                        'Select Item',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: ['Filter by']
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
                      value: selectedValue2.value,
                      onChanged: (value) {
                        selectedValue2.value = value as String;
                      },
                      buttonHeight: 40,
                      buttonWidth: 80,
                      itemHeight: 40,
                    ),
                  ),
                ),
              ],
            ),
            DataTable(
              columns: <DataColumn>[
                DataColumn(
                  label: Text(
                    '#id',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.black),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Name',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.black),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Status',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.black),
                  ),
                ),
              ],
              rows: <DataRow>[
                ...stages
                    .map(
                      (e) => DataRow(
                        cells: <DataCell>[
                          DataCell(Text(e.id.toString())),
                          DataCell(Text(e.name)),
                          DataCell(Text(e.status)),
                        ],
                      ),
                    )
                    .toList(),
              ],
            )
          ],
        ),
      );
    }, error: (Object e, StackTrace? stack) {
      return Center(
          child: Text('ничего нету $e', style: TextStyle(color: Colors.white)));
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    });
  }
}
