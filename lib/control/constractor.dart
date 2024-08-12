
class data {
  String name, img;
  data(this.img, this.name);
}

class AppBarName {
  final String works;

  AppBarName(this.works);
}

class CardName {
  final String CName;

  CardName(this.CName);
}
class detailCon{
  final int phone;
  final int phone2;
  final int viber;
  final int whatsapp;


 detailCon({
    required this.phone,
    required this.phone2,
    required this.viber,
    required this.whatsapp,
  });

}

class detailString {

 
  final String gender;
  final String nation;
  //final String language;
  final String place;

  final String grnty;
  final String group;
  
 final String exp; 
  final String currence;
  final String moreInfo;
  //final String weekDay;



 detailString({
    
     required this.gender,
     required this.nation,
    // required this.language,
     required this.place,
     required this.grnty,
     required this.group,
    
  required this.exp,
     required this.currence,
     required this.moreInfo,
    // required this.weekDay,
  });


}


class Item {
  final String name;
  final String imageUrl;
  final String city;
  final String work;
  
  Item({
    required this.name,
    required this.imageUrl,
    required this.city,
    required this.work,
    
     });
}
