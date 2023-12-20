import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:task/pages/home/data/home_repository.dart';
import 'package:task/services/auth_service.dart';
import 'package:task/shared/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends SuperController<bool> {
  HomeController({required this.homeRepository});

  final IHomeRepository homeRepository;
  Timer? timer;
  late LatLng currentPosition;
  List<Marker> markerList = [];
  RxBool gettingLocation = false.obs;
  late GoogleMapController mapController;

  getMarkers() async {
    change(null, status: RxStatus.loading());
    await homeRepository.getMarkers().then((value) {
      value.data?.map((e) {});
      for (int i = 0; i < (value.data?.length ?? 0); i++) {
        markerList.add(
          Marker(
            position: LatLng(
              double.tryParse(value.data?[i].lat ?? "0") ?? 0,
              double.tryParse(value.data?[i].longt ?? "0") ?? 0,
            ),
            infoWindow: const InfoWindow(title: 'Home'),
            markerId: const MarkerId('Origin'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          ),
        );
      }
      change(null, status: RxStatus.success());
    }).catchError((e) {
      change(null, status: RxStatus.success());
    });
    change(null, status: RxStatus.success());
  }

  updateCurrentPosition() async {
    await determinePosition().then((value) {
      currentPosition = LatLng(value.latitude, value.longitude);
      gettingLocation.value = false;
      update();
    });
  }

  getCurrentLocation() async {
    gettingLocation.value = true;
    update();
    await determinePosition().then((value) {
      currentPosition = LatLng(value.latitude, value.longitude);
      gettingLocation.value = false;
      saveLocationInFirebase();
      update();
    });
    gettingLocation.value = false;
    update();
  }

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  saveLocationInFirebase() {
    CollectionReference userLocation =
        FirebaseFirestore.instance.collection('location');
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      updateCurrentPosition();
      userLocation.doc(AuthService.to.userInfo?.data?.usersID).set({
        'lat': currentPosition.latitude,
        'lng': currentPosition.longitude
      }).then((value) {
        print(AuthService.to.userInfo?.data?.usersID);
        print("userAdded");
      }).catchError((error) {
        print("Failed to add user: $error");
      });
    });
  }

  @override
  void onInit() {
    getMarkers();
    getCurrentLocation();
    super.onInit();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}
