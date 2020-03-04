# Name of the executable
TARGET = main

# List of compiled objects required for the executable
OBJECTS = \
	myModule.o \
	myFunctions.o \
	main.o


CC := icpc
CFLAGS := 
FC := ifort
FFLAGS := 
LINKER := $(FC)
LFLAGS := -lstdc++

all: $(TARGET)

# Rule to build the target executable from it's dependencies by linking.
$(TARGET) : $(OBJECTS)
	$(LINKER) $(LFLAGS) -o $(TARGET) $^

# Rule to compiler object files from f90 files
%.o: %.f90
	$(FC) $(FFLAGS) -o $@ -c $<
%.o: %.f
	$(FC) $(FFLAGS) -o $@ -c $<
%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<
%.o: %.cpp
	$(CC) $(CFLAGS) -o $@ -c $<

clean:
	@rm -rf *.o
	@rm -rf $(TARGET)
