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
    default:
      return status;
  }
}
