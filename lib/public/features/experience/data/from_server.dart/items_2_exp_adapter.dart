// TODO refactor using an abstract class + factory
//, in case we manage to use
// read extends experience with freezed, instead of the
// current reads.base



// ! Drift
/* class Items2ExpAdapter {
  dynamic toAny(GetItem item) {
    Experience exp = Experience(
      id: item.uid,
      author: item.author ?? "",
      createdAt: DateTime.parse(item.createdAt ?? ""),
      content: item.title ?? "",
      type: AllTypes.fromString(item.type),
    );
    switch (item.type) {
      case "read":
        return Read(
          base: exp,
          mainContent: item.content ?? "",
          source: "from RSS",
          link: item.link ?? "",
          summary: item.summary ?? "",
        );
      default:
        return exp;
    }
  }
}
 */