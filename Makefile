INC_DIR = include
OBJ_DIR = obj
SRC_DIR = src
CC = gcc
CFLAGS = -g -Wall -I$(INC_DIR)
SRC_FILES = $(notdir $(wildcard $(SRC_DIR)/*.c))
OBJ_FILES = $(SRC_FILES:.c=.o)
OBJS = $(foreach obj, $(OBJ_FILES), $(OBJ_DIR)/$(obj))
DEPS = $(wildcard $(INC_DIR)/*.h)
BINARY = app

all: $(BINARY) 

$(BINARY): $(OBJS)
	@$(CC) $(CFLAGS) -o $(BINARY) $(OBJS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(DEPS)
	@$(CC) $(CFLAGS) -c $< -o $@

run: $(BINARY)
	@./$(BINARY).exe

clean:
	@del /s /q $(BINARY).exe obj

create:
	@mkdir include
	@mkdir obj
