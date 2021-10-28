import 'dart:math';

import 'input.dart';

void main() {
  const color1 = "A";
  const color2 = "B";

  WiresMap map = WiresMap();
  map.putWire(color1, WIRE_PATH_1);
  map.putWire(color2, WIRE_PATH_2);
  map.intersections.forEach((p) => print('$p ${map.getStepsNeeded(p)}'));
  Point cross = map.closestIntersection;
  print(cross);
  print(map.getStepsNeeded(cross));
}

class WiresMap {
  final Point origin = Point(0, 0);
  Map<int, Map<int, Map<String, int>>> map = {};

  void _add(Point p, String wireId, int step) {
    int x = p.x;
    int y = p.y;
    if (!map.containsKey(x)) {
      map[x] = {};
    }
    if (!map[x].containsKey(y)) {
      map[x][y] = Map<String, int>();
    }
    if (!map[x][y].containsKey(wireId)) {
      map[x][y][wireId] = step;
    }
  }

  num getStepsNeeded(Point p) {
    int x = p.x;
    int y = p.y;
    if (!map.containsKey(x)) {
      return double.infinity;
    }
    if (!map[x].containsKey(y)) {
      return double.infinity;
    }
    if (map[x][y].isEmpty) {
      return double.infinity;
    }
    if (map[x][y].length != 2) {
      print('WARNING: Requesting steps for non-intersection point $p');
    }
    return map[x][y].values.reduce((s, e) => s + e);
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

  Point _putWireLine(Point start, String move, String wireId, int step) {
    String direction = move.substring(0, 1);
    int distance = int.parse(move.substring(1));
    Point current = start;
    int neededStep = step;
    _add(current, wireId, neededStep);
    int i = 1;
    while (i <= distance) {
      Point next = _getNextPoint(current, direction);
      neededStep++;
      _add(next, wireId, neededStep);
      current = next;
      i++;
    }
    return current;
  }

  void putWire(String wireId, List<String> wirePath) {
    Point current = origin;
    int step = 0;
    wirePath.forEach((move) {
      current = _putWireLine(current, move, wireId, step);
      int distance = int.parse(move.substring(1));
      step += distance;
    });
  }

  void printMap() {
    map.forEach((x, row) {
      row.forEach((y, data) {
        print('$x $y $data');
      });
    });
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
        if (getStepsNeeded(next) < getStepsNeeded(current)) {
          return next;
        }
      }
      return current;
    });
  }
}
