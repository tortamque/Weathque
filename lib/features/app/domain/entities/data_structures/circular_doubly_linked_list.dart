class Node<T> {
  late T data;
  Node<T>? next;
  Node<T>? prev;

  Node(this.data);
}

class CircularDoublyLinkedList<T> {
  Node<T>? head;
  Node<T>? currentPosition;

  CircularDoublyLinkedList();

  CircularDoublyLinkedList.fromList(List<T> values) {
    for (T value in values) {
      insert(value);
    }
    if (head != null) {
      currentPosition = head;
    }
  }

  void insert(T data) {
    Node<T> newNode = Node<T>(data);
    if (head == null) {
      head = newNode;
      newNode.next = newNode;
      newNode.prev = newNode;
    } else {
      Node<T> lastNode = head!.prev!;
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

  Node<T>? getCurrent() {
    return currentPosition;
  }

  void display() {
    if (head == null) {
      print("List is empty");
      return;
    }

    Node<T> current = head!;
    do {
      print(current.data);
      current = current.next!;
    } while (current != head);
  }
}