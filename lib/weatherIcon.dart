weatherIcon_by_Condition(String condition) {
  String iconPath = "assets/snow.png";
  switch (condition) {
    case "Cloudy":
      {
        iconPath = "assets/cloudy.png";
      }
      break;
    case "Stormy":
      {
        iconPath = "assets/storm.png";
      }
      break;
    case "Snow":
      {
        iconPath = "assets/snow.png";
      }
      break;
    case "Sunny":
      {
        iconPath = "assets/sunny.png";
      }
      break;
    case "Rainy":
      {
        iconPath = "assets/rainy.png";
      }
      break;
    case "Partly Cloudy":
      {
        iconPath = "assets/shade.png";
      }
      break;
  }
  return iconPath;
}
