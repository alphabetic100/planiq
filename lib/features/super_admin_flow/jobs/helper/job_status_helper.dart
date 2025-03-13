decodeStatus(String status) {
  switch (status) {
    case "COMPLETED":
      return "Completed";
    case "UNASSIGNED":
      return "Unassigned";
    case "ASSIGNED":
      return "Assigned";
    default:
      return status;
  }
}
