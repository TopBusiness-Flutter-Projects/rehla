import 'offer_ride_model.dart';

class OfferRideListModel {
  final List<OfferRideModel> offerRide;

  OfferRideListModel(this.offerRide);

  factory OfferRideListModel.fromJson(Map<String, dynamic> json) =>
      OfferRideListModel(
        List<OfferRideModel>.from(
          json["offerRide"].map((x) => x),
        ),
      );

  Map<String, dynamic> toJson() => {
        "offerRide": List<OfferRideModel>.from(offerRide.map((x) => x)),
      };
}
