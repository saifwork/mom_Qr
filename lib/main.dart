import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:mom_qr/testPage.dart';
import 'package:mom_qr/viewModel/FeedbackFormViewModel.dart';
import 'package:mom_qr/viewModel/HomePageViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  // Uri url = Uri.parse(html.window.location.href);
  // String? merchantId = url.queryParameters['userId'];
  String? merchantId = "100";

  print("Inside Main");

  print("--------------------------------------------");
  print(merchantId);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePageViewModel>(
          create: (_) => HomePageViewModel(),
        ),
        ChangeNotifierProvider<FeedbackFormViewModel>(
          create: (_) => FeedbackFormViewModel(merchantId: merchantId),
        ),
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TestPage(),
    );
  }
}
