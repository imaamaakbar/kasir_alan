import 'package:flutter/material.dart';
import 'package:flutter_kasir/module/splash_screen/splash_screen_notifier.dart';
import 'package:flutter_kasir/utils/images_path.dart';
import 'package:provider/provider.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashScreenNotifier(context),
      child: Consumer<SplashScreenNotifier>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: Colors.black12,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 70,
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset(ImagePath.logo()),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
