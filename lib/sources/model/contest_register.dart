import 'package:car_world_system/sources/model/contest.dart';

class ContestRegister {
  int id;
  int contestId;
  int userId;
  String registerDate;
  int status;
  // Null evaluation;
  // Null feedbackId;
  Contest contest;
  // Null feedback;
  // Null user;

  ContestRegister({
    required this.id,
    required this.contestId,
    required this.userId,
    required this.registerDate,
    required this.status,
    // this.evaluation,
    // this.feedbackId,
    required this.contest,
    // this.feedback,
    // this.user
  });

  factory ContestRegister.fromJson(Map<String, dynamic> json) {
    return ContestRegister(
      id: json['Id'],
      contestId: json['ContestId'],
      userId: json['UserId'],
      registerDate: json['RegisterDate'],
      status: json['Status'],
      // evaluation = json['Evaluation'];
      // feedbackId = json['FeedbackId'];
      contest: (json['Contest'] != null
          ? new Contest.fromJson(json['Contest'])
          : null)!,
      // feedback = json['Feedback'];
      // user = json['User'];
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['ContestId'] = this.contestId;
    data['UserId'] = this.userId;
    data['RegisterDate'] = this.registerDate;
    data['Status'] = this.status;
    // data['Evaluation'] = this.evaluation;
    // data['FeedbackId'] = this.feedbackId;
    if (this.contest != null) {
      data['Contest'] = this.contest.toJson();
    }
    // data['Feedback'] = this.feedback;
    // data['User'] = this.user;
    return data;
  }
}

// class Contest {
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
//   int fee;
//   int currentParticipants;
//   Null rating;
//   int status;
//   String createdDate;
//   Null modifiedBy;
//   Null modifiedDate;
//   Null proposalId;
//   Null createdByNavigation;
//   Null modifiedByNavigation;
//   Null proposal;
//   List<Null> contestPrizes;
//   List<Null> userContests;

//   Contest(
//       {this.id,
//       this.createdBy,
//       this.title,
//       this.description,
//       this.venue,
//       this.image,
//       this.minParticipants,
//       this.maxParticipants,
//       this.startRegister,
//       this.endRegister,
//       this.startDate,
//       this.endDate,
//       this.fee,
//       this.currentParticipants,
//       this.rating,
//       this.status,
//       this.createdDate,
//       this.modifiedBy,
//       this.modifiedDate,
//       this.proposalId,
//       this.createdByNavigation,
//       this.modifiedByNavigation,
//       this.proposal,
//       this.contestPrizes,
//       this.userContests});

//   Contest.fromJson(Map<String, dynamic> json) {
//     id = json['Id'];
//     createdBy = json['CreatedBy'];
//     title = json['Title'];
//     description = json['Description'];
//     venue = json['Venue'];
//     image = json['Image'];
//     minParticipants = json['MinParticipants'];
//     maxParticipants = json['MaxParticipants'];
//     startRegister = json['StartRegister'];
//     endRegister = json['EndRegister'];
//     startDate = json['StartDate'];
//     endDate = json['EndDate'];
//     fee = json['Fee'];
//     currentParticipants = json['CurrentParticipants'];
//     rating = json['Rating'];
//     status = json['Status'];
//     createdDate = json['CreatedDate'];
//     modifiedBy = json['ModifiedBy'];
//     modifiedDate = json['ModifiedDate'];
//     proposalId = json['ProposalId'];
//     createdByNavigation = json['CreatedByNavigation'];
//     modifiedByNavigation = json['ModifiedByNavigation'];
//     proposal = json['Proposal'];
//     if (json['ContestPrizes'] != null) {
//       contestPrizes = new List<Null>();
//       json['ContestPrizes'].forEach((v) {
//         contestPrizes.add(new Null.fromJson(v));
//       });
//     }
//     if (json['UserContests'] != null) {
//       userContests = new List<Null>();
//       json['UserContests'].forEach((v) {
//         userContests.add(new Null.fromJson(v));
//       });
//     }
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
//     data['Fee'] = this.fee;
//     data['CurrentParticipants'] = this.currentParticipants;
//     data['Rating'] = this.rating;
//     data['Status'] = this.status;
//     data['CreatedDate'] = this.createdDate;
//     data['ModifiedBy'] = this.modifiedBy;
//     data['ModifiedDate'] = this.modifiedDate;
//     data['ProposalId'] = this.proposalId;
//     data['CreatedByNavigation'] = this.createdByNavigation;
//     data['ModifiedByNavigation'] = this.modifiedByNavigation;
//     data['Proposal'] = this.proposal;
//     if (this.contestPrizes != null) {
//       data['ContestPrizes'] =
//           this.contestPrizes.map((v) => v.toJson()).toList();
//     }
//     if (this.userContests != null) {
//       data['UserContests'] = this.userContests.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
