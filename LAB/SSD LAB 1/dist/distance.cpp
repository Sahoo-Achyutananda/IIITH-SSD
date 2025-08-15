#include "point.h"
#include <iostream>
using namespace std;

int distance(point p1, point p2) {
    return sqrt(pow(p2.x - p1.x, 2) + pow(p2.y - p1.y, 2));
}

int main(){
    point p1,p2;

    cin >> p1.x >> p1.y;
    cin >> p2.x >> p2.y;

    int dist = distance(p1, p2);
    cout << "Distance: " << dist << endl;
}