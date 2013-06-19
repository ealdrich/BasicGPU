# Compiler for .cpp files
CPP  = g++

# Use nvcc to compile .cu files
NVCC = nvcc
NVCCFLAGS = -arch sm_20 # For fermi's in keeneland

# Add CUDA Paths
ICUDA = /apps/cuda/5.0.35/include
LCUDA = /apps/cuda/5.0.35/lib64

LFLAGS += -lcudart -L$(LCUDA)

# Include standard optimization flags
CPPFLAGS = -O3 -c -I$(ICUDA)

# List of all the objects
OBJECTS  = 

# Rule that tells make how to make the program from the objects
main :	main.o $(OBJECTS)
	$(CPP) -o main main.o $(OBJECTS) $(LFLAGS) 

# Rule that tells make how to turn a .cu file into a .o
%.o: %.cu
		$(NVCC) ${NVCCFLAGS} $(CPPFLAGS) -c $<

clean :
	rm -f *.o
	rm -f core core.*

veryclean :
	rm -f *.o
	rm -f core core.*
	rm -f main
