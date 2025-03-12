decodeStatus(String status) {
  switch (status) {
    case "COMPLETED":
      return "Completed";
    default:
      return status;
  }
}
