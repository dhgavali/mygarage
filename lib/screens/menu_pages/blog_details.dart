import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/global_widgets/search_bar.dart';
import 'package:bee/screens/menu_pages/blogs.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/utils/constants.dart';
import 'package:flutter/material.dart';

class BlogDetailsPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const BlogDetailsPage({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          drawer: MyDrawer(),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
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
                  Container(
                    width: width,
                    height: height * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image(
                      image: AssetImage(
                        "assets/images/blog1.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: Consts.titleText2(
                            text:
                                "This Is How Often You Need To Change Your Transmission Fluid",
                            color: Colors.red,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.access_time_filled,
                                size: 14,
                                color: Colors.grey,
                              ),
                              AutoSizeText(
                                "April, 26 2020",
                                minFontSize: 8,
                                maxFontSize: 10,
                              ),
                              Icon(
                                Icons.person,
                                size: 14,
                                color: Colors.grey,
                              ),
                              AutoSizeText(
                                "Dummy",
                                minFontSize: 8,
                                maxFontSize: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  dashLine(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: Consts.titleText3(
                          text:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim Lorem ipsum dolor sit amet, consectetur adipiscing elit upiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim  Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim Lorem ipsum dolor sit amet, consectetur adipiscing elit upiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim Lorem ipsum dolor sit amet, consectetur adipiscing elit upiscing elit ut aliquam, purus sit amet luctus \n venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim Lorem ipsum dolor sit amet, consectetur adipiscing elit upiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim Lorem ipsum dolor sit amet, consectetur adipiscing elit upiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim Lorem ipsum dolor sit amet, consectetur adipiscing elit upiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim ")),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Consts.titleText(text: "Related Blogs"),
                  ),
                  AllBlogsPage(),
                ],
              ),
            ),
          )),
    );
  }
}
