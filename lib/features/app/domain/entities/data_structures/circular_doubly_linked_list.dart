import 'package:weathque/config/theme/custom_colors.dart';
import 'package:weathque/features/app/domain/entities/cities_enum.dart';

class Node {
  late City city;
  late CustomColors color;
  Node? next;
  Node? prev;

  Node(this.city, this.color);
}

class CircularDoublyLinkedList {
  Node? head;
  Node? currentPosition;

  CircularDoublyLinkedList();

  CircularDoublyLinkedList.fromList(List<City> cities, List<CustomColors> colors) {
    for (int i = 0; i < cities.length; i++) {
      insert(cities[i], colors[i]);
    }
    if (head != null) {
      currentPosition = head;
    }
  }

  void insert(City city, CustomColors color) {
    Node newNode = Node(city, color);
    if (head == null) {
      head = newNode;
      newNode.next = newNode;
      newNode.prev = newNode;
    } else {
      Node lastNode = head!.prev!;
      newNode.next = head;
      newNode.prev = lastNode;
      head!.prev = newNode;
      lastNode.next = newNode;
    }
  }

  void moveToNext() {
    if (currentPosition != null) {
      currentPosition = currentPosition!.next;
    } else if (head != null) {
      currentPosition = head;
    }
  }

  void moveToPrevious() {
    if (currentPosition != null) {
      currentPosition = currentPosition!.prev;
    } else if (head != null) {
      currentPosition = head!.prev;
    }
  }

  Node? getCurrent() {
    return currentPosition;
  }

  void display() {
    if (head == null) {
      print("List is empty");
      return;
    }

    Node current = head!;
    do {
      print("City: ${current.city.name}, Color: ${current.color}");
      current = current.next!;
    } while (current != head);
  }
}