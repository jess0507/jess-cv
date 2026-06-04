class Job {
  final String companyName;
  final String position;
  final String time;
  final List<WorkCategory> categories;

  Job({
    required this.companyName,
    required this.position,
    required this.time,
    required this.categories,
  });
}

class WorkCategory {
  final String name;
  final List<WorkEntry> entries;

  WorkCategory({required this.name, required this.entries});
}

class WorkEntry {
  final String name;
  final List<String> descriptions;

  WorkEntry({required this.name, required this.descriptions});
}
