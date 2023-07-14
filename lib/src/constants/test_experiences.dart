import 'package:read_with_meaning/src/common_models/experience.dart';
import 'package:read_with_meaning/src/common_models/experiences/read.dart';

const randomDate = 1689272693;

const mTestExps = [
  Experience(
      id: "1",
      author: "me",
      createdAt: randomDate,
      content: "Welome!",
      type: "read"),
  Read(
      id: "2",
      author: "author",
      createdAt: randomDate,
      title: "title",
      mainContent: "mainContent",
      source: "example.com",
      link: "link"),
  Read(
      id: "3",
      author: "second author",
      createdAt: randomDate,
      title: "This is a blog post",
      mainContent: "mainContent",
      source: "example.com",
      link: "link")
];
