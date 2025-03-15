decodeStatus(String status) {
  switch (status) {
    case "COMPLETED":
      return "Completed";
    case "UNASSIGNED":
      return "Unassigned";
    case "ASSIGNED":
      return "Assigned";
    case "ACCEPTED":
      return "Scheduled";
    case "WIP":
      return "Work In Progress";
    default:
      return status;
  }
}
