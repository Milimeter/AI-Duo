const String imageAssetRoot = "assets/";

//svg assets
// final String facebook = _getImagePath("svg/facebook.svg");
final String qr = _getImagePath("svg/qr.svg");

//video
final String intro = _getImagePath("video/intro.mp4");


//png assetsPath

final String logo = _getImagePath("png/logo.png");
final String user = _getImagePath("png/user.png");


//lottie assetsPath 
final String info = _getImagePath("lottie/info.json");



String _getImagePath(String imageName) => imageAssetRoot + imageName;
