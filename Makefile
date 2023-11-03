# -*- MakeFile -*-
calc.so: main.o add.o liblibrary1.a liblibrary2.a subtract.o
	gcc main.o add.o subtract.o -o calc.so -L. -llibrary1 -llibrary2

liblibrary1.a: multiply.o
	ar rcs $@ $<

liblibrary2.a: divide.o
	ar rcs $@ $<

multiply.o: multiply.c
	gcc -Wall -O2 -c -o $@ $<

divide.o: divide.c
	gcc -Wall -O2 -c -o $@ $<

main.o: main.c ops.h
	gcc -Wall -O2 -c -o $@ $<

add.o: add.c
	gcc -Wall -O2 -c -o $@ $<

subtract.o: subtract.c
	gcc -Wall -O2 -c -o $@ $<

clean:
	rm -f *.o calc.so liblibrary1.a liblibrary2.a


