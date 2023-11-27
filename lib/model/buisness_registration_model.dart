class BusinessRegistrationModel {
    BusinessRegistrationModel({
        required this.businessname,
        required this.businesstype,
        required this.country,
        required this.state,
        required this.city,
        required this.postalcode,
        required this.address,
        required this.mobile,
        required this.currentaddress,
        required this.businessdesc,
        required this.businessmail,
        required this.businessweb,
    });

    final String? businessname;
    final String? businesstype;
    final String? country;
    final String? state;
    final String? city;
    final String? postalcode;
    final String? address;
    final String? mobile;
    final String? currentaddress;
    final String? businessdesc;
    final String? businessmail;
    final String? businessweb;

    factory BusinessRegistrationModel.fromJson(Map<String, dynamic> json){ 
        return BusinessRegistrationModel(
            businessname: json["businessname"],
            businesstype: json["businesstype"],
            country: json["country"],
            state: json["state"],
            city: json["city"],
            postalcode: json["postalcode"],
            address: json["address"],
            mobile: json["mobile"],
            currentaddress: json["currentaddress"],
            businessdesc: json["businessdesc"],
            businessmail: json["businessmail"],
            businessweb: json["businessweb"],
        );
    }

    Map<String, dynamic> toJson() => {
        "businessname": businessname,
        "businesstype": businesstype,
        "country": country,
        "state": state,
        "city": city,
        "postalcode": postalcode,
        "address": address,
        "mobile": mobile,
        "currentaddress": currentaddress,
        "businessdesc": businessdesc,
        "businessmail": businessmail,
        "businessweb": businessweb,
    };

}
