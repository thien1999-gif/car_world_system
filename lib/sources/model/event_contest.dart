// To parse this JSON data, do
//
//     final eventContest = eventContestFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<EventContest> eventContestFromJson(String str) => List<EventContest>.from(json.decode(str).map((x) => EventContest.fromJson(x)));

String eventContestToJson(List<EventContest> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventContest {
    EventContest({
        required this.id,
        required this.type,
        required this.title,
        required this.description,
        required this.venue,
        required this.image,
        required this.minParticipants,
        required this.maxParticipants,
        required this.startRegister,
        required this.endRegister,
        required this.startDate,
        required this.endDate,
        required this.fee,
        required this.currentParticipants,
        required this.rating,
        required this.status,
        required this.createdBy,
        required this.createdDate,
        // @required this.modifiedBy,
        // @required this.modifiedDate,
        // @required this.proposalId,
        // @required this.createdByNavigation,
        // @required this.modifiedByNavigation,
        // @required this.proposal,
        // @required this.contestEventRegisters,
        // @required this.contestPrizes,
    });

    String id;
    int type;
    String title;
    String description;
    String venue;
    String image;
    int minParticipants;
    int maxParticipants;
    String startRegister;
    String endRegister;
    String startDate;
    String endDate;
    int fee;
    int currentParticipants;
    double rating;
    int status;
    int createdBy;
    String createdDate;
    // dynamic modifiedBy;
    // dynamic modifiedDate;
    // dynamic proposalId;
    // CreatedByNavigation createdByNavigation;
    // dynamic modifiedByNavigation;
    // dynamic proposal;
    // List<dynamic> contestEventRegisters;
    // List<dynamic> contestPrizes;

    factory EventContest.fromJson(Map<String, dynamic> json) => EventContest(
        id: json["Id"],
        type: json["Type"],
        title: json["Title"],
        description: json["Description"],
        venue: json["Venue"],
        image: json["Image"],
        minParticipants: json["MinParticipants"],
        maxParticipants: json["MaxParticipants"],
        startRegister: json["StartRegister"],
        endRegister: json["EndRegister"],
        startDate: json["StartDate"],
        endDate: json["EndDate"],
        fee: json["Fee"],
        currentParticipants: json["CurrentParticipants"],
        rating: json["Rating"],
        status: json["Status"],
        createdBy: json["CreatedBy"],
        createdDate: json["CreatedDate"],
        // modifiedBy: json["ModifiedBy"],
        // modifiedDate: json["ModifiedDate"],
        // proposalId: json["ProposalId"],
        // createdByNavigation: CreatedByNavigation.fromJson(json["CreatedByNavigation"]),
        // modifiedByNavigation: json["ModifiedByNavigation"],
        // proposal: json["Proposal"],
        // contestEventRegisters: List<dynamic>.from(json["ContestEventRegisters"].map((x) => x)),
        // contestPrizes: List<dynamic>.from(json["ContestPrizes"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Type": type,
        "Title": title,
        "Description": description,
        "Venue": venue,
        "Image": image,
        "MinParticipants": minParticipants,
        "MaxParticipants": maxParticipants,
        "StartRegister": startRegister,
        "EndRegister": endRegister,
        "StartDate": startDate,
        "EndDate": endDate,
        "Fee": fee,
        "CurrentParticipants": currentParticipants,
        "Rating": rating,
        "Status": status,
        "CreatedBy": createdBy,
        "CreatedDate": createdDate,
        // "ModifiedBy": modifiedBy,
        // "ModifiedDate": modifiedDate,
        // "ProposalId": proposalId,
        // "CreatedByNavigation": createdByNavigation.toJson(),
        // "ModifiedByNavigation": modifiedByNavigation,
        // "Proposal": proposal,
        // "ContestEventRegisters": List<dynamic>.from(contestEventRegisters.map((x) => x)),
        // "ContestPrizes": List<dynamic>.from(contestPrizes.map((x) => x)),
    };
}

// class CreatedByNavigation {
//     CreatedByNavigation({
//         @required this.id,
//         @required this.email,
//         @required this.fullName,
//         @required this.username,
//         @required this.password,
//         @required this.roleId,
//         @required this.tokenWeb,
//         @required this.tokenMobile,
//         @required this.image,
//         @required this.phone,
//         @required this.address,
//         @required this.latitude,
//         @required this.longitude,
//         @required this.createdDate,
//         @required this.status,
//         @required this.exchangePost,
//         @required this.role,
//         @required this.contestEventCreatedByNavigations,
//         @required this.contestEventModifiedByNavigations,
//         @required this.contestEventRegisters,
//         @required this.contestPrizeManagers,
//         @required this.contestPrizeUsers,
//         @required this.exchangeResponses,
//         @required this.exchanges,
//         @required this.feedbackFeedbackUsers,
//         @required this.feedbackReplyUsers,
//         @required this.postCreatedByNavigations,
//         @required this.postModifiedByNavigations,
//         @required this.proposalManagers,
//         @required this.proposalUsers,
//     });

//     int id;
//     String email;
//     String fullName;
//     String username;
//     String password;
//     int roleId;
//     String tokenWeb;
//     dynamic tokenMobile;
//     String image;
//     String phone;
//     String address;
//     dynamic latitude;
//     dynamic longitude;
//     DateTime createdDate;
//     int status;
//     dynamic exchangePost;
//     dynamic role;
//     List<dynamic> contestEventCreatedByNavigations;
//     List<dynamic> contestEventModifiedByNavigations;
//     List<dynamic> contestEventRegisters;
//     List<dynamic> contestPrizeManagers;
//     List<dynamic> contestPrizeUsers;
//     List<dynamic> exchangeResponses;
//     List<dynamic> exchanges;
//     List<dynamic> feedbackFeedbackUsers;
//     List<dynamic> feedbackReplyUsers;
//     List<dynamic> postCreatedByNavigations;
//     List<dynamic> postModifiedByNavigations;
//     List<dynamic> proposalManagers;
//     List<dynamic> proposalUsers;

//     factory CreatedByNavigation.fromJson(Map<String, dynamic> json) => CreatedByNavigation(
//         id: json["Id"],
//         email: json["Email"],
//         fullName: json["FullName"],
//         username: json["Username"],
//         password: json["Password"],
//         roleId: json["RoleId"],
//         tokenWeb: json["TokenWeb"],
//         tokenMobile: json["TokenMobile"],
//         image: json["Image"],
//         phone: json["Phone"],
//         address: json["Address"],
//         latitude: json["Latitude"],
//         longitude: json["Longitude"],
//         createdDate: DateTime.parse(json["CreatedDate"]),
//         status: json["Status"],
//         exchangePost: json["ExchangePost"],
//         role: json["Role"],
//         contestEventCreatedByNavigations: List<dynamic>.from(json["ContestEventCreatedByNavigations"].map((x) => x)),
//         contestEventModifiedByNavigations: List<dynamic>.from(json["ContestEventModifiedByNavigations"].map((x) => x)),
//         contestEventRegisters: List<dynamic>.from(json["ContestEventRegisters"].map((x) => x)),
//         contestPrizeManagers: List<dynamic>.from(json["ContestPrizeManagers"].map((x) => x)),
//         contestPrizeUsers: List<dynamic>.from(json["ContestPrizeUsers"].map((x) => x)),
//         exchangeResponses: List<dynamic>.from(json["ExchangeResponses"].map((x) => x)),
//         exchanges: List<dynamic>.from(json["Exchanges"].map((x) => x)),
//         feedbackFeedbackUsers: List<dynamic>.from(json["FeedbackFeedbackUsers"].map((x) => x)),
//         feedbackReplyUsers: List<dynamic>.from(json["FeedbackReplyUsers"].map((x) => x)),
//         postCreatedByNavigations: List<dynamic>.from(json["PostCreatedByNavigations"].map((x) => x)),
//         postModifiedByNavigations: List<dynamic>.from(json["PostModifiedByNavigations"].map((x) => x)),
//         proposalManagers: List<dynamic>.from(json["ProposalManagers"].map((x) => x)),
//         proposalUsers: List<dynamic>.from(json["ProposalUsers"].map((x) => x)),
//     );

//     Map<String, dynamic> toJson() => {
//         "Id": id,
//         "Email": email,
//         "FullName": fullName,
//         "Username": username,
//         "Password": password,
//         "RoleId": roleId,
//         "TokenWeb": tokenWeb,
//         "TokenMobile": tokenMobile,
//         "Image": image,
//         "Phone": phone,
//         "Address": address,
//         "Latitude": latitude,
//         "Longitude": longitude,
//         "CreatedDate": createdDate.toIso8601String(),
//         "Status": status,
//         "ExchangePost": exchangePost,
//         "Role": role,
//         "ContestEventCreatedByNavigations": List<dynamic>.from(contestEventCreatedByNavigations.map((x) => x)),
//         "ContestEventModifiedByNavigations": List<dynamic>.from(contestEventModifiedByNavigations.map((x) => x)),
//         "ContestEventRegisters": List<dynamic>.from(contestEventRegisters.map((x) => x)),
//         "ContestPrizeManagers": List<dynamic>.from(contestPrizeManagers.map((x) => x)),
//         "ContestPrizeUsers": List<dynamic>.from(contestPrizeUsers.map((x) => x)),
//         "ExchangeResponses": List<dynamic>.from(exchangeResponses.map((x) => x)),
//         "Exchanges": List<dynamic>.from(exchanges.map((x) => x)),
//         "FeedbackFeedbackUsers": List<dynamic>.from(feedbackFeedbackUsers.map((x) => x)),
//         "FeedbackReplyUsers": List<dynamic>.from(feedbackReplyUsers.map((x) => x)),
//         "PostCreatedByNavigations": List<dynamic>.from(postCreatedByNavigations.map((x) => x)),
//         "PostModifiedByNavigations": List<dynamic>.from(postModifiedByNavigations.map((x) => x)),
//         "ProposalManagers": List<dynamic>.from(proposalManagers.map((x) => x)),
//         "ProposalUsers": List<dynamic>.from(proposalUsers.map((x) => x)),
//     };
// }
