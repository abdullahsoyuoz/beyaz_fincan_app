class HoroscopeEntity {
  int id;
  String title;
  String day;
  String element;
  String planet;
  String motto;
  String description;
  String iconPath;
  bool onTap;
  HoroscopeEntity({
    this.id,
    this.title,
    this.description,
    this.day,
    this.element,
    this.planet,
    this.motto,
    this.iconPath,
    this.onTap = false,
  });
}