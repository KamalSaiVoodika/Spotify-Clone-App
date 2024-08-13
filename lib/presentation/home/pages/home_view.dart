import 'package:avis/common/helpers/is_dark_mode.dart';
import 'package:avis/common/widgets/appbar/app_bar.dart';
import 'package:avis/core/config/assets/app_images.dart';
import 'package:avis/core/config/assets/app_vectors.dart';
import 'package:avis/core/config/theme/app_colors.dart';
import 'package:avis/presentation/home/widgets/news_songs_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              homeArtistCard(),
              tabs(),
              tabBarView(),
            ],
          ),
        ),
      ),
    );
  }
}

extension HomeViewExtension on HomeViewState {
  Widget homeArtistCard() {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.primary,
              ),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Album',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                      Text('Saahore Baahubali',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('Prabhas',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              AppImages.prabhasCutout,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }

  Widget tabs() {
    return TabBar(
      controller: tabController,
      unselectedLabelColor: AppColors.grey,
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      indicatorColor: AppColors.primary,
      tabs: const [
        Text(
          'News',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Text(
          'Videos',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Text(
          'Artists',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Text(
          'Podcasts',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget tabBarView() {
    return SizedBox(
      height: 200,
      child: TabBarView(
        children: [
          NewsSongsWidget(),
          Container(),
          Container(),
          Container(),
        ],
        controller: tabController,
      ),
    );
  }
}
