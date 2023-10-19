enum AllTypes {
  // * public types
  experience("experience"), // default, shouldn't be used, but can be displayed
  see("see"), // for tweets and other "just acknowledge" exps
  read("read"),
  watch("watch, see"), // for videos
  write("write"), // for editable text
  note("note, write"), // for notes / highlights relating to other exps
  doit("do"), // for tasks
  resolve("resolve, do"), // for GitHub issues
  answer("answer, do"), // for mails / chat that is not a task
  // * private types
  private("_"), // not used
  command("_command"), // exp type is there, so they show up in search
  setting("_setting"), // same, but for settings
  resonance("_resonance"), // for ratings of exps
  extract("_extract"), // for editable highlights
  ;

  const AllTypes(
    this.name,
  );
  final String name;

  static AllTypes fromString(String name) {
    return AllTypes.values.firstWhere((e) => e.name == name);
  }
}
