import 'package:flutter/material.dart';
import 'package:neumorphic_bank_expenses_ui/components/arrowbutton.dart';
import 'package:neumorphic_bank_expenses_ui/config/colors.dart';
import 'package:neumorphic_bank_expenses_ui/config/size.dart';
import 'package:neumorphic_bank_expenses_ui/config/strings.dart';
import 'package:neumorphic_bank_expenses_ui/piechart/piechart.dart';

class ExpensesWidget extends StatefulWidget {
  @override
  _ExpensesWidgetState createState() => _ExpensesWidgetState();
}

class _ExpensesWidgetState extends State<ExpensesWidget> {
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    double fontSize(double size) {
      return size * width / 414;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: height / 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: width / 20),
                  child: Text(
                    "Monthly Expenses",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: fontSize(20)),
                  )),
              Container(
                width: width / 2.5,
                margin: EdgeInsets.only(right: width / 30),
                child: Row(
                  children: <Widget>[
                    ArrowButton(
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    Padding(padding: EdgeInsets.only(left: width / 50)),
                    ArrowButton(
                      icon: Icon(Icons.arrow_forward_ios),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: category.map((data) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: width / 20, vertical: height / 90),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: AppColors
                                      .pieColors[category.indexOf(data)],
                                  shape: BoxShape.circle),
                            ),
                            Text(
                              data['name'],
                              style: TextStyle(
                                fontSize: fontSize(16),
                              ),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.only(right: width / 30),
                  child: PieChart(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}