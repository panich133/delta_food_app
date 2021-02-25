class DetailRestaurant {
  int id;
  String imageUrl;
  String resname;
  String address;
  String detail;

  // List<DetailFoods> detailfoods;

  DetailRestaurant(
    this.id, {
    this.imageUrl,
    this.resname,
    this.address,
    this.detail,
    // this.detailfoods
  });
}

List<DetailRestaurant> detailRestaurants = [
  DetailRestaurant(
    1,
    imageUrl: 'assets/images/resD.jpg',
    resname: 'ร้านอาหารOTA',
    address: 'ที่อยู่กรุงเทพ',
    detail: 'รายละเอียด',
    // detailfoods: detailfoods
  ),
  DetailRestaurant(
    2,
    imageUrl: 'assets/images/resB.jpg',
    resname: 'ร้านอาหารGG',
    address: 'ขอนแก่น',
    detail: 'รายละเอียด',
    // detailfoods: detailfoods,
  ),
  DetailRestaurant(
    3,
    imageUrl: 'assets/images/resC.jpg',
    resname: 'ร้านอาหารTT',
    address: 'ที่อยู่',
    detail: 'รายละเอียด',
    // detailfoods: detailfoods,
  ),
  DetailRestaurant(
    4,
    imageUrl: 'assets/images/resD.jpg',
    resname: 'ร้านอาหาร JJ',
    address: 'ขอนแก่น',
    detail: 'รายละเอียด',
    // detailfoods: detailfoods,
  ),
  DetailRestaurant(
    5,
    imageUrl: 'assets/images/resE.jpg',
    resname: 'ร้านอาหาร3G',
    address: 'มหาสารคาม',
    detail: 'รายละเอียด',
    // detailfoods: detailfoods,
  ),
  DetailRestaurant(
    6,
    imageUrl: 'assets/images/resF.jpg',
    resname: 'ร้านอาหารDDD',
    address: 'น่าน',
    detail: 'รายละเอียด',
    // detailfoods: detailfoods,
  ),
  DetailRestaurant(
    7,
    imageUrl: 'assets/images/resA.jpg',
    resname: 'ร้านอาหาร3A',
    address: 'เชียงใหม่',
    detail: 'รายละเอียด',
    // detailfoods: detailfoods,
  ),
  DetailRestaurant(
    8,
    imageUrl: 'assets/images/resE.jpg',
    resname: 'ร้านอาหาร888',
    address: 'เลย',
    detail: 'รายละเอียด',
    // detailfoods: detailfoods,
  ),
  DetailRestaurant(
    9,
    imageUrl: 'assets/images/resB.jpg',
    resname: 'ร้านอาหาร3D',
    address: 'กระบี่',
    detail: 'รายละเอียด',
    // detailfoods: detailfoods,
  ),
  DetailRestaurant(
    10,
    imageUrl: 'assets/images/resA.jpg',
    resname: 'ร้านอาหาร12A',
    address: 'ภูเก็ต',
    detail: 'รายละเอียด',
    // detailfoods: detailfoods,
  ),
];

/////////////////////////
//class
/////////////////////////
class DetailFoods {
  int id;
  String imageUrl;
  String foodname;
  String type;

  // List<String> startTimes;
  int rating;
  int price;
  int quantity;

  DetailFoods(this.id,
      {this.imageUrl,
      this.foodname,
      this.type,
      // this.startTimes,
      this.rating,
      this.price,
      this.quantity});
}

List<DetailFoods> detailfoods = [
  DetailFoods(
    1,
    imageUrl: 'assets/images/bigMac.png',
    foodname: 'ผัดกระเพรา',
    type: 'A',
    // startTimes: ['11:50', '19:20'],
    rating: 3,
    price: 70,
  ),
  DetailFoods(
    2,
    imageUrl: 'assets/images/doubleBigTaste.png',
    foodname: 'ข้าวผัด',
    type: 'B',
    // startTimes: ['09:30', '12:50'],
    rating: 5,
    price: 80,
  ),
  DetailFoods(
    3,
    imageUrl: 'assets/images/FiletOFish.png',
    foodname: 'ข้าวผัดทะเเล',
    type: 'B',
    // startTimes: ['00:30', '12:00'],
    rating: 4,
    price: 90,
  ),
  DetailFoods(
    4,
    imageUrl: 'assets/images/grandChicken.png',
    foodname: 'ข้าวหมูกรอบ',
    type: 'C',
    // startTimes: ['00:30', '12:00'],
    rating: 3,
    price: 60,
  ),
  DetailFoods(
    5,
    imageUrl: 'assets/images/doubleBigTaste.png',
    foodname: 'น้ำแข็งต้ม',
    type: 'A',
    // startTimes: ['00:30', '12:00'],
    rating: 3,
    price: 40,
  ),
  DetailFoods(
    6,
    imageUrl: 'assets/images/bgdelltafood.jpg',
    foodname: 'ทอด',
    type: 'A',
    // startTimes: ['00:30', '12:00'],
    rating: 1,
    price: 50,
  ),
  DetailFoods(
    7,
    imageUrl: 'assets/images/doubleBigTaste.png',
    foodname: 'ย่าง',
    type: 'C',
    // startTimes: ['00:30', '12:00'],
    rating: 3,
    price: 40,
  ),
];
