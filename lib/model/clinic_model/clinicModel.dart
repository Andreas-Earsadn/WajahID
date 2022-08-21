
import 'dart:convert';

import 'package:wajah_id/clinic/clinic_sliding_card.dart';

class Clinic {
  Clinic({
    this.title = '',
    this.placeName,
    this.openHour,
    this.closeHour,
    this.location,
    this.phone,
    this.reviewer,
    this.logo,
    this.imgLocation,
    this.imagePath = '',
    this.rating = 0.0,
    this.distance = '0,0',
  });

  String title;
  String placeName;
  var openHour;
  var closeHour;
  String location;
  String phone;
  String imgLocation;
  String logo;
  double rating;
  var distance;
  String imagePath;
  var reviewer;

  static List<Clinic> allClinicList = <Clinic>[
    Clinic(
      imagePath: 'assets/zap.png',
      title: 'Zap Clinic',
      placeName: 'Lotte Shopping Avenue',
      openHour: 09,
      closeHour: 22,
      location: 'South Jakarta',
      phone: '0812131278',
      imgLocation:'assets/location.png',
      logo: 'assets/zaplogo.png' ,
      rating: 4.3,
      distance: 2.5,
      reviewer: 40,
    ),
    Clinic(
      imagePath: 'assets/zap2.png',
      title: 'Erha Clinic',
      logo: 'assets/erha.png',
      openHour: 09,
      closeHour: 22,
      location: 'South Jakarta',
      placeName: 'CITOS',
      phone: '0812131278',
      imgLocation:'assets/location.png',
      reviewer: 70,

      rating: 4.6,
      distance: 2.3,
    ),
    Clinic(
      imagePath: 'assets/zap3.png',
      title: 'Surface Clinic',
      placeName: 'Tebet',
      logo: 'assets/surfacelogo.png',
      openHour: 09,
      closeHour: 22,
      location: 'South Jakarta',
      phone: '0812131278',
      imgLocation:'assets/location.png',
      rating: 4.3,
      distance: 2.5,
      reviewer: 47,
    ),
    Clinic(
      imagePath: 'assets/zap.png',
      title: 'Zap Clinic',
      logo: 'assets/zaplogo.png',
      placeName: 'Sudirman',
      openHour: 09,
      closeHour: 22,
      location: 'South Jakarta',
      phone: '0812131278',
      imgLocation:'assets/location.png',
      distance: 2.5,
      rating: 4.6,
      reviewer: 50,
    ),
    Clinic(
      imagePath: 'assets/zap.png',
      title: 'Zap Clinic',
      placeName: 'Lotte Shopping Avenue',
      openHour: 09,
      closeHour: 22,
      location: 'South Jakarta',
      phone: '0812131278',
      imgLocation:'assets/location.png',
      logo: 'assets/zaplogo.png' ,
      rating: 4.3,
      distance: 2.5,
      reviewer: 31,
    ),
    Clinic(
      imagePath: 'assets/zap2.png',
      title: 'Erha Clinic',
      logo: 'assets/erha.png',
      openHour: 09,
      closeHour: 22,
      location: 'South Jakarta',
      placeName: 'CITOS',
      phone: '0812131278',
      imgLocation:'assets/location.png',
      reviewer: 19,
      rating: 4.6,
      distance: 2.5,
    ),
    Clinic(
      imagePath: 'assets/zap3.png',
      title: 'Surface Clinic',
      placeName: 'Tebet',
      logo: 'assets/surfacelogo.png',
      openHour: 09,
      closeHour: 22,
      location: 'South Jakarta',
      phone: '0812131278',
      imgLocation:'assets/location.png',
      reviewer: 29,
      rating: 4.3,
      distance: 2.5,
    ),
    Clinic(
      imagePath: 'assets/zap.png',
      title: 'Zap Clinic',
      logo: 'assets/zaplogo.png',
      placeName: 'Sudirman',
      openHour: 09,
      closeHour: 22,
      location: 'South Jakarta',
      phone: '0812131278',
      imgLocation:'assets/location.png',
      distance: 2.5,
      rating: 4.6,
      reviewer: 90,
    ),
  ];

  static List<Clinic> popularClinicList = <Clinic>[
    Clinic(
      imagePath: 'assets/zap.png',
      title: 'Zap Clinic',
      openHour: 09,
      closeHour: 22,
      location: 'South Jakarta',
      phone: '0812131278',
      imgLocation:'assets/location.png',
      distance: 5.7,



      rating: 4.8,
    ),
    Clinic(
      imagePath: 'assets/zap2.png',
      title: 'Erha Clinic',
      openHour: 09,
      closeHour: 22,
      location: 'South Jakarta',
      phone: '0812131278',
      imgLocation:'assets/location.png',
      distance: 6.7,
      rating: 4.9,
    ),
    Clinic(
      imagePath: 'assets/zap3.png',
      title: 'Surface Clinic',
      openHour: 09,
      closeHour: 22,
      location: 'South Jakarta',
      phone: '0812131278',
      imgLocation:'assets/location.png',
      distance: 9.7,
      rating: 4.8,
    ),
    Clinic(
      imagePath: 'assets/zap.png',
      title: 'Z Clinic',
      openHour: 09,
      closeHour: 22,
      location: 'South Jakarta',
      phone: '0812131278',
      imgLocation:'assets/location.png' ,
      distance: 7.7,

      rating: 4.9,
    ),
  ];



}

class ClinicTreatment extends Clinic {
  ClinicTreatment({
    this.title = '',
    this.description,
    this.price,
    this.imagePath = '',
    this.isfavourite,
    this.estimateTime,
    this.rating = 0.0,

    this.tncImage1, this.tncImage2, this.tncImage3, this.tncImage4, this.tncDesc1, this.tncDesc2, this.tncDesc3, this.tncDesc4,

  });

  String title;
  var price;
  var estimateTime;
  String description;
  String tncImage1;
  String tncImage2;
  String tncImage3;
  String tncImage4;
  String tncDesc1;
  String tncDesc2;
  String tncDesc3;
  String tncDesc4;
  double rating;
  String imagePath;
  bool isfavourite = false;

  static List<ClinicTreatment> clinicTreatment = <ClinicTreatment>[
    ClinicTreatment(
      imagePath: 'assets/treatment1.png',
      title: 'Photo Facial Grow',
      description: "If you have never done a photo facial before, you will consult with a clinic's doctor to determine the indications that suit your skins needs and get it in depth medical information about the series of treatments that you will understand",
      estimateTime: 45,
      rating: 4.3,
      price: 100000,
      isfavourite: true,
      tncImage1:'assets/tnc1.png' ,
      tncImage2:'assets/tnc2.png' ,
      tncImage3:'assets/tnc3.png' ,
      tncImage4:'assets/tnc4.png' ,
      tncDesc1:'Deep Cleansing' ,
      tncDesc2:'Avoid Excessive exfoiliation' ,
      tncDesc3:'Avoid Sun Exposure' ,
      tncDesc4:"Don't Make Up" ,
    ),
    ClinicTreatment(
      imagePath: 'assets/treatment2.png',
      title: 'Hair Removal',
      description: "If you have never done a photo facial before, you will consult with a clinic's doctor to determine the indications that suit your skins needs and get it in depth medical information about the series of treatments that you will understand",
      estimateTime: '45 Minutes',
      rating: 4.9,
      price: 200000,
      isfavourite: false,
      tncImage1:'assets/tnc1.png' ,
      tncImage2:'assets/tnc2.png' ,
      tncImage3:'assets/tnc3.png' ,
      tncImage4:'assets/tnc4.png' ,
      tncDesc1:'Deep Cleansing' ,
      tncDesc2:'Avoid Excessive exfoiliation' ,
      tncDesc3:'Avoid Sun Exposure' ,
      tncDesc4:"Don't Make Up" ,
    ),
    ClinicTreatment(
      imagePath: 'assets/treatment3.png',
      title: 'Laser',
      description: "If you have never done a photo facial before, you will consult with a clinic's doctor to determine the indications that suit your skins needs and get it in depth medical information about the series of treatments that you will understand",
      estimateTime: 55,
      rating: 4.8,
      price: 350000,
      isfavourite: true,
      tncImage1:'assets/tnc1.png' ,
      tncImage2:'assets/tnc2.png' ,
      tncImage3:'assets/tnc3.png' ,
      tncImage4:'assets/tnc4.png' ,
      tncDesc1:'Deep Cleansing' ,
      tncDesc2:'Avoid Excessive exfoiliation' ,
      tncDesc3:'Avoid Sun Exposure' ,
      tncDesc4:"Don't Make Up" ,
    ),
    ClinicTreatment(
      imagePath: 'assets/treatment2.png',
      title: 'Hair Removal',
      description: "If you have never done a photo facial before, you will consult with a clinic's doctor to determine the indications that suit your skins needs and get it in depth medical information about the series of treatments that you will understand",
      estimateTime: 45,
      rating: 4.9,
      price: 200000,
      isfavourite: false,
      tncImage1:'assets/tnc1.png' ,
      tncImage2:'assets/tnc2.png' ,
      tncImage3:'assets/tnc3.png' ,
      tncImage4:'assets/tnc4.png' ,
      tncDesc1:'Deep Cleansing' ,
      tncDesc2:'Avoid Excessive exfoiliation' ,
      tncDesc3:'Avoid Sun Exposure' ,
      tncDesc4:"Don't Make Up" ,
    ),

    ClinicTreatment(
      imagePath: 'assets/treatment3.png',
      title: 'Laser',
      description: "If you have never done a photo facial before, you will consult with a clinic's doctor to determine the indications that suit your skins needs and get it in depth medical information about the series of treatments that you will understand",
      estimateTime: 55,
      rating: 4.8,
      price: 350000,
      isfavourite: false,
      tncImage1:'assets/tnc1.png' ,
      tncImage2:'assets/tnc2.png' ,
      tncImage3:'assets/tnc3.png' ,
      tncImage4:'assets/tnc4.png' ,
      tncDesc1:'Deep Cleansing' ,
      tncDesc2:'Avoid Excessive exfoiliation' ,
      tncDesc3:'Avoid Sun Exposure' ,
      tncDesc4:"Don't Make Up" ,
    ),

    ClinicTreatment(
      imagePath: 'assets/treatment3.png',
      title: 'Laser',
      description: "If you have never done a photo facial before, you will consult with a clinic's doctor to determine the indications that suit your skins needs and get it in depth medical information about the series of treatments that you will understand",
      estimateTime: 55,
      rating: 4.8,
      price: 350000,
      isfavourite: true,
      tncImage1:'assets/tnc1.png' ,
      tncImage2:'assets/tnc2.png' ,
      tncImage3:'assets/tnc3.png' ,
      tncImage4:'assets/tnc4.png' ,
      tncDesc1:'Deep Cleansing' ,
      tncDesc2:'Avoid Excessive exfoiliation' ,
      tncDesc3:'Avoid Sun Exposure' ,
      tncDesc4:"Don't Make Up" ,
    ),
  ];




}

class ClinicDoctor extends Clinic {
  ClinicDoctor({
    this.name,
    this.type,
    this.price,
    this.description,
    this.rating,
    this.experience,
    this.goodReviews,
    this.totalScore,
    this.satisfaction,
    this.isfavourite,
    this.image,

  });

  String name;
  String type;
  var price;
  String description;
  double rating;
  int experience;
  double goodReviews;
  double totalScore;
  double satisfaction;
  bool isfavourite;
  String image;

  static List<ClinicDoctor> allClinicDoctor = <ClinicDoctor>[
    ClinicDoctor(
      name: "dr. Alfina Damayanti, Sp.KK",
      type: "Skin Specialist",
      price:140000,
      rating: 4.5,
      experience: 5,
      goodReviews: 79.2,
      totalScore: 93.2,
      satisfaction: 85.2,
      isfavourite: true,
      image:"assets/doctor_example.png",
      description: "A doctor can be found in several settings, including public health organization, group practices and  hospitals They have some of the most diverse and challenging careears available and part of a universally well-respected profession",

    ),

    ClinicDoctor(
      name: "dr. Putri Anggita, Sp.KK",
      type: "Skin Specialist",
      price:170000,
      rating: 4.5,
      experience: 5,
      goodReviews: 79.2,
      totalScore: 93.2,
      satisfaction: 85.2,
      isfavourite: true,
      image:"assets/doctor_example.png",
      description: "A doctor can be found in several settings, including public health organization, group practices and  hospitals They have some of the most diverse and challenging careears available and part of a universally well-respected profession",

    ),
    ClinicDoctor(
      name: "dr. Andreas, Sp.KK",
      type: "Skin Specialist",
      price:145000,
      rating: 4.5,
      experience: 5,
      goodReviews: 79.2,
      totalScore: 93.2,
      satisfaction: 85.2,
      isfavourite: true,
      image:"assets/doctor_example.png",
      description: "A doctor can be found in several settings, including public health organization, group practices and  hospitals They have some of the most diverse and challenging careears available and part of a universally well-respected profession",

    ),

    ClinicDoctor(
      name: "dr. Ivan, Sp.KK",
      type: "Skin Specialist",
      price:140000,
      rating: 4.5,
      experience: 5,
      goodReviews: 79.2,
      totalScore: 93.2,
      satisfaction: 85.2,
      isfavourite: true,
      image:"assets/doctor_example.png",
      description: "A doctor can be found in several settings, including public health organization, group practices and  hospitals They have some of the most diverse and challenging careears available and part of a universally well-respected profession",

    ),

    ClinicDoctor(
      name: "dr. Pamela, Sp.KK",
      type: "Skin Specialist",
      price:140000,
      rating: 4.5,
      experience: 5,
      goodReviews: 79.2,
      totalScore: 93.2,
      satisfaction: 85.2,
      isfavourite: true,
      image:"assets/doctor_example.png",
      description: "A doctor can be found in several settings, including public health organization, group practices and  hospitals They have some of the most diverse and challenging careears available and part of a universally well-respected profession",

    ),

    ClinicDoctor(
      name: "dr. Octav, Sp.KK",
      type: "Skin Specialist",
      price:140000,
      rating: 4.5,
      experience: 5,
      goodReviews: 79.2,
      totalScore: 93.2,
      satisfaction: 85.2,
      isfavourite: true,
      image:"assets/doctor_example.png",
      description: "A doctor can be found in several settings, including public health organization, group practices and  hospitals They have some of the most diverse and challenging careears available and part of a universally well-respected profession",

    ),
    ClinicDoctor(
      name: "dr. Dita, Sp.KK",
      type: "Skin Specialist",
      price:140000,
      rating: 4.5,
      experience: 5,
      goodReviews: 79.2,
      totalScore: 93.2,
      satisfaction: 85.2,
      isfavourite: true,
      image:"assets/doctor_example.png",
      description: "A doctor can be found in several settings, including public health organization, group practices and  hospitals They have some of the most diverse and challenging careears available and part of a universally well-respected profession",

    ),

    ClinicDoctor(
      name: "dr. Ricko Supriyanto, Sp.KK",
      type: "Skin Specialist",
      price:140000,
      rating: 4.5,
      experience: 5,
      goodReviews: 79.2,
      totalScore: 93.2,
      satisfaction: 85.2,
      isfavourite: true,
      image:"assets/doctor_example.png",
      description: "A doctor can be found in several settings, including public health organization, group practices and  hospitals They have some of the most diverse and challenging careears available and part of a universally well-respected profession",

    ),


  ];

  static List<ClinicDoctor> clinicDoctor = <ClinicDoctor>[
    ClinicDoctor(
      name: "dr. Alfina Damayanti, Sp.KK",
      type: "Skin Specialist",
      price:140000,
      rating: 4.5,
      experience: 5,
      goodReviews: 79.2,
      totalScore: 93.2,
      satisfaction: 85.2,
      isfavourite: true,
      image:"assets/doctor_example.png",
      description: "A doctor can be found in several settings, including public health organization, group practices and  hospitals They have some of the most diverse and challenging careears available and part of a universally well-respected profession",

    ),

    ClinicDoctor(
      name: "dr. Putri Anggita, Sp.KK",
      type: "Skin Specialist",
      price:140000,
      rating: 4.5,
      experience: 5,
      goodReviews: 79.2,
      totalScore: 93.2,
      satisfaction: 85.2,
      isfavourite: true,
      image:"assets/doctor_example.png",
      description: "A doctor can be found in several settings, including public health organization, group practices and  hospitals They have some of the most diverse and challenging careears available and part of a universally well-respected profession",

    ),
    ClinicDoctor(
      name: "dr. Andreas, Sp.KK",
      type: "Skin Specialist",
      price:140000,
      rating: 4.5,
      experience: 5,
      goodReviews: 79.2,
      totalScore: 93.2,
      satisfaction: 85.2,
      isfavourite: true,
      image:"assets/doctor_example.png",
      description: "A doctor can be found in several settings, including public health organization, group practices and  hospitals They have some of the most diverse and challenging careears available and part of a universally well-respected profession",

    ),

    ClinicDoctor(
      name: "dr. Ivan, Sp.KK",
      type: "Skin Specialist",
      price:140000,
      rating: 4.5,
      experience: 5,
      goodReviews: 79.2,
      totalScore: 93.2,
      satisfaction: 85.2,
      isfavourite: true,
      image:"assets/doctor_example.png",
      description: "A doctor can be found in several settings, including public health organization, group practices and  hospitals They have some of the most diverse and challenging careears available and part of a universally well-respected profession",

    ),

  ];


}

class ClinicProduct extends Clinic {
  ClinicProduct({
    this.name,
    this.productOwner,
    this.price,
    this.volume,
    this.description,
    this.rating,
    this.goodReviews,
    this.totalScore,
    this.satisfaction,
    this.isfavourite,
    this.image,
    this.reviewer,

  });

  String name;

  String description;
  double rating;
  String  productOwner;
  String volume;
  var price;
  var reviewer;

  double goodReviews;
  double totalScore;
  double satisfaction;
  bool isfavourite;
  String image;

  static List<ClinicProduct> clinicProduct = <ClinicProduct>[
    ClinicProduct(
      name: "Facial Toner",
      productOwner: 'ZAP Clinic',
      reviewer:79,
      price: 170000,
      volume: '100 ml',

      rating: 4.5,


      goodReviews: 79.2,
      totalScore: 93.2,
      satisfaction: 85.2,
      isfavourite: true,
      image:"assets/skin_products/productclinic1.png",
      description: "A doctor can be found in several settings, including public health organization, group practices and  hospitals They have some of the most diverse and challenging careears available and part of a universally well-respected profession",

    ),

    ClinicProduct(
      name: "Facial Toner",
      productOwner: 'ZAP Clinic',
      reviewer:79,
      volume: '100 ml',

      price: 170000,
      rating: 4.5,

      goodReviews: 79.2,
      totalScore: 93.2,
      satisfaction: 85.2,
      isfavourite: true,
      image:"assets/skin_products/productclinic2.png",
      description: "A doctor can be found in several settings, including public health organization, group practices and  hospitals They have some of the most diverse and challenging careears available and part of a universally well-respected profession",

    ),
    ClinicProduct(
      name: "Facial Toner",
      productOwner: 'ZAP Clinic',
      reviewer:79,
      price: 160000,
      volume: '100 ml',
      rating: 4.5,
      goodReviews: 79.2,
      totalScore: 93.2,
      satisfaction: 85.2,
      isfavourite: true,
      image:"assets/skin_products/productclinic3.png",
      description: "A doctor can be found in several settings, including public health organization, group practices and  hospitals They have some of the most diverse and challenging careears available and part of a universally well-respected profession",

    ),

    ClinicProduct(
      name: "Facial Toner",
      productOwner: 'ZAP Clinic',
      reviewer:79,
      price: 160000,
      volume: '100 ml',
      rating: 4.5,
      goodReviews: 79.2,
      totalScore: 93.2,
      satisfaction: 85.2,
      isfavourite: true,
      image:"assets/skin_products/productclinic3.png",
      description: "A doctor can be found in several settings, including public health organization, group practices and  hospitals They have some of the most diverse and challenging careears available and part of a universally well-respected profession",

    ),
  ];




}

class ClinicReviewer extends Clinic {
  String imagePath;
  String name;
  String comment;

  ClinicReviewer({


    this.imagePath ,
    this.name,
    this.comment,

  });

  ClinicReviewer copyWith({
    String imagePath,
    String name,
    String comment,
  }) =>
      ClinicReviewer(

          imagePath: imagePath ?? this.imagePath,
          name: name ?? this.name,
          comment: comment ?? this.comment


      );

  factory ClinicReviewer.fromRawJson(String str) => ClinicReviewer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ClinicReviewer.fromJson(Map<String, dynamic> json) => ClinicReviewer(
    imagePath: json["imagePath"] == null ? null : json["imagePath"],
    name: json["name"] == null ? null : json["name"],
    comment: json["comment"] == null ? null : json["comment"],


  );

  Map<String, dynamic> toJson() => {
    "imagePath": imagePath == null ? null : imagePath,
    "name": name == null ? null : name,
    "comment": comment == null ? null : comment,

  };


  static List<ClinicReviewer> clinicReviewer = <ClinicReviewer>[
    ClinicReviewer(
      imagePath: 'assets/clinicreviewer.png',
      name: 'Pevita Pearce',
      comment:'Saya memastikan bahwa klinik ini aman dan terpercaya. Layanan yang diberikan sungguh memuaskan',
    ),
    ClinicReviewer(
      imagePath: 'assets/clinicreviewer.png',
      name: 'Alfina',
      comment:'Saya memastikan bahwa klinik ini aman dan terpercaya. Layanan yang diberikan sungguh memuaskan',
    ),
    ClinicReviewer(
      imagePath: 'assets/clinicreviewer.png',
      name: 'Putri',
      comment:'Saya memastikan bahwa klinik ini aman dan terpercaya. Layanan yang diberikan sungguh memuaskan',
    ),
    ClinicReviewer(
      imagePath: 'assets/clinicreviewer.png',
      name: 'Alya',
      comment:'Saya memastikan bahwa klinik ini aman dan terpercaya. Layanan yang diberikan sungguh memuaskan',
    ),

    ClinicReviewer(
      imagePath: 'assets/clinicreviewer.png',
      name: 'Dewi',
      comment:'Saya memastikan bahwa klinik ini aman dan terpercaya. Layanan yang diberikan sungguh memuaskan',
    ),

    ClinicReviewer(
      imagePath: 'assets/clinicreviewer.png',
      name: 'Ivan',
      comment:'Saya memastikan bahwa klinik ini aman dan terpercaya. Layanan yang diberikan sungguh memuaskan',
    ),
  ];




}


class allClinicCard implements ISlidingCard {
  String title;
  String openHour;
  String closeHour;
  String location;
  String phone;

  double rating;
  String distance;
  String imagePath;

  allClinicCard({
    this.title = '',
    this.openHour,
    this.closeHour,
    this.location,
    this.phone,
    this.imagePath = '',
    this.rating = 0.0,
    this.distance = '0,0',
  });

  List<allClinicCard> get allClinic => [
    allClinicCard(
      imagePath: 'assets/zap.png',
      title: '',
      openHour: '09:00-AM',
      closeHour: '10:00-PM',
      location: 'South Jakarta',
      phone: '0812131278',
      rating: 4.8,
    ),
    allClinicCard(
      imagePath: 'assets/zap.png',
      title: '',
      openHour: '09:00-AM',
      closeHour: '10:00-PM',
      location: 'South Jakarta',
      phone: '0812131278',
      rating: 4.8,
    ),
    allClinicCard(
      imagePath: 'assets/zap.png',
      title: '',
      openHour: '09:00-AM',
      closeHour: '10:00-PM',
      location: 'South Jakarta',
      phone: '0812131278',


      rating: 4.8,
    ),
    allClinicCard(
      imagePath: 'assets/zap.png',
      title: '',
      openHour: '09:00-AM',
      closeHour: '10:00-PM',
      location: 'South Jakarta',
      phone: '0812131278',


      rating: 4.8,
    ),
  ];

  @override
  String cardTitle() => title;

  @override
  String cardLocation() => location;

  @override
  String cardImage() => imagePath;
}

//referensi : https://github.com/LanarsInc/hotel-booking-concept-flutter/blob/master/lib/screen/home_screen.dart