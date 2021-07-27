class ApiConstants {
  static const BASE_API = 'omicx.vn';
  static const AUTHENTICATE_PATH = 'api/TokenAuth/Authenticate';
  static const DASHBOARD_AGENT_INBOUND_PATH =
      'api/services/app/AgentTask/LoadAgentInboundCall';
  static const DASHBOARD_AGENT_OUTBOUND_PATH =
      'api/services/app/AgentTask/LoadAgentOutboundCall';
  static const DASHBOARD_AGENT_TASK_PATH =
      'api/services/app/AgentTask/LoadAgentTask';
  static const DASHBOARD_AGENT_CLOSED_TICKET_PATH =
      'api/services/app/AgentTask/LoadClosedTicketAgent';

  static const CALL_HISTORY_PATH = 'reporting/tenant/call/get-list';

  static const TICKET_LOAD_PATH = 'api/services/app/Ticket/LoadTicket';
  static const TICKET_DETAIL_PATH = 'api/services/app/Ticket/GetDetailTicket';

  static const CONTACT_LIST_PATH =
      'api/services/app/Contact/SearchAllListContact';

  static const GET_USER_BYID_PATH = 'api/services/app/User/GetUserById';
}
