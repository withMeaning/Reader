enum NavOptions {
  now("Now"),
  stream("Today"),
  lakes("Plan"),

  add("New"),
  refresh("Refresh"),
  command("Command"),
  question("?"),
  ;

  const NavOptions(
    this.label,
  );
  final String label;

  static NavOptions fromString(String name) {
    return NavOptions.values.firstWhere((e) => e.label == name);
  }
}
