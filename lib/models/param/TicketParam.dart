class TicketParam {
  ColumnSort? columnSort;
  String? filterText;
  TicketFilterField ticketFilterField;
  int skipCount;
  int maxResultCount;

  TicketParam(
      {this.columnSort,
        this.filterText,
        required this.ticketFilterField,
        required this.skipCount,
        required this.maxResultCount});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.columnSort != null) {
      data['columnSort'] = this.columnSort?.toJson();
    }
    data['filterText'] = this.filterText;
    if (this.ticketFilterField != null) {
      data['ticketFilterField'] = this.ticketFilterField.toJson();
    }
    data['skipCount'] = this.skipCount;
    data['maxResultCount'] = this.maxResultCount;
    return data;
  }
}

class ColumnSort {
  String? field;
  int? order;

  ColumnSort({this.field, this.order});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['field'] = this.field;
    data['order'] = this.order;
    return data;
  }
}

class TicketFilterField {
  String? ticketCode;
  String? title;
  String? accountName;
  String? contact;
  List<String>? closedDate;
  List<String>? ticketType;
  List<String>? status;
  List<String>? statusSLA;
  List<String>? priority;
  List<String>? completedDate;
  List<int>? agentAssignee;
  List<int> groupProcessing;
  List<String>? lastUpdateDate;
  List<String>? creationDate;
  List<int>? creationUser;
  String? phoneNumber;
  List<int> campaigns;

  TicketFilterField(
      {this.ticketCode,
        this.title,
        this.accountName,
        this.contact,
        this.closedDate,
        this.ticketType,
        this.status,
        this.statusSLA,
        this.priority,
        this.completedDate,
        this.agentAssignee,
        required this.groupProcessing,
        this.lastUpdateDate,
        this.creationDate,
        this.creationUser,
        this.phoneNumber,
        required this.campaigns});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticketCode'] = this.ticketCode;
    data['title'] = this.title;
    data['accountName'] = this.accountName;
    data['contact'] = this.contact;
    data['closedDate'] = this.closedDate;
    data['ticketType'] = this.ticketType;
    data['status'] = this.status;
    data['statusSLA'] = this.statusSLA;
    data['priority'] = this.priority;
    data['completedDate'] = this.completedDate;
    data['agentAssignee'] = this.agentAssignee;
    data['groupProcessing'] = this.groupProcessing;
    data['lastUpdateDate'] = this.lastUpdateDate;
    data['creationDate'] = this.creationDate;
    data['creationUser'] = this.creationUser;
    data['phoneNumber'] = this.phoneNumber;
    data['campaigns'] = this.campaigns;
    return data;
  }
}