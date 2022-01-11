import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intesasoft_demo/app/base/base_view.dart';
import 'package:intesasoft_demo/app/components/custom_appbar.dart';
import 'package:intesasoft_demo/app/components/custom_drawer.dart';
import 'package:intesasoft_demo/app/components/search_bar.dart';
import 'package:intesasoft_demo/app/extensions/context/context_extensions_shelf.dart';
import 'package:intesasoft_demo/shared/app_colors.dart';
import 'package:intesasoft_demo/views/detail/detail_view.dart';
import 'package:intesasoft_demo/views/qr/qr_view.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';
import 'home_viewmodel.dart';

Future<void> nextTick(Function callback, [int milliseconds = 0]) async {
  SchedulerBinding.instance!.addPostFrameCallback((_) {
    callback();
  });
}

class HomeView extends StatefulWidget {
  final bool? dontReq;
  const HomeView({Key? key, this.dontReq}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (HomeViewModel model) {
        if (widget.dontReq == true) {
          model.filterCities(model.qrTextEditingController.text);
        } else {
          model.getCityList();
        }
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: context.primaryColor,
        body: _buildBody(model, context),
      ),
      onDispose: (HomeViewModel model) {},
    );
  }

  Widget _buildBody(HomeViewModel model, BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppbar(),
      ),
      drawer: const CustomDrawer(),
      body: model.homeView == 0
          ? Consumer<HomeViewModel>(builder: (context, provider, _) {
              return Padding(
                padding: context.highEdgeInsets,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: context.highCircular,
                    color: backgroundWhiteColor,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: context.mediumEdgeInsets,
                        child: searchBar(model, context),
                      ),
                      subHeader(context),
                      cityList(model)
                    ],
                  ),
                ),
              );
            })
          : QRPage(),
    );
  }

  Widget searchBar(HomeViewModel model, BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: SearchBar(
          textEditingController:
              locator.get<HomeViewModel>().qrTextEditingController,
          onChanged: (value) {
            model.filterCities(value);
            // model.getQrText(value);
          },
          hintTextKey: 'Şehir Giriniz',
        )),
        qrButton(model, context)
      ],
    );
  }

  Widget qrButton(HomeViewModel model, BuildContext context) {
    return IconButton(
        onPressed: () {
          model.setHomeView(1);
        },
        icon: const Icon(Icons.qr_code_scanner, size: 30));
  }

  Widget subHeader(BuildContext context) {
    return Container(
        color: customRed,
        child: Row(
          children: [
            Padding(
              padding: context.mediumEdgeInsets,
              child: AutoSizeText("Şehirler",
                  style: context.headline6
                      .copyWith(color: backgroundWhiteColor, fontSize: 18)),
            ),
          ],
        ));
  }

  Widget cityList(HomeViewModel model) {
    return Expanded(
      child: Padding(
        padding: context.bottomLow,
        child: ListView.builder(
            itemCount: model.filteredList.length,
            itemBuilder: (
              context,
              index,
            ) {
              return cityListItem(context, model, index);
            }),
      ),
    );
  }

  Widget cityListItem(BuildContext context, HomeViewModel model, int index) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.width * 3, vertical: context.height),
          child: InkWell(
            onTap: () {
              log(model.filteredList[index].id);
              model.changeCityId(model.filteredList[index].id);
              log("cityid" + model.cityId);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const DetailView()));
            },
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: context.mediumCircular,
                  child: model.filteredList[index].image == null
                      ? const Placeholder(
                          fallbackHeight: 80,
                          fallbackWidth: 80,
                        )
                      : Image(
                          image: NetworkImage(model.filteredList[index].image),
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                ),
                Padding(
                  padding: context.lowEdgeInsets,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        model.filteredList[index].name,
                        style: context.headline6.copyWith(
                            fontSize: 22,
                            color: customGreyTextColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      AutoSizeText(
                        "Güncel Nüfus: "
                        "${model.filteredList[index].populations.first.population}",
                        style: context.headline6.copyWith(
                          color: customGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: context.lowEdgeInsets,
                  child: const Icon(
                    Icons.remove_red_eye_outlined,
                  ),
                )
              ],
            ),
          ),
        ),
        cityListItemDivider(context)
      ],
    );
  }

  Padding cityListItemDivider(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 3, vertical: context.height),
      child: Row(
        children: const [
          Expanded(
            child: Divider(
              color: dividerColor,
              thickness: 3,
              height: 0,
              // height: 10,
            ),
          )
        ],
      ),
    );
  }
}
