import '../models/categories.model.dart';
import '../services/assets_manager.dart';

class AppConsts {
  static const String imageUrl =
      'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png';
  static List<String> bannerImages = [
    AssetsManager.banner1,
    AssetsManager.banner2
  ];
  static List<CategoriesModel> categoriesList = [
    CategoriesModel(
        id: AssetsManager.book, name: 'book', image: AssetsManager.book),
    CategoriesModel(
        id: AssetsManager.cosmetics,
        name: 'Cosmetics',
        image: AssetsManager.cosmetics),
    CategoriesModel(
        id: AssetsManager.electronics,
        name: 'Electronics',
        image: AssetsManager.electronics),
    CategoriesModel(
        id: AssetsManager.fashion,
        name: 'Fashion',
        image: AssetsManager.fashion),
    CategoriesModel(
        id: AssetsManager.mobiles,
        name: 'Phones',
        image: AssetsManager.mobiles),
    CategoriesModel(
        id: AssetsManager.pc, name: 'Computer', image: AssetsManager.pc),
    CategoriesModel(
        id: AssetsManager.shoes, name: 'Foot Wear', image: AssetsManager.shoes),
    CategoriesModel(
        id: AssetsManager.watch, name: 'Gadgets', image: AssetsManager.watch),
  ];
}
