import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/StartButton.dart';
import '../utils/config/responsive.dart';
import '../utils/config/size_config.dart';
import '../utils/style/colors.dart';
import '../utils/style/style.dart';
import '../viewModel/HomePageViewModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Consumer<HomePageViewModel>(
          builder: (context, _vm, child) {
            return Row(
              children: [
                if(Responsive.isTablet(context) || Responsive.isDesktop(context) )
                Expanded(
                  flex: 5,
                  child: Container(
                    color: AppColors.primaryBg,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 300,
                            child: Image.asset('assets/images/homePageBanner.jpg')),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 2.5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryText(
                              text: "Review The Merchant\nAnd Earn",
                              fontWeight: FontWeight.w900,
                              size: 25,
                              maxLine: 2,
                            ),
                            PrimaryText(
                              text:
                              "Complete the form to access\na professional quality,\nfully customization template for \nyour countinued use.",
                              fontWeight: FontWeight.normal,
                              size: 14,
                              color: AppColors.secondaryText,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 2,
                        ),
                        StartButtun(),
                      ],
                    ),
                  ),
                ),
                if(Responsive.isTablet(context) || Responsive.isDesktop(context) )
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Responsive.isMobile(context) ? SizeConfig.blockSizeHorizontal! * 2 :  MediaQuery.of(context).size.width * 0.08, vertical: SizeConfig.blockSizeVertical! * 5),
                    color: AppColors.secondaryBg,
                    child: PageView.builder(
                      itemCount: _vm.pages.length,
                      controller: _vm.pageController,
                      itemBuilder: (BuildContext context, int index) {
                        return _vm.pages[_vm.currentIndex];
                      },
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
