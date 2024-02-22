import 'package:flutter/material.dart';
import 'package:shopsmart_user/providers/theme_provider.dart';
import 'package:shopsmart_user/screens/root_screen.dart';
import 'consts/theme_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_){
          return ThemeProvider();})
  ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child){  
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Styles.themeData(isDarkTheme:themeProvider.getIsDarkTheme,context:context),
          home:  const RootScreen(),
           );}), 
  
    );
  }
}
