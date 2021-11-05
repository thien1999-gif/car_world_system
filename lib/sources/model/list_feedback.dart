// To parse this JSON data, do
//
//     final listFeedback = listFeedbackFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ListFeedback> listFeedbackFromJson(String str) => List<ListFeedback>.from(json.decode(str).map((x) => ListFeedback.fromJson(x)));

String listFeedbackToJson(List<ListFeedback> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListFeedback {
    ListFeedback({
        required this.id,
        required this.feedbackUserId,
        required this.type,
        required this.feedbackContent,
        required this.feedbackDate,
        required this.replyUserId,
        required this.replyContent,
        required this.replyDate,
        required this.feedbackUser,
        required this.replyUser,
        // @required this.contestEventRegisters,
        // @required this.exchangeResponses,
        // @required this.exchanges,
    });

    String id;
    int feedbackUserId;
    int type;
    String feedbackContent;
    String feedbackDate;
    int replyUserId;
    String replyContent;
    String replyDate;
    dynamic feedbackUser;
    ReplyUser replyUser;
    // List<ContestEventRegister> contestEventRegisters;
    // List<ExchangeResponse> exchangeResponses;
    // List<dynamic> exchanges;

    factory ListFeedback.fromJson(Map<String, dynamic> json) => ListFeedback(
        id: json["Id"],
        feedbackUserId: json["FeedbackUserId"],
        type: json["Type"],
        feedbackContent: json["FeedbackContent"],
        feedbackDate:json["FeedbackDate"],
        replyUserId: json["ReplyUserId"] == null ? null : json["ReplyUserId"],
        replyContent: json["ReplyContent"] == null ? null : json["ReplyContent"],
        replyDate: json["ReplyDate"] == null ? null : json["ReplyDate"],
        feedbackUser: json["FeedbackUser"],
        replyUser: json["ReplyUser"] == null ? null?.length : ReplyUser.fromJson(json["ReplyUser"]),
        // contestEventRegisters: List<ContestEventRegister>.from(json["ContestEventRegisters"].map((x) => ContestEventRegister.fromJson(x))),
        // exchangeResponses: List<ExchangeResponse>.from(json["ExchangeResponses"].map((x) => ExchangeResponse.fromJson(x))),
        // exchanges: List<dynamic>.from(json["Exchanges"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "FeedbackUserId": feedbackUserId,
        "Type": type,
        "FeedbackContent": feedbackContent,
        "FeedbackDate": feedbackDate,
        "ReplyUserId": replyUserId == null ? null : replyUserId,
        "ReplyContent": replyContent == null ? null : replyContent,
        "ReplyDate": replyDate == null ? null : replyDate,
        "FeedbackUser": feedbackUser,
        "ReplyUser": replyUser == null ? null : replyUser.toJson(),
        // "ContestEventRegisters": List<dynamic>.from(contestEventRegisters.map((x) => x.toJson())),
        // "ExchangeResponses": List<dynamic>.from(exchangeResponses.map((x) => x.toJson())),
        // "Exchanges": List<dynamic>.from(exchanges.map((x) => x)),
    };
}



class ReplyUser {
    ReplyUser({
        required this.id,
        required this.email,
        required this.fullName,
        required this.username,
        required this.password,
        required this.roleId,
        required this.tokenWeb,
        required this.tokenMobile,
        required this.image,
        required this.gender,
        required this.yearOfBirth,
        required this.phone,
      required this.address,
        required this.createdDate,
        required this.status,
        required this.exchangePost,
        required this.role,
        required this.contestEventCreatedByNavigations,
        required this.contestEventModifiedByNavigations,
        required this.contestEventRegisters,
        required this.contestPrizeManagers,
        required this.contestPrizeUsers,
        required this.exchangeResponses,
        required this.exchanges,
        required this.feedbackFeedbackUsers,
        required this.feedbackReplyUsers,
        required this.postCreatedByNavigations,
        required this.postModifiedByNavigations,
        required this.proposalManagers,
        required this.proposalUsers,
    });

    int id;
    String email;
    String fullName;
    String username;
    String password;
    int roleId;
    String tokenWeb;
    dynamic tokenMobile;
    String image;
    dynamic gender;
    dynamic yearOfBirth;
    String phone;
    String address;
    DateTime createdDate;
    int status;
    dynamic exchangePost;
    dynamic role;
    List<dynamic> contestEventCreatedByNavigations;
    List<dynamic> contestEventModifiedByNavigations;
    List<dynamic> contestEventRegisters;
    List<dynamic> contestPrizeManagers;
    List<dynamic> contestPrizeUsers;
    List<dynamic> exchangeResponses;
    List<dynamic> exchanges;
    List<dynamic> feedbackFeedbackUsers;
    List<dynamic> feedbackReplyUsers;
    List<dynamic> postCreatedByNavigations;
    List<dynamic> postModifiedByNavigations;
    List<dynamic> proposalManagers;
    List<dynamic> proposalUsers;

    factory ReplyUser.fromJson(Map<String, dynamic> json) => ReplyUser(
        id: json["Id"],
        email: json["Email"],
        fullName: json["FullName"],
        username: json["Username"],
        password: json["Password"],
        roleId: json["RoleId"],
        tokenWeb: json["TokenWeb"],
        tokenMobile: json["TokenMobile"],
        image: json["Image"],
        gender: json["Gender"],
        yearOfBirth: json["YearOfBirth"],
        phone: json["Phone"],
        address: json["Address"],
        createdDate: DateTime.parse(json["CreatedDate"]),
        status: json["Status"],
        exchangePost: json["ExchangePost"],
        role: json["Role"],
        contestEventCreatedByNavigations: List<dynamic>.from(json["ContestEventCreatedByNavigations"].map((x) => x)),
        contestEventModifiedByNavigations: List<dynamic>.from(json["ContestEventModifiedByNavigations"].map((x) => x)),
        contestEventRegisters: List<dynamic>.from(json["ContestEventRegisters"].map((x) => x)),
        contestPrizeManagers: List<dynamic>.from(json["ContestPrizeManagers"].map((x) => x)),
        contestPrizeUsers: List<dynamic>.from(json["ContestPrizeUsers"].map((x) => x)),
        exchangeResponses: List<dynamic>.from(json["ExchangeResponses"].map((x) => x)),
        exchanges: List<dynamic>.from(json["Exchanges"].map((x) => x)),
        feedbackFeedbackUsers: List<dynamic>.from(json["FeedbackFeedbackUsers"].map((x) => x)),
        feedbackReplyUsers: List<dynamic>.from(json["FeedbackReplyUsers"].map((x) => x)),
        postCreatedByNavigations: List<dynamic>.from(json["PostCreatedByNavigations"].map((x) => x)),
        postModifiedByNavigations: List<dynamic>.from(json["PostModifiedByNavigations"].map((x) => x)),
        proposalManagers: List<dynamic>.from(json["ProposalManagers"].map((x) => x)),
        proposalUsers: List<dynamic>.from(json["ProposalUsers"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Email": email,
        "FullName": fullName,
        "Username": username,
        "Password": password,
        "RoleId": roleId,
        "TokenWeb": tokenWeb,
        "TokenMobile": tokenMobile,
        "Image": image,
        "Gender": gender,
        "YearOfBirth": yearOfBirth,
        "Phone": phone,
        "Address": address,
        "CreatedDate": createdDate.toIso8601String(),
        "Status": status,
        "ExchangePost": exchangePost,
        "Role": role,
        "ContestEventCreatedByNavigations": List<dynamic>.from(contestEventCreatedByNavigations.map((x) => x)),
        "ContestEventModifiedByNavigations": List<dynamic>.from(contestEventModifiedByNavigations.map((x) => x)),
        "ContestEventRegisters": List<dynamic>.from(contestEventRegisters.map((x) => x)),
        "ContestPrizeManagers": List<dynamic>.from(contestPrizeManagers.map((x) => x)),
        "ContestPrizeUsers": List<dynamic>.from(contestPrizeUsers.map((x) => x)),
        "ExchangeResponses": List<dynamic>.from(exchangeResponses.map((x) => x)),
        "Exchanges": List<dynamic>.from(exchanges.map((x) => x)),
        "FeedbackFeedbackUsers": List<dynamic>.from(feedbackFeedbackUsers.map((x) => x)),
        "FeedbackReplyUsers": List<dynamic>.from(feedbackReplyUsers.map((x) => x)),
        "PostCreatedByNavigations": List<dynamic>.from(postCreatedByNavigations.map((x) => x)),
        "PostModifiedByNavigations": List<dynamic>.from(postModifiedByNavigations.map((x) => x)),
        "ProposalManagers": List<dynamic>.from(proposalManagers.map((x) => x)),
        "ProposalUsers": List<dynamic>.from(proposalUsers.map((x) => x)),
    };
}
