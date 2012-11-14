#include <Eigen/Dense>
#include <ctime>
#include <iostream>

using namespace std;
using namespace Eigen;

int main()
{

  int N = 100000;
  int M = 10000;

  clock_t tic = clock();

  MatrixXd randMat = MatrixXd::Random(N,M);

  cout << "Time to simulate RVs: " << (clock() - tic)/(double)CLOCKS_PER_SEC << endl;

  tic = clock();

  MatrixXd logRandMat = randMat.array().log();
  
  cout << "Time to compute logs: " << (clock() - tic)/(double)CLOCKS_PER_SEC << endl;

  return 0;

}
