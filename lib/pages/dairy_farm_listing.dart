// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:getx_practice/pages/milk_list_model.dart';
import 'package:getx_practice/pages/size_config.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class DairyFarmListing extends StatefulWidget {
  const DairyFarmListing({Key? key}) : super(key: key);

  @override
  State<DairyFarmListing> createState() => _DairyFarmListingState();
}

class _DairyFarmListingState extends State<DairyFarmListing> {
  bool isShow = false;
  var settingTime = DateFormat('MMM-yyyy').format(DateTime.now());

  DateTime selectedDate = DateTime.now();

  late String _monthPick;
  @override
  void initState() {
    super.initState();
    _monthPick = settingTime.toString();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: 100 * SizeConfig.heightMultiplier,
          width: 100 * SizeConfig.widthMultiplier,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                child: Padding(
                  padding: EdgeInsets.all(3 * SizeConfig.heightMultiplier),
                  child: Row(
                    children: [
                      Container(
                        height: 6 * SizeConfig.heightMultiplier,
                        width: 70 * SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                                spreadRadius: 1),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2 * SizeConfig.widthMultiplier),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: 'Search Here....',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 2 * SizeConfig.widthMultiplier),
                        height: 6 * SizeConfig.heightMultiplier,
                        width: 13 * SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isShow = !isShow;
                              print(isShow);
                            });
                          },
                          icon: const Icon(Icons.filter_alt_outlined,
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 80 * SizeConfig.heightMultiplier,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 3 * SizeConfig.heightMultiplier),
                  child: ListView.builder(
                    itemCount: mlist.length,
                    itemBuilder: (BuildContext context, int index) {
                      MilkListModel showData = mlist[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 7 * SizeConfig.widthMultiplier,
                            vertical: .7 * SizeConfig.heightMultiplier),
                        child: Container(
                          height: 8 * SizeConfig.heightMultiplier,
                          width: 85 * SizeConfig.widthMultiplier,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  spreadRadius: 1),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3 * SizeConfig.widthMultiplier,
                                vertical: .7 * SizeConfig.heightMultiplier),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tag Id: ${showData.id}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                    height: 1 * SizeConfig.heightMultiplier),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      showData.milk.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(color: Colors.grey),
                                    ),
                                    const Spacer(),
                                    Icon(Icons.date_range,
                                        color: Colors.grey,
                                        size: 2 * SizeConfig.heightMultiplier),
                                    SizedBox(
                                        width: 2 * SizeConfig.widthMultiplier),
                                    Text(
                                      showData.date,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              isShow
                  ? Positioned(
                      top: 10 * SizeConfig.heightMultiplier,
                      right: 3 * SizeConfig.widthMultiplier,
                      child: Container(
                        height: 13 * SizeConfig.heightMultiplier,
                        width: 25 * SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                _selectDate(context);
                              },
                              child: Text('By date',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(color: Colors.grey)),
                            ),
                            TextButton(
                              onPressed: () {
                                showMonthPicker(
                                  context: context,
                                  firstDate:
                                      DateTime(DateTime.now().year, -1, 5),
                                  lastDate:
                                      DateTime(DateTime.now().year + 1, 9),
                                  initialDate: selectedDate,
                                ).then((date) {
                                  if (date != null) {
                                    setState(() {
                                      _monthPick =
                                          DateFormat('MMM-yyyy').format(date);
                                    });
                                  }
                                });
                              },
                              child: Text('By month',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(color: Colors.grey)),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
