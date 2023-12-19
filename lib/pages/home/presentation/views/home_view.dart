import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:task/consts/colors.dart';
import 'package:task/consts/text_styles.dart';
import 'package:task/pages/home/presentation/controllers/home_controller.dart';
import 'package:task/resources/strings_generated.dart';
import 'package:task/routes/app_pages.dart';
import 'package:task/services/auth_service.dart';
import 'package:task/widgets/custom_text.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCode.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              AuthService.to.logout();
              controller.timer!.cancel();
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(
          AppStrings.home,
          textStyle: TextStyles.textLarge.copyWith(color: ColorCode.primary),
        ),
      ),
      body: controller.obx(
        (state) {
          return Obx(
            () {
              if (controller.gettingLocation.value) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorCode.primary,
                  ),
                );
              } else {
                return GoogleMap(
                  myLocationEnabled: true,
                  compassEnabled: true,
                  onMapCreated: (GoogleMapController cont) {
                    controller.mapController = cont;
                  },
                  polylines: {
                    Polyline(
                      color: ColorCode.primary,
                      points:
                          controller.markerList.map((e) => e.position).toList(),
                      polylineId: const PolylineId("1"),
                    )
                  },
                  markers: Set<Marker>.of(controller.markerList),
                  initialCameraPosition: CameraPosition(
                      target: controller.currentPosition, zoom: 14),
                );
              }
            },
          );
        },
        onLoading: const Center(
          child: CircularProgressIndicator(
            color: ColorCode.primary,
          ),
        ),
      ),
    );
  }
}
