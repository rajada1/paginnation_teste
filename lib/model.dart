// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
    DataModel({
        this.totalPassengers,
        this.totalPages,
        this.data,
    });

    int totalPassengers;
    int totalPages;
    List<Datum> data;

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        totalPassengers: json["totalPassengers"],
        totalPages: json["totalPages"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "totalPassengers": totalPassengers,
        "totalPages": totalPages,
        "data": List<Datum>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.name,
        this.trips,
        this.airline,
        this.v,
    });

    String id;
    String name;
    int trips;
    dynamic airline;
    int v;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        trips: json["trips"],
        airline: json["airline"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "trips": trips,
        "airline": airline,
        "__v": v,
    };
}

class AirlineElement {
    AirlineElement({
        this.airlineId,
        this.name,
        this.country,
        this.logo,
        this.slogan,
        this.headQuaters,
        this.website,
        this.established,
        this.id,
        this.v,
    });

    int airlineId;
    String name;
    String country;
    String logo;
    String slogan;
    String headQuaters;
    String website;
    String established;
    String id;
    int v;

    factory AirlineElement.fromJson(Map<String, dynamic> json) => AirlineElement(
        airlineId: json["id"],
        name: json["name"],
        country: json["country"],
        logo: json["logo"],
        slogan: json["slogan"],
        headQuaters: json["head_quaters"],
        website: json["website"],
        established: json["established"],
        id: json["_id"] == null ? null : json["_id"],
        v: json["__v"] == null ? null : json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "id": airlineId,
        "name": name,
        "country": country,
        "logo": logo,
        "slogan": slogan,
        "head_quaters": headQuaters,
        "website": website,
        "established": established,
        "_id": id == null ? null : id,
        "__v": v == null ? null : v,
    };
}
