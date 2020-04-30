#include <stdio.h>
float fung(float x);
float funf(float x);
void setP();

int main()
{	
	float g,f,a;
	a=0.0002;
	g=fung(a);
	f=funf(a);
	printf ("g=%.15f\n",g);
	printf ("f=%.15f\n",f);
	setP();
	g=fung(a);
	f=funf(a);
	printf ("g=%.7f\n",g);
	printf ("f=%.7f\n",f);
	return 0;
	
}
 
