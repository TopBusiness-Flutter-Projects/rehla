import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/offer_ride/models/list_of_offer_ride_model.dart';
import '../../features/offer_ride/models/offer_ride_model.dart';

class Preferences {
  static final Preferences instance = Preferences._internal();

  Preferences._internal();

  factory Preferences() => instance;

  Future<void> saveOfferRideData(OfferRideModel offerRideModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    OfferRideListModel offerRideListModel = OfferRideListModel(offerRide: [],lastOfferRide: []);
    if (preferences.getString('offerRide') != null) {
      offerRideListModel = await getAllSavedOffers();
      offerRideListModel.offerRide!.add(offerRideModel);
      await preferences.setString('offerRide', jsonEncode(offerRideListModel));
    } else {
      offerRideListModel.offerRide!.add(offerRideModel);
      await preferences.setString('offerRide', jsonEncode(offerRideListModel));
    }
  }

  Future<OfferRideListModel> getAllSavedOffers() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    OfferRideListModel offerRideListModel = OfferRideListModel();
    if(preferences.getString('offerRide')!=null){
      Map<String, dynamic> offerMap =
      jsonDecode(preferences.getString('offerRide')!);
      offerRideListModel = OfferRideListModel.fromJson(offerMap);
    }
    return offerRideListModel;
  }

  Future<void> deleteTrip(OfferRideListModel offerRideListModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('offerRide', jsonEncode(offerRideListModel));
  }

  clearUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('user');
  }

  Future<void> changeTripStatus({required int index, required int status}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    OfferRideListModel offerRideListModel = await getAllSavedOffers();
    if(status==2){
      offerRideListModel.offerRide![index].status = status;
      offerRideListModel.lastOfferRide!.add(offerRideListModel.offerRide![index]);
      offerRideListModel.offerRide!.removeAt(index);
      await preferences.setString('offerRide', jsonEncode(offerRideListModel));
    }else{
      offerRideListModel.offerRide![index].status = status;
      await preferences.setString('offerRide', jsonEncode(offerRideListModel));
    }

  }

  clearCartData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('cart');
  }
//
// Future<CartModel> getCart() async {
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   String? jsonData = preferences.getString('cart');
//   CartModel cartModel;
//   if (jsonData != null) {
//     cartModel = CartModel.fromJson(jsonDecode(jsonData));
//   } else {
//     cartModel = CartModel(
//       orderDetails: [],
//       productModel: [],
//       phone: '',
//       note: '',
//       totalPrice: 0,
//     );
//   }
//   return cartModel;
// }
//
// Future<void> setCart(CartModel cartModel) async {
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   preferences.setString('cart', jsonEncode(CartModel.toJson(cartModel)));
// }
//
// addItemToCart(ProductModel model, int qty) async {
//   CartModel cartModel = await getCart();
//   bool isNew = true;
//   cartModel.orderDetails!.forEach(
//     (element) {
//       if (element.productId == model.id) {
//         int index = cartModel.orderDetails!.indexOf(element);
//         cartModel.orderDetails![index].qty =
//             cartModel.orderDetails![index].qty + qty;
//         cartModel.productModel![index].quantity =
//             cartModel.productModel![index].quantity + qty;
//         cartModel.totalPrice = (cartModel.totalPrice! +
//             (qty * cartModel.productModel![index].price!));
//         setCart(cartModel);
//         isNew = false;
//       }
//     },
//   );
//   if (isNew) {
//     model.quantity = qty;
//     cartModel.totalPrice = (cartModel.totalPrice! + (qty * model.price!));
//     cartModel.productModel!.add(model);
//     cartModel.orderDetails!.add(
//       OrderDetails(
//         productId: model.id!,
//         qty: model.quantity,
//       ),
//     );
//     setCart(cartModel);
//   }
// }
//
// changeProductCount(ProductModel model, int qty, int price,context) async {
//   CartModel cartModel = await getCart();
//   cartModel.productModel!.forEach(
//     (element) {
//       if (element.id == model.id) {
//         int index = cartModel.productModel!.indexOf(element);
//         cartModel.orderDetails![index].qty = qty;
//         cartModel.productModel![index].quantity = qty;
//         cartModel.totalPrice = cartModel.totalPrice! + price;
//         setCart(cartModel);
//       }
//     },
//   );
// }
//
// deleteProduct(ProductModel model) async {
//   CartModel cartModel = await getCart();
//   for (int i = 0; i <= cartModel.productModel!.length; i++) {
//     if (cartModel.productModel![i].id == model.id) {
//       cartModel.orderDetails!.removeAt(i);
//       cartModel.productModel!.removeAt(i);
//       cartModel.totalPrice =
//           cartModel.totalPrice! - (model.price! * model.quantity);
//       setCart(cartModel);
//       break;
//     }
//   }
// }
}
