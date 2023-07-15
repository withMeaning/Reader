class Ordered {
  const Ordered({
    required this.id,
    required this.order,
  });
  final String id;
  final int order;
}

// TODO: can I write an elegant function that takes in a list of Ordered and returns a list of Ordered with the order updated?
// TODO: this should go in the Application layer?
