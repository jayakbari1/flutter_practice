class ImageRepository {
  String imgUrl = 'https://source.unsplash.com/random?sig=';

  String getImage(String id) {
    return imgUrl + id;
  }
}
