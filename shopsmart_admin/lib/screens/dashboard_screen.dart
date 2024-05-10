import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_admin_en/models/dashboard_button_model.dart';
import 'package:shopsmart_admin_en/widgets/dashboard_buttons.dart';
import '../providers/theme_provider.dart';
import '../services/assets_manager.dart';
import '../widgets/title_text.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/DashboardScreen';
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const TitlesTextWidget(label: "Dashboard Screen"),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetsManager.shoppingCart),
          ),
          actions: [
            IconButton(
              onPressed: () {
                themeProvider.setDarkTheme(
                    themeValue: !themeProvider.getIsDarkTheme);
              },
              icon: Icon(themeProvider.getIsDarkTheme
                  ? Icons.light_mode
                  : Icons.dark_mode),
            ),
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
              DashboardButtonsModel.dashboardButtonList(context).length,
              (index) => DashboardButtonsWidget(
                    text: DashboardButtonsModel.dashboardButtonList(context)[index].text,
                    imagePath: DashboardButtonsModel.dashboardButtonList(context)[index].imagePath,
                    onPressed: DashboardButtonsModel.dashboardButtonList(context)[index].onPressed,
                  )),
        ));
  }
}
