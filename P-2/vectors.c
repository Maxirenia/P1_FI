#include <stdio.h>
#include <stdlib.h>

#define N 512

float Mat[N][N];
float MatDD[N][N];
float V1[N];
float V2[N];
float V3[N];
float V4[N];

void InitData(){
	int i,j;
	srand(334411);
	for( i = 0; i < N; i++ )
 		for( j = 0; j < N; j++ ){
 			Mat[i][j]=(((i*j)%3)?-1:1)*(100.0*(rand()/(1.0*RAND_MAX)));
 			if ( (abs(i - j) <= 3) && (i != j))
 				MatDD[i][j] = (((i*j)%3) ? -1 : 1)*(rand()/(1.0*RAND_MAX));
 			else if ( i == j )
 				MatDD[i][j]=(((i*j)%3)?-1:1)*(10000.0*(rand()/(1.0*RAND_MAX)));
 			else MatDD[i][j] = 0.0;
 			}
			for( i = 0; i < N; i++ ){
 				V1[i]=(i<N/2)?(((i*j)%3)?-1:1)*(100.0*(rand()/(1.0*RAND_MAX))):0.0;
 				V2[i]=(i>=N/2)?(((i*j)%3)?-1:1)*(100.0*(rand()/(1.0*RAND_MAX))):0.0;
 				V3[i]=(((i*j)%5)?-1:1)*(100.0*(rand()/(1.0*RAND_MAX)));
			}
}
void PrintVect( float vect[N], int from, int numel ) {
	for(int i = from; i < numel+from; i++) {
		printf("%f ", vect[i]);
	}
	printf("\n");
}

void PrintRow(float mat[N][N], int row, int from, int numel) {
	for(int i = from; i <= numel; i++) {
		printf("%f ", mat[row][i]);
	}
	printf("\n");
}

void MultEscalar(float vect[N], float vectres[N], float alfa);

float Scalar(float vect1[N], float vect2[N]) {
	float escalar = 0;
	for(int i = 0; i < N; i++) {
		escalar += (vect1[i]*vect2[i]);
	}
	return escalar;
}

int Ortogonal(float vect1[N], float vect2[N]) {
	float escalar = Scalar(vect1, vect2);
	printf("%f ", escalar);
	if (escalar == 0) return 1;
	else return 0;
}

int main() {
	InitData();
	//int row = 0;
	//PrintRow(Mat, row, from, numel);
	//PrintVect(V1, from, numel);
}
