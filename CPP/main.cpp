#include <stdlib.h>
#include <math.h>
#include <ctime>
#include <iostream>

using namespace std;

int main()
{

  int N = 100000;
  int M = 10000;

  clock_t start = clock();

  double** randMat = new double*[N];
  for(int i = 0 ; i < N ; ++i){
    randMat[i] = new double[M];
  }

  for(int i = 0 ; i < N ; ++i){
    for(int j = 0 ; j < N ; ++j){
      randMat[i][j] = rand()/RAND_MAX;
    }
  }

  cout << "Time to simulate RVs: " << (clock() - start)/(double)CLOCKS_PER_SEC << endl;

  start = clock();

  double** logRandMat = new double*[N];
  for(int i = 0 ; i < N ; ++i){
    logRandMat[i] = new double[M];
  }

  for(int i = 0 ; i < N ; ++i){
    for(int j = 0 ; j < N ; ++j){
      logRandMat[i][j] = log(randMat[i][j]);
    }
  }
  
  cout << "Time to compute logs: " << (clock() - start)/(double)CLOCKS_PER_SEC << endl;

  return 0;

}
