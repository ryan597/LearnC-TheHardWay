# Compilers
CC= gcc
CXX= g++
# Compiler flags
# -g for debugging
# -Wall turns on compiler warnings
CFLAGS= -Wall -g
CPPFLAGS= -std=c++2a -Wall -I./include

# Linker flags
LINKERFLAG= -lm

# Directories and Files
SOURCEDIR:= src
INCLUDEDIR:= include
OBJECTDIR:= build
BINDIR:= bin

SOURCES:= $(wildcard $(SOURCEDIR)/*.c)
INCLUDE:= $(wildcard $(INCLUDEDIR)/*.h)
OBJECTS:= $(SOURCES:$(SOURCEDIR)/%.c=$(OBJECTDIR)/%.o)
TARGETS:= $(SOURCES:$(SOURCEDIR)/%.c=$(BINDIR)/%)

.PHONY: all
all: $(TARGETS)

$(TARGETS): $(BINDIR)/%: $(OBJECTDIR)/%.o
	${CC} $^ -o $@

$(OBJECTS): $(OBJECTDIR)/%.o: $(SOURCEDIR)/%.c $(wildcard $(INCLUDEDIR)/*.h)
	$(CC) $(CFLAGS) -c $< -o $@


.PHONY: clean
clean:
	rm -f $(OBJECTS)

.PHONY: remove
remove: clean
	rm -f $(TARGETS)
