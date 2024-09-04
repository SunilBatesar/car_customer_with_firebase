class HelpandSupportModel {
  String id;
  String title;
  String prefixicon;
  HelpandSupportModel({
    required this.id,
    required this.title,
    required this.prefixicon,
  });
}

class DeleteAccountModel {
  String title;
  DeleteAccountModel({
    required this.title,
  });
}

class MessageModel {
  String mostRecentMessage;
  String messageDate;
  String type;

  MessageModel(this.mostRecentMessage, this.messageDate, this.type);
}
class AccountModel {
  String id;
  String title;
  String icon;
  AccountModel({
    required this.id,
    required this.title,
    required this.icon,
  });
}
