import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/constants/app_constantts.dart';
import 'package:pokedex/app/controller/details/details_controller.dart';
import 'package:pokedex/app/controller/home/home_controller.dart';
import 'package:pokedex/app/ui/android/details/widgets/type_badges_widget.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class DetailsPage extends GetView<DetailsController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: GetX<DetailsController>(
        builder: (_) {
          _.pokemon = Get.find<HomeController>().pokemon;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Get.back();
                },
              ),
              backgroundColor: ConstsApp.getColorType(_.pokemon.type[0]),
              title: Text(
                _.pokemon.name + " - " + _.pokemon.num,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                )
              ],
            ),
            backgroundColor:
                ConstsApp.getColorType(_.pokemon.type[0]).withAlpha(240),
            body: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Column(
                    children: [
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "1st Gen - Kanto",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      CachedNetworkImage(
                        height: 250,
                        width: 250,
                        placeholder: (context, url) => new Container(
                          color: Colors.transparent,
                        ),
                        imageUrl:
                            'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${_.pokemon.num}.png',
                      ),
                    ],
                  ),
                ),
                SlidingSheet(
                  elevation: 50,
                  cornerRadius: 32,
                  snapSpec: const SnapSpec(
                    snap: true,
                    snappings: [0.6, 1.0],
                    positioning: SnapPositioning.relativeToAvailableSpace,
                  ),
                  builder: (context, state) {
                    return Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: (Column(
                        children: [
                          Text(
                            _.pokemon.type.length > 1 ? "Types" : "Type",
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TypeBadges(type: _.pokemon.type),
                            ],
                          ),
                        ],
                      )),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
