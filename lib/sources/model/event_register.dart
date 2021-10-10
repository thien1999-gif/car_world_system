import 'package:car_world_system/sources/model/event.dart';

class EventRegister {
  int id;
  int eventId;
  int userId;
  String registerDate;
  int status;
  // Null evaluation;
  // Null feedbackId;
  Event event;
  // Null feedback;
  // Null user;

  EventRegister({
    required this.id,
    required this.eventId,
    required this.userId,
    required this.registerDate,
    required this.status,
    // this.evaluation,
    // this.feedbackId,
    required this.event,
    // this.feedback,
    // this.user
  });

  factory EventRegister.fromJson(Map<String, dynamic> json) {
    return EventRegister(
      id: json['Id'],
      eventId: json['EventId'],
      userId: json['UserId'],
      registerDate: json['RegisterDate'],
      status: json['Status'],
      // evaluation = json['Evaluation'];
      // feedbackId = json['FeedbackId'];
      event:
          (json['Event'] != null ? new Event.fromJson(json['Event']) : null)!,
      // feedback = json['Feedback'];
      // user = json['User'];
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['EventId'] = this.eventId;
    data['UserId'] = this.userId;
    data['RegisterDate'] = this.registerDate;
    data['Status'] = this.status;
    // data['Evaluation'] = this.evaluation;
    // data['FeedbackId'] = this.feedbackId;
    if (this.event != null) {
      data['Event'] = this.event.toJson();
    }
    // data['Feedback'] = this.feedback;
    // data['User'] = this.user;
    return data;
  }
}

// class Event {
//   int id;
//   int createdBy;
//   String title;
//   String description;
//   String venue;
//   String image;
//   int minParticipants;
//   int maxParticipants;
//   String startRegister;
//   String endRegister;
//   String startDate;
//   String endDate;
//   int currentParticipants;
//   double rating;
//   int status;
//   String createdDate;
//   // Null modifiedBy;
//   // Null modifiedDate;
//   // Null proposalId;
//   // Null createdByNavigation;
//   // Null modifiedByNavigation;
//   // Null proposal;
//   // List<UserEvents> userEvents;

//   Event({
//     required this.id,
//     required this.createdBy,
//     required this.title,
//     required this.description,
//     required this.venue,
//     required this.image,
//     required this.minParticipants,
//     required this.maxParticipants,
//     required this.startRegister,
//     required this.endRegister,
//     required this.startDate,
//     required this.endDate,
//     required this.currentParticipants,
//     required this.rating,
//     required this.status,
//     required this.createdDate,
//     // this.modifiedBy,
//     // this.modifiedDate,
//     // this.proposalId,
//     // this.createdByNavigation,
//     // this.modifiedByNavigation,
//     // this.proposal,
//     // this.userEvents
//   });

//   factory Event.fromJson(Map<String, dynamic> json) {
//     return Event(
//       id: json['Id'],
//       createdBy: json['CreatedBy'],
//       title: json['Title'],
//       description: json['Description'],
//       venue: json['Venue'],
//       image: json['Image'],
//       minParticipants: json['MinParticipants'],
//       maxParticipants: json['MaxParticipants'],
//       startRegister: json['StartRegister'],
//       endRegister: json['EndRegister'],
//       startDate: json['StartDate'],
//       endDate: json['EndDate'],
//       currentParticipants: json['CurrentParticipants'],
//       rating: json['Rating'],
//       status: json['Status'],
//       createdDate: json['CreatedDate'],
//       // modifiedBy = json['ModifiedBy'];
//       // modifiedDate = json['ModifiedDate'];
//       // proposalId = json['ProposalId'];
//       // createdByNavigation = json['CreatedByNavigation'];
//       // modifiedByNavigation = json['ModifiedByNavigation'];
//       // proposal = json['Proposal'];
//       // if (json['UserEvents'] != null) {
//       //   userEvents = new List<UserEvents>();
//       //   json['UserEvents'].forEach((v) {
//       //     userEvents.add(new UserEvents.fromJson(v));
//       //   });
//       // }
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Id'] = this.id;
//     data['CreatedBy'] = this.createdBy;
//     data['Title'] = this.title;
//     data['Description'] = this.description;
//     data['Venue'] = this.venue;
//     data['Image'] = this.image;
//     data['MinParticipants'] = this.minParticipants;
//     data['MaxParticipants'] = this.maxParticipants;
//     data['StartRegister'] = this.startRegister;
//     data['EndRegister'] = this.endRegister;
//     data['StartDate'] = this.startDate;
//     data['EndDate'] = this.endDate;
//     data['CurrentParticipants'] = this.currentParticipants;
//     data['Rating'] = this.rating;
//     data['Status'] = this.status;
//     data['CreatedDate'] = this.createdDate;
//     // data['ModifiedBy'] = this.modifiedBy;
//     // data['ModifiedDate'] = this.modifiedDate;
//     // data['ProposalId'] = this.proposalId;
//     // data['CreatedByNavigation'] = this.createdByNavigation;
//     // data['ModifiedByNavigation'] = this.modifiedByNavigation;
//     // data['Proposal'] = this.proposal;
//     // if (this.userEvents != null) {
//     //   data['UserEvents'] = this.userEvents.map((v) => v.toJson()).toList();
//     // }
//     return data;
//   }
// }

// class UserEvents {
//   int id;
//   int eventId;
//   int userId;
//   String registerDate;
//   int status;
//   Null evaluation;
//   Null feedbackId;
//   Null feedback;
//   Null user;

//   UserEvents(
//       {this.id,
//       this.eventId,
//       this.userId,
//       this.registerDate,
//       this.status,
//       this.evaluation,
//       this.feedbackId,
//       this.feedback,
//       this.user});

//   UserEvents.fromJson(Map<String, dynamic> json) {
//     id = json['Id'];
//     eventId = json['EventId'];
//     userId = json['UserId'];
//     registerDate = json['RegisterDate'];
//     status = json['Status'];
//     evaluation = json['Evaluation'];
//     feedbackId = json['FeedbackId'];
//     feedback = json['Feedback'];
//     user = json['User'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Id'] = this.id;
//     data['EventId'] = this.eventId;
//     data['UserId'] = this.userId;
//     data['RegisterDate'] = this.registerDate;
//     data['Status'] = this.status;
//     data['Evaluation'] = this.evaluation;
//     data['FeedbackId'] = this.feedbackId;
//     data['Feedback'] = this.feedback;
//     data['User'] = this.user;
//     return data;
//   }
// }