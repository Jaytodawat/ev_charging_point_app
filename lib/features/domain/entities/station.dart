class Station {
  final String id;
  final String name;
  final int type;
  final bool isAvailable;
  final String shortAddress;
  final String address;
  final String about;
  final int likeCount;
  final int power;
  final double price;
  final String headingImage;
  final String tileImage;
  final double distance;
  final bool isLiked;

  Station({
    required this.id,
    required this.name,
    required this.type,
    required this.isAvailable,
    required this.shortAddress,
    required this.address,
    required this.about,
    required this.likeCount,
    required this.power,
    required this.price,
    required this.headingImage,
    required this.tileImage,
    required this.distance,
    required this.isLiked,
  });
}
