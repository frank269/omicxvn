
class Ticket {
  int? id;
  int? tenantId;
  String? ticketCode;
  String? title;
  String? contact;
  String? agentAssignee;
  String? status;
  int? priority;
  String? completedDate;
  String? ticketType;
  String? groupProcessing;
  String? creationDate;
  String? lastUpdateDate;
  String? creationUser;
  String? accountName;
  String? valueTicketTypeUpdated;
  String? valueStatusUpdated;
  int? priorityUpdated;
  UserGroupDropdown? userGroupDropdown;
  UserGroupDropdown? agentAssigneeDropdown;
  UserGroupDropdown? contactDropdown;
  UserGroupDropdown? accountDropdown;
  String? channelSource;
  String? note;
  double? hoursRemaining;
  double? timesRemaining;
  String? closedDate;
  List<ListAttachFile?>? listAttachFile;
  List<int>? relationTicket;
  int? assigneeAgentId;
  bool? isFollow;
  int? totalScore;
  int? scoredById;
  String? scoredByName;
  String? phoneNumber;

  Ticket(
      {this.id,
      this.tenantId,
      this.ticketCode,
      this.title,
      this.contact,
      this.agentAssignee,
      this.status,
      this.priority,
      this.completedDate,
      this.ticketType,
      this.groupProcessing,
      this.creationDate,
      this.lastUpdateDate,
      this.creationUser,
      this.accountName,
      this.valueTicketTypeUpdated,
      this.valueStatusUpdated,
      this.priorityUpdated,
      this.userGroupDropdown,
      this.agentAssigneeDropdown,
      this.contactDropdown,
      this.accountDropdown,
      this.channelSource,
      this.note,
      this.hoursRemaining,
      this.timesRemaining,
      this.closedDate,
      this.listAttachFile,
      this.relationTicket,
      this.assigneeAgentId,
      this.isFollow,
      this.totalScore,
      this.scoredById,
      this.scoredByName,
      this.phoneNumber});

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenantId = json['tenantId'];
    ticketCode = json['ticketCode'];
    title = json['title'];
    contact = json['contact'];
    agentAssignee = json['agentAssignee'];
    status = json['status'];
    priority = json['priority'];
    completedDate = json['completedDate'];
    ticketType = json['ticketType'];
    groupProcessing = json['groupProcessing'];
    creationDate = json['creationDate'];
    lastUpdateDate = json['lastUpdateDate'];
    creationUser = json['creationUser'];
    accountName = json['accountName'];
    valueTicketTypeUpdated = json['valueTicketTypeUpdated'];
    valueStatusUpdated = json['valueStatusUpdated'];
    priorityUpdated = json['priorityUpdated'];
    userGroupDropdown = json['userGroupDropdown'] != null
        ? new UserGroupDropdown.fromJson(json['userGroupDropdown'])
        : null;
    agentAssigneeDropdown = json['agentAssigneeDropdown'] != null
        ? new UserGroupDropdown.fromJson(json['agentAssigneeDropdown'])
        : null;
    contactDropdown = json['contactDropdown'] != null
        ? new UserGroupDropdown.fromJson(json['contactDropdown'])
        : null;
    accountDropdown = json['accountDropdown'] != null
        ? new UserGroupDropdown.fromJson(json['accountDropdown'])
        : null;
    channelSource = json['channelSource'];
    note = json['note'];
    hoursRemaining = json['hoursRemaining'];
    timesRemaining = json['timesRemaining'];
    closedDate = json['closedDate'];
    if (json['listAttachFile'] != null) {
      listAttachFile = <ListAttachFile>[];
      json['listAttachFile'].forEach((v) {
        listAttachFile?.add(new ListAttachFile.fromJson(v));
      });
    }
    relationTicket = json['relationTicket'];
    assigneeAgentId = json['assigneeAgentId'];
    isFollow = json['isFollow'];
    totalScore = json['totalScore'];
    scoredById = json['scoredById'];
    scoredByName = json['scoredByName'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenantId'] = this.tenantId;
    data['ticketCode'] = this.ticketCode;
    data['title'] = this.title;
    data['contact'] = this.contact;
    data['agentAssignee'] = this.agentAssignee;
    data['status'] = this.status;
    data['priority'] = this.priority;
    data['completedDate'] = this.completedDate;
    data['ticketType'] = this.ticketType;
    data['groupProcessing'] = this.groupProcessing;
    data['creationDate'] = this.creationDate;
    data['lastUpdateDate'] = this.lastUpdateDate;
    data['creationUser'] = this.creationUser;
    data['accountName'] = this.accountName;
    data['valueTicketTypeUpdated'] = this.valueTicketTypeUpdated;
    data['valueStatusUpdated'] = this.valueStatusUpdated;
    data['priorityUpdated'] = this.priorityUpdated;
    if (this.userGroupDropdown != null) {
      data['userGroupDropdown'] = this.userGroupDropdown?.toJson();
    }
    if (this.agentAssigneeDropdown != null) {
      data['agentAssigneeDropdown'] = this.agentAssigneeDropdown?.toJson();
    }
    if (this.contactDropdown != null) {
      data['contactDropdown'] = this.contactDropdown?.toJson();
    }
    if (this.accountDropdown != null) {
      data['accountDropdown'] = this.accountDropdown?.toJson();
    }
    data['channelSource'] = this.channelSource;
    data['note'] = this.note;
    data['hoursRemaining'] = this.hoursRemaining;
    data['timesRemaining'] = this.timesRemaining;
    data['closedDate'] = this.closedDate;
    if (this.listAttachFile != null) {
      data['listAttachFile'] =
          this.listAttachFile?.map((v) => v?.toJson()).toList();
    }
    data['relationTicket'] = this.relationTicket;
    data['assigneeAgentId'] = this.assigneeAgentId;
    data['isFollow'] = this.isFollow;
    data['totalScore'] = this.totalScore;
    data['scoredById'] = this.scoredById;
    data['scoredByName'] = this.scoredByName;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}

class UserGroupDropdown {
  int? value;
  String? displayName;
  int? groupId;
  List<int>? groupIds;
  String? ticketType;

  UserGroupDropdown(
      {this.value,
      this.displayName,
      this.groupId,
      this.groupIds,
      this.ticketType});

  UserGroupDropdown.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    displayName = json['displayName'];
    groupId = json['groupId'];
    groupIds = json['groupIds'];
    ticketType = json['ticketType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['displayName'] = this.displayName;
    data['groupId'] = this.groupId;
    data['groupIds'] = this.groupIds;
    data['ticketType'] = this.ticketType;
    return data;
  }
}

class ListAttachFile {
  int? id;
  String? fileName;
  String? fileType;
  int? ticketId;
  int? leadId;

  ListAttachFile(
      {this.id, this.fileName, this.fileType, this.ticketId, this.leadId});

  ListAttachFile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileName = json['fileName'];
    fileType = json['fileType'];
    ticketId = json['ticketId'];
    leadId = json['leadId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fileName'] = this.fileName;
    data['fileType'] = this.fileType;
    data['ticketId'] = this.ticketId;
    data['leadId'] = this.leadId;
    return data;
  }
}
