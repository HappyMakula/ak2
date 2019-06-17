

#include <stdio.h>

int main()
{
	float odc,a,b,suma,pom0,c,fun1();
	unsigned long long int fun(),e,f,d,srednia1=0,srednia2=0;
	int x;
	for (x = 0; x < 10; x++)
	{
		e=fun();
		a=2;b=3;c=2048;
		odc=(b-a)/c;
		suma=0;
		pom0=a;
		for (int i = 0; i <=c; i++)
			{	
			suma=suma+odc*(a+i*odc)*(a+i*odc);		
			}
		f=fun();
		d=f-e;
		srednia1=srednia1+d;
		printf("c:   %f czas:%lld\n",suma,d);
	}
		
	for (x = 0; x < 10; x++)
	{		
		e=fun();
		c=fun1();	
		f=fun();
		d=f-e;
		srednia2=srednia2+d;
		printf("asm: %f czas:%lld\n",c,d);
	}
	srednia1=srednia1/10;
	srednia2=srednia2/10;
	printf("c   srednia: %lld\nasm srednia: %lld\n",srednia1,srednia2);
	printf("c/asm: %f \n", (float)srednia1/srednia2);

}

