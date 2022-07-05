import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/global_widgets/search_bar.dart';
import 'package:bee/screens/menu_pages/blog_details.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/utils/constants.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class BlogsPage extends StatelessWidget {
  final List<String> _images = [
    "assets/images/blog1.png",
    "assets/images/blog2.png",
    "assets/images/blog1.png",
    "assets/images/blog1.png",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.red,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Load More",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          drawer: MyDrawer(),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    CustomAppBar(height: height, width: width),
                    AppBar(
                      backgroundColor: Colors.white,
                      title: Text(
                        "Blogs",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      centerTitle: true,
                      elevation: 0.0,
                      leading: MyBackButton(),
                    ),
                  ],
                ),
                Divider(
                  height: height * 0.01,
                  color: Colors.transparent,
                ),
                SearchBar(
                  height: height,
                  width: width,
                  hint: "Search Blogs here",
                ),
                Divider(
                  height: height * 0.01,
                  color: Colors.transparent,
                ),
                ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: height * 0.2,
                      maxWidth: width,
                      minHeight: height * 0.17,
                    ),
                    child: Swiper(
                      axisDirection: AxisDirection.left,
                      // containerWidth: width * 0.75,
                      itemCount: 4,
                      viewportFraction: 0.7,
                      scale: 0.95,
                      index: 0,
                      pagination: SwiperPagination(
                          builder: SwiperPagination.dots,
                          alignment: Alignment.bottomCenter,
                          margin: EdgeInsets.only(top: 10)),
                      itemBuilder: (ctx, ind) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                        child: Image(
                          image: AssetImage(
                            _images[ind],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                BlogTabs(),
              ],
            ),
          )),
    );
  }
}

class AllBlogsPage extends StatelessWidget {
  const AllBlogsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        BlogBox(
          onpress: () {
            pushNewScreen(
              context,
              screen: BlogDetailsPage(
                  title:
                      "This Is How Often You Need To Change Your Transmission Fluid",
                  description:
                      "There is a lot of work done by the engine for your vehicle. Your car work done by the engine for your vehicle",
                  image: "assets/images/blog3.png"),
            );
          },
          title: "This Is How Often You Need To Change Your Transmission Fluid",
          description:
              "There is a lot of work done by the engine for your vehicle. Your car work done by the engine for your vehicle",
          image: "assets/images/blog3.png",
        ),
        BlogBox(
          onpress: () {
            pushNewScreen(
              context,
              screen: BlogDetailsPage(
                  title:
                      "This Is How Often You Need To Change Your Transmission Fluid",
                  description:
                      "There is a lot of work done by the engine for your vehicle. Your car work done by the engine for your vehicle",
                  image: "assets/images/blog3.png"),
            );
          },
          title: "This Is How Often You Need To Change Your Transmission Fluid",
          description:
              "There is a lot of work done by the engine for your vehicle. Your car work done by the engine for your vehicle",
          image: "assets/images/blog3.png",
        ),
      ],
    );
  }
}

class BlogTabs extends StatefulWidget {
  @override
  State<BlogTabs> createState() => _BlogTabsState();
}

class _BlogTabsState extends State<BlogTabs> with TickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    _controller = new TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BubbleTabIndicator(
              indicatorHeight: 25.0,
              indicatorColor: Colors.red,
              indicatorRadius: 5,
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
            ),
            controller: _controller,
            unselectedLabelColor: Colors.black,
            labelColor: Colors.white,
            onTap: (index) {
              print(index);
            },
            tabs: [
              Tab(
                child: Text(
                  "Trending",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Tab(
                  height: 25,
                  child: Text(
                    "Engine Oil",
                    style: TextStyle(fontSize: 12),
                  )),
              Tab(
                  child: Text(
                "Recent",
                style: TextStyle(fontSize: 12),
              )),
              Tab(
                  child: Text(
                "Custom Services",
                style: TextStyle(fontSize: 12),
              )),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: TabBarView(
            controller: _controller,
            physics: const BouncingScrollPhysics(),
            children: [
              Column(
                children: [
                  AllBlogsPage(),
                  AllBlogsPage(),
                ],
              ),
              Column(
                children: [
                  AllBlogsPage(),
                  AllBlogsPage(),
                ],
              ),
              Column(
                children: [
                  AllBlogsPage(),
                  AllBlogsPage(),
                ],
              ),
              Column(
                children: [
                  AllBlogsPage(),
                  AllBlogsPage(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BlogBox extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final Function() onpress;

  const BlogBox({
    required this.title,
    required this.description,
    required this.image,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onpress,
      child: Container(
        width: width * 0.48,
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: Container(
          padding: EdgeInsets.only(
            bottom: 5,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.withOpacity(
                0.3,
              ),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image(
                  image: AssetImage(image),
                  height: width * 0.25,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Consts.titleText3(
                  text: title,
                  color: Colors.red,
                  minfsize: 12,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 5,
                  right: 5,
                  bottom: 8,
                ),
                child: AutoSizeText(
                  description,
                  overflow: TextOverflow.ellipsis,
                  minFontSize: 10,
                  maxFontSize: 12,
                  maxLines: 2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
