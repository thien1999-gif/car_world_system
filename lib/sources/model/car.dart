class Car {
  int id;
  String name;
  int brandId;
  String despcription;
  int yearOfManufactor;
  int price;
  String bodyType;
  String origin;
  double length;
  double width;
  double height;
  double displacement;
  String engineType;
  String maxPower;
  String maxTorque;
  double groundClearance;
  String turningRadius;
  String fuelConsumption;
  String gearBox;
  int seats;
  double kerbWeight;
  String fuelCapacity;
  String wheelSize;
  String tyreSize;
  String frontSuspension;
  String rearSuspension;
  String interiorMaterial;
  String headLights;
  String tailLights;
  String fogLamps;
  String image;
  String createdDate;
  bool isDeleted;
  // String brand;
  // List<Null> carAccessories;

  Car(
      {required this.id,
      required this.name,
      required this.brandId,
      required this.despcription,
      required this.yearOfManufactor,
      required this.price,
      required this.bodyType,
      required this.origin,
      required this.length,
      required this.width,
      required this.height,
      required this.displacement,
      required this.engineType,
      required this.maxPower,
      required this.maxTorque,
      required this.groundClearance,
      required this.turningRadius,
      required this.fuelConsumption,
      required this.gearBox,
      required this.seats,
      required this.kerbWeight,
      required this.fuelCapacity,
      required this.wheelSize,
      required this.tyreSize,
      required this.frontSuspension,
      required this.rearSuspension,
      required this.interiorMaterial,
      required this.headLights,
      required this.tailLights,
      required this.fogLamps,
      required this.image,
      required this.createdDate,
      required this.isDeleted,
      // required this.brand,
      // required this.carAccessories
      });

 factory Car.fromJson(Map<String, dynamic> json) {
   return Car(
    id : json['Id'],
    name : json['Name'],
    brandId : json['BrandId'],
    despcription : json['Despcription'],
    yearOfManufactor : json['YearOfManufactor'],
    price : json['Price'],
    bodyType : json['BodyType'],
    origin : json['Origin'],
    length : json['Length'],
    width : json['Width'],
    height : json['Height'],
    displacement : json['Displacement'],
    engineType : json['EngineType'],
    maxPower : json['MaxPower'],
    maxTorque : json['MaxTorque'],
    groundClearance : json['GroundClearance'],
    turningRadius : json['TurningRadius'],
    fuelConsumption : json['FuelConsumption'],
    gearBox : json['GearBox'],
    seats : json['Seats'],
    kerbWeight : json['KerbWeight'],
    fuelCapacity : json['FuelCapacity'],
    wheelSize : json['WheelSize'],
    tyreSize : json['TyreSize'],
    frontSuspension : json['FrontSuspension'],
    rearSuspension : json['RearSuspension'],
    interiorMaterial : json['InteriorMaterial'],
    headLights : json['HeadLights'],
    tailLights : json['TailLights'],
    fogLamps : json['FogLamps'],
    image : json['Image'],
    createdDate : json['CreatedDate'],
    isDeleted : json['IsDeleted'],
    // brand : json['Brand'],
   );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['BrandId'] = this.brandId;
    data['Despcription'] = this.despcription;
    data['YearOfManufactor'] = this.yearOfManufactor;
    data['Price'] = this.price;
    data['BodyType'] = this.bodyType;
    data['Origin'] = this.origin;
    data['Length'] = this.length;
    data['Width'] = this.width;
    data['Height'] = this.height;
    data['Displacement'] = this.displacement;
    data['EngineType'] = this.engineType;
    data['MaxPower'] = this.maxPower;
    data['MaxTorque'] = this.maxTorque;
    data['GroundClearance'] = this.groundClearance;
    data['TurningRadius'] = this.turningRadius;
    data['FuelConsumption'] = this.fuelConsumption;
    data['GearBox'] = this.gearBox;
    data['Seats'] = this.seats;
    data['KerbWeight'] = this.kerbWeight;
    data['FuelCapacity'] = this.fuelCapacity;
    data['WheelSize'] = this.wheelSize;
    data['TyreSize'] = this.tyreSize;
    data['FrontSuspension'] = this.frontSuspension;
    data['RearSuspension'] = this.rearSuspension;
    data['InteriorMaterial'] = this.interiorMaterial;
    data['HeadLights'] = this.headLights;
    data['TailLights'] = this.tailLights;
    data['FogLamps'] = this.fogLamps;
    data['Image'] = this.image;
    data['CreatedDate'] = this.createdDate;
    data['IsDeleted'] = this.isDeleted;
    // data['Brand'] = this.brand;
  
    return data;
  }
}
