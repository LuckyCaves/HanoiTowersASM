#include <iostream>
#include <stack>
using namespace std;

void print(stack<int> &s)
{
    while(!s.empty())
    {
        cout << s.top() << " ";
        s.pop();
    }
    cout << endl;
}

void hanoi(int n, stack<int> &a, stack<int> &b, stack<int> &c)
{

    if(n <= 1)
    {
        c.push(a.top());
        a.pop();
    }
    else
    {
        hanoi(n - 1, a, c, b);
        c.push(a.top());
        a.pop();
        hanoi(n - 1, b, a, c);
    }

    cout << n << endl;

}


int main() {

    stack<int> s1;
    stack<int> s2;
    stack<int> s3;

    int n = 3;

    for(int i = 0; i < n; i++)
        s1.push(i);

    // Codigo ensamblador hasta aquí de momento

    hanoi(n, s1, s2, s3);

    cout << "s1" << endl;
    print(s1);

    cout << endl << "s2" << endl;
    print(s2);

    cout << endl << "s3" << endl;
    print(s3);



}