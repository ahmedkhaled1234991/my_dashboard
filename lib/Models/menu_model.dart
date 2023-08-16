class MenuModel {
  final String title;
  final String imagePath;
  bool isSelected;
  final MenuBarRoutes menuBarRoute;

  MenuModel(
      {required this.title,
      required this.imagePath,
      this.isSelected = false,
      this.menuBarRoute = MenuBarRoutes.empty});
}

enum MenuBarRoutes {
  home,
  products,
  offers,
  album,
  achievements,
  reports,
  settings,
  // branches,
  // complaintsAndSuggestions,
  // complaintsAndSuggestionsDetails,
  // commodityReport,
  // reportDetails,
  // diwaniyat,
  // contributors,
  // products,
  // socialCommunication,
  // users,
  empty
}
