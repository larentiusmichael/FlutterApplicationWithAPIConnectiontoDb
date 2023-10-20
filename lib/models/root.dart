/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/

class Root {
  Value? value;
  //final List<Value>? value;

  Root({this.value});

  Root.fromJson(Map<String, dynamic> json) {
    if (json.isNotEmpty) {
      print(json["regDate"].toString()); // Example: Print the "registerCode"
      value = Value.fromJson(json);
    } else {
      print("VALUE IS NULL");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (value != null) {
      data['value'] = value!.toJson();
    }
    return data;
  }
}

class Value {
  String? registerCode;
  String? model;
  String? customerCode;
  String? chasisNo;
  String? remarks;
  String? mileageType;
  String? engineNo;
  DateTime? regDate;
  double? nextMileage;
  DateTime? nextDate;
  int? display;
  String? colour;
  String? companyCar;
  String? ownerName;
  String? address1;
  String? address2;
  String? address3;
  String? address4;
  String? hpTelephone;
  String? telephone;
  String? fax;
  String? contactPerson;
  String? type;
  String? yearMade;
  String? brand;
  String? intercooler;
  String? turbo;
  String? axle;
  double? btm;
  double? bdm;
  DateTime? puspakomDueDate;
  DateTime? roadTaxDueDate;
  DateTime? aPermitDueDate;

  Value({this.registerCode, this.model, this.customerCode, this.chasisNo, this.remarks, this.mileageType, this.engineNo, this.regDate, this.nextMileage, this.nextDate, this.display, this.colour, this.companyCar, this.ownerName, this.address1, this.address2, this.address3, this.address4, this.hpTelephone, this.telephone, this.fax, this.contactPerson, this.type, this.yearMade, this.brand, this.intercooler, this.turbo, this.axle, this.btm, this.bdm, this.puspakomDueDate, this.roadTaxDueDate, this.aPermitDueDate});

  Value.fromJson(Map<String, dynamic> json) {
    //registerCode = json['registerCode'];
    //registerCode = json['name'];
    registerCode = json['registerCode'];
    model = json['model'];
    customerCode = json['customerCode'];
    chasisNo = json['chasisNo'];
    remarks = json['remarks'];
    mileageType = json['mileageType'];
    engineNo = json['engineNo'];
    regDate = json['regDate'] != null ? DateTime.parse(json['regDate']) : null;
    nextMileage = json['nextMileage'];
    nextDate = json['nextDate'] != null ? DateTime.parse(json['nextDate']) : null;
    display = json['display'];
    colour = json['colour'];
    companyCar = json['companyCar'];
    ownerName = json['ownerName'];
    address1 = json['address1'];
    address2 = json['address2'];
    address3 = json['address3'];
    address4 = json['address4'];
    hpTelephone = json['hpTelephone'];
    telephone = json['telephone'];
    fax = json['fax'];
    contactPerson = json['contactPerson'];
    type = json['type'];
    yearMade = json['yearMade'];
    brand = json['brand'];
    intercooler = json['intercooler'];
    turbo = json['turbo'];
    axle = json['axle'];
    btm = json['btm'];
    bdm = json['bdm'];
    puspakomDueDate = json['puspakomDueDate'] != null ? DateTime.parse(json['puspakomDueDate']) : null;
    roadTaxDueDate = json['roadTaxDueDate'] != null ? DateTime.parse(json['roadTaxDueDate']) : null;
    aPermitDueDate = json['aPermitDueDate'] != null ? DateTime.parse(json['aPermitDueDate']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['registerCode'] = registerCode;
    data['model'] = model;
    data['customerCode'] = customerCode;
    data['chasisNo'] = chasisNo;
    data['remarks'] = remarks;
    data['mileageType'] = mileageType;
    data['engineNo'] = engineNo;
    data['regDate'] = regDate;
    data['nextMileage'] = nextMileage;
    data['nextDate'] = nextDate;
    data['display'] = display;
    data['colour'] = colour;
    data['companyCar'] = companyCar;
    data['ownerName'] = ownerName;
    data['address1'] = address1;
    data['address2'] = address2;
    data['address3'] = address3;
    data['address4'] = address4;
    data['hpTelephone'] = hpTelephone;
    data['telephone'] = telephone;
    data['fax'] = fax;
    data['contactPerson'] = contactPerson;
    data['type'] = type;
    data['yearMade'] = yearMade;
    data['brand'] = brand;
    data['intercooler'] = intercooler;
    data['turbo'] = turbo;
    data['axle'] = axle;
    data['btm'] = btm;
    data['bdm'] = bdm;
    data['puspakomDueDate'] = puspakomDueDate;
    data['roadTaxDueDate'] = roadTaxDueDate;
    data['aPermitDueDate'] = aPermitDueDate;
    return data;
  }
}



// class Root {
//   String? name;
//   String? country;
//   String? alphaTwoCode;
//   List<String>? webPages;
//
//   Root({
//     this.name,
//     this.country,
//     this.alphaTwoCode,
//     this.webPages,
//   });
//
//   factory Root.fromJson(Map<String, dynamic> json) {
//     return Root(
//       name: json['name'],
//       country: json['country'],
//       alphaTwoCode: json['alpha_two_code'],
//       webPages: (json['web_pages'] as List).cast<String>(),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['country'] = this.country;
//     data['alpha_two_code'] = this.alphaTwoCode;
//     data['web_pages'] = this.webPages;
//     return data;
//   }
// }
