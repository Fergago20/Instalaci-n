#include<iostream>
#include<stdlib.h>

using namespace std;

int main(){
int goll, golv;
    cout<<"Partido de futbol.";
    cout<<"\nGoles del equipo local: ";
    cin>>goll;
    cout<<"\nGoles del equipo visitante: ";
    cin>>golv;

cout<<"\nResultado del partido.";
    if (goll>golv)
    {
        cout<<"\nVictoria para el equipo local.";
    }else if (golv>goll)
    {
        cout<<"\nVictoria para el equipo visitante.";
    }else cout<<"\nEmpate entre ambos.";
    
    cout<<endl <<endl;
    system ("pause");
    return 0;

}