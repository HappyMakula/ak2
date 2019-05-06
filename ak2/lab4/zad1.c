#include <stdio.h>
#include <unistd.h>

unsigned long long int fun();

unsigned int fib_it(int n){
	unsigned int fib,fib1,fib2;
	fib=1;	
	fib1=1;
	fib2=1;
	for (int i=1;i<n-1;i++){
		fib=fib1+fib2;
		fib1=fib2;
		fib2=fib;
	};
	return fib;

}

unsigned int fib_rq(int n) {
	if((n==1)||(n==0)) {
	      return(n);
	}else {
      	return(fib_rq(n-1)+fib_rq(n-2));
   }
}

void test(char c){
	c++;
}

int main(void){
	unsigned long long int a,b,c ;
	int i;
	for (i=0;i<10;i++){
		a= fun(1);
		printf("fib %u\n",fib_it(20));
		b= fun(1);
		c=b-a;
		printf ("%llu\n",c);
	};

	for (i=0;i<10;i++){
		a= fun(-1);
		printf("fib %u\n",fib_rq(20));
		b= fun(-1);
		c=b-a;
		printf ("%llu\n",c);
	};

	return 0;
}
