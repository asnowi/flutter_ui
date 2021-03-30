class ImageUtils {

  ///本地图片路径
  static String assetsPath(String name,{String type = 'png'}){
    return 'assets/images/$name.$type';
  }

}