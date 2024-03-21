all: build run

build:
	gfortran dot.f90 -o dot -cpp

build-fast:
	gfortran dot.f90 -o fdot -fopenmp -cpp

run:
	./dot

run-fast:
	./fdot