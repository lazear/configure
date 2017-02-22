#!/usr/bin/make
# Makefile automatically generated using ./configure  
# 2017-02-21

# Build machine specs
export MACHINE  = x86_64-linux-gnu
export ARCH     = x86_64

# C compiler information
export CC       = c99
export CCVER    = 6.2.0
export STDC_VER = 199901
export CFLAGS   = -O2 -Wall -Werror -Wextra

# Project information
export PREFIX   = /usr/local/bin
export PROJECT  = configure
export VERSION  = 0.1.0

# Build information
export SRC_DIR  = src
export INC_DIR  = include
export BUILD    = build
export HEADERS  = $(wildcard $(INC_DIR)/*.h)
export SOURCE   = $(wildcard $(SRC_DIR)/*.c)
export OBJECTS  = $(SOURCE:.c=.o)
export TARGET   = $(BUILD)/$(PROJECT)

.PHONY: all clean dist

all: $(TARGET)

clean:
	rm -rf $(OBJECTS)

dist: clean
	@echo "creating distribution archive $(PROJECT)-$(VERSION).tar.gz"
	@tar -cvf $(PROJECT)-$(VERSION).tar.gz configure $(TARGET) $(SOURCE) $(HEADERS)

install: $(TARGET)
	@echo "installing $(PROJECT) in $(PREFIX)"
	@cp $(TARGET) $(PREFIX)/$(PROJECT)-$(VERSION)
	@ln $(PREFIX)/$(PROJECT)-$(VERSION) $(PREFIX)/$(PROJECT) 


%.o: %.c
	@echo "cc $<"
	@$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJECTS) $(HEADERS)
	@echo "building $(TARGET)"
	@$(CC) $(CFLAGS) $(OBJECTS) -o $(TARGET)
