import 'dart:math';

import 'input.dart';

void main() {
  const color1 = "A";
  const color2 = "B";

  WiresMap map = WiresMap();
  map.putWire(color1, WIRE_PATH_1);
  map.putWire(color2, WIRE_PATH_2);
  Point cross = map.closestIntersection;
  print(cross);
  print(map.manhattanDistance(cross));
}

class WiresMap {
  final Point origin = Point(0, 0);
  Map<int, Map<int, Set<String>>> map = {};

  void _add(Point p, String wireId) {
    int x = p.x;
    int y = p.y;
    if (!map.containsKey(x)) {
      map[x] = {};
    }
    if (!map[x].containsKey(y)) {
      map[x][y] = Set();
    }
    map[x][y].add(wireId);
  }

  Point _getNextPoint(Point start, String direction) {
    Point next;
    int dx = start.x;
    int dy = start.y;
    if ('R' == direction) {
      next = Point(dx + 1, dy);
    } else if ('L' == direction) {
      next = Point(dx - 1, dy);
    } else if ('U' == direction) {
      next = Point(dx, dy + 1);
    } else if ('D' == direction) {
      next = Point(dx, dy - 1);
    } else {
      print("Unknown direction $direction");
    }
    return next;
  }

  Point _putWireLine(Point start, String move, String wireId) {
    String direction = move.substring(0, 1);
    int distance = int.parse(move.substring(1));
    Point current = start;
    _add(current, wireId);
    int i = 1;
    while (i <= distance) {
      Point next = _getNextPoint(current, direction);
      _add(next, wireId);
      current = next;
      i++;
    }
    return current;
  }

  void putWire(String wireId, List<String> wirePath) {
    Point current = origin;
    wirePath.forEach((move) {
      current = _putWireLine(current, move, wireId);
    });
  }

  int manhattanDistance(Point<num> p) {
    return p.x.abs() + p.y.abs();
  }

  List<Point> get intersections {
    List<Point> found = [];
    map.forEach((x, row) {
      row.forEach((y, data) {
        if (2 == data.length) {
          found.add(Point(x, y));
        }
      });
    });
    return found;
  }

  Point get closestIntersection {
    return intersections.fold<Point>(Point(10000, 10000), (current, next) {
      if (next.x != origin.x || next.y != origin.y) {
        if (manhattanDistance(next) < manhattanDistance(current)) {
          return next;
        }
      }
      return current;
    });
  }
}
