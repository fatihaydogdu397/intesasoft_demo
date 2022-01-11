import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intesasoft_demo/app/base/base_view.dart';
import 'package:intesasoft_demo/app/components/custom_appbar.dart';
import 'package:intesasoft_demo/app/components/custom_drawer.dart';
import 'package:intesasoft_demo/app/decoration/decoration_shelf.dart';
import 'package:intesasoft_demo/app/enums/viewstate.dart';
import 'package:intesasoft_demo/app/extensions/context/context_extensions_shelf.dart';
import 'package:intesasoft_demo/locator.dart';
import 'package:intesasoft_demo/shared/app_colors.dart';
import 'package:intesasoft_demo/views/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

import 'detail_viewmodel.dart';

class DetailView extends StatefulWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<DetailViewModel>(
      onModelReady: (DetailViewModel model) {
        model.getCity(locator<HomeViewModel>().cityId);
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: context.primaryColor,
        body: _buildBody(model, context),
      ),
      onDispose: (DetailViewModel model) {},
    );
  }

  Widget _buildBody(DetailViewModel model, BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppbar(),
      ),
      drawer: const CustomDrawer(),
      body: Consumer<DetailViewModel>(builder: (context, provider, _) {
        return provider.viewState == ViewState.Busy
            ? const Center(
                child: CircularProgressIndicator(
                color: customRed,
              ))
            : SingleChildScrollView(
                child: Padding(
                  padding: context.highEdgeInsets,
                  child: Center(
                    child: Column(
                      children: [
                        AutoSizeText(
                          // ignore: unnecessary_null_comparison
                          provider.detailModel?.name != null ||
                                  provider.detailModel?.name != ''
                              ? provider.detailModel!.name
                              : "İl Adı",
                          style: context.headline1
                              .copyWith(color: customGreyTextColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AutoSizeText(
                          // ignore: unnecessary_null_comparison
                          model.detailModel!.populations.first.population !=
                                      null ||
                                  model.detailModel!.populations.first
                                          .population !=
                                      ''
                              ? "Güncel Nüfus: " +
                                  model
                                      .detailModel!.populations.first.population
                              // ignore: prefer_adjacent_string_concatenation
                              : "Güncel Nüfus: " + "bilinmiyor...",
                          style: context.headline6.copyWith(color: customGrey),
                        ),
                        Padding(
                          padding: context.mediumEdgeInsets,
                          child: Container(
                            width: context.width * 80,
                            decoration: BoxDecoration(
                              borderRadius: context.highCircular,
                              color: backgroundWhiteColor,
                            ),
                            padding: context.highEdgeInsets,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: context.mediumCircular,
                                  child: model.detailModel!.image == null
                                      ? Placeholder(
                                          fallbackHeight: context.width * 50,
                                          fallbackWidth: context.width * 50,
                                        )
                                      : Image(
                                          image: NetworkImage(
                                              model.detailModel!.image),
                                          width: context.width * 50,
                                          height: context.width * 50,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                Padding(
                                  padding: context.topLowMed,
                                  child: AutoSizeText(
                                    model.detailModel!.description != null ||
                                            model.detailModel!.description != ''
                                        ? model.detailModel!.description
                                        : "No Description...",
                                    style: context.headline6.copyWith(
                                      color: customGreyTextColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: context.topLowMed,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextButton(
                                            style: ButtonStyles.instance
                                                .lowRoundedStyle(context,
                                                    backgroundColor: customRed),
                                            onPressed: () {},
                                            child: Padding(
                                              padding: context.lowSymmetric,
                                              child: AutoSizeText(
                                                "Haritada Görüntüle",
                                                style: context.headline6.copyWith(
                                                    color:
                                                        backgroundWhiteColor),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }
}
