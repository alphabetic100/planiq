decodeStatus(String status) {
  switch (status) {
    case "COMPLETED":
      return "Completed";
    case "UNASSIGNED":
      return "Unassigned";
    default:
      return status;
  }
}
