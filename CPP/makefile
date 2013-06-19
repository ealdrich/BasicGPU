# Compiler for .cpp files
CPP  = g++

# Eigen Headers
EIG_INC = /fslhome/fslcollab54/fsl_groups/fslg_BYUMCL/Eigen

# Include standard optimization flags
CPPFLAGS = -O2 -g -c -I$(EIG_INC)

# List of all the objects you need
OBJECTS  = maxPoly.o

# Rule that tells make how to make the program from the objects
main :	main.o $(OBJECTS)
	$(CPP) -o main main.o $(OBJECTS)

clean :
	rm -f *.o
	rm -f core core.*

veryclean :
	rm -f *.o
	rm -f core core.*
	rm -f main
