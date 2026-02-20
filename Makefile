############################################################
# Author: Lane Campbell
# File: Makefile
# Date: 02/19/2026
# Purpose: Compiles and links the program consisting of Employee, Officer, and Supervisor classes into an executable named "employee".
############################################################

# Compiler
CC = g++

# Name of the executable, employee
TARGET = employee

# Compile with all errors and warnings
## -c       compile
## -Wall    enable the standard warnings
## -Wextra  enable the extra warnings
CFLAGS = -c -Wall -Wextra

# $(TARGET) is the only dependancy
all: $(TARGET)


# Link all .o files to create the binary $(TARGET)
$(TARGET): main.o Employee.o Officer.o Supervisor.o
	$(CC) main.o Employee.o Officer.o Supervisor.o -o $(TARGET)


# Compile .cpp files into .o files
## Compile main.cpp into main.o
main.o: main.cpp Employee.h Officer.h Supervisor.h
	$(CC) $(CFLAGS) main.cpp

## Compile Employee.cpp into Employee.o
Employee.o: Employee.cpp Employee.h
	$(CC) $(CFLAGS) Employee.cpp

## Compile Officer.cpp into Officer.o
Officer.o: Officer.cpp Officer.h Employee.h
	$(CC) $(CFLAGS) Officer.cpp

## Compile Supervisor.cpp into Supervisor.o
Supervisor.o: Supervisor.cpp Supervisor.h Employee.h
	$(CC) $(CFLAGS) Supervisor.cpp


# Removes target, Emacs backups, and objects
clean:
	rm -f *.o *~ $(TARGET)