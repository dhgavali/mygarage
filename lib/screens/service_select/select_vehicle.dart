import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/screens/service_select/widgets/select_fuel_widget.dart';
import 'package:bee/screens/service_select/widgets/select_model_widget.dart';
import 'package:flutter/material.dart';

import '../../global_widgets/search_bar.dart';
import 'widgets/select_brand_widget.dart';

class VechicleBrandModel extends StatefulWidget {
  const VechicleBrandModel({Key? key}) : super(key: key);

  @override
  State<VechicleBrandModel> createState() => _VechicleBrandModelState();
}

class _VechicleBrandModelState extends State<VechicleBrandModel>
    with TickerProviderStateMixin {
  late TabController _tabController;
  // static final _tabKey = new GlobalKey<_VechicleBrandModelState>();
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MyAppBar(title: "Select Vehicle"),
      body: Column(
        children: [
          SearchBar(height: _height, width: _width),
          Container(
            child: TabBar(
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.black,
              indicatorColor: Theme.of(context).primaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              controller: _tabController,
              tabs: [
                Tab(
                  text: "Brand",
                ),
                Tab(
                  text: "Model",
                ),
                Tab(
                  text: "Fule",
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.transparent,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SelectBrandListWidget(height: _height, ctrl: _tabController),
                SelectModelListWidget(ctrl: _tabController, height: _height),
                Align(
                  alignment: Alignment.topCenter,
                  child: SelectFuelWidget(height: _width, width: _width),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
