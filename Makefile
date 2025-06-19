.SILENT:

YOUR_FILES_PATH = ../
OBJ_PATH = obj_test_files

# Detect operating system
ifeq ($(OS),Windows_NT)
	SHELL = C:/Windows/System32/cmd.exe
	.SHELLFLAGS = /c
    DETECTED_OS := Windows
    EXE_EXT := .exe
    TEST_SCRIPT := run_test.bat
    RM := del /f /q
    RMDIR := rmdir /s /q
    MKDIR := mkdir
    CP := copy
    PATH_SEP := \\
else
    DETECTED_OS := $(shell uname -s)
    EXE_EXT := 
    TEST_SCRIPT := sh run_test.sh
    RM := rm -f
    RMDIR := rm -rf
    MKDIR := mkdir -p
    CP := cp
    PATH_SEP := /
endif

FILES_PATH = test_files
EZ_PATH = ${FILES_PATH}${PATH_SEP}EZ
MD_PATH = ${FILES_PATH}${PATH_SEP}MD
CZ_PATH = ${FILES_PATH}${PATH_SEP}CZ

EZ_FILES = triangle_area.c compare.c grading.c
MD_FILES = multi_table.c prime_number.c pern_star.c
CZ_FILES = minesweeper.c tower_hanoi.c b_tree_sort.c

LIB = utils${PATH_SEP}utils.a
SPECIAL_TEST8_PATH = utils${PATH_SEP}special_test${PATH_SEP}quiz8_test.c
DOCUMENTATION_PATH = doc${PATH_SEP}testcase_
QUIZ_PATH = quiz${PATH_SEP}quiz

.PHONY: all clean init setup reset recreate_quiz quiz1 quiz2 quiz3 quiz4 quiz5 quiz6 quiz7 quiz8 quiz9 quiz10 run_test_all os_info
.SILENT: run_test_all quiz1 quiz2 quiz3 quiz4 quiz5 quiz6 quiz7 quiz8 quiz9 quiz10

os_info:
	@echo "Detected OS: $(DETECTED_OS)"
	@echo "Using test script: $(TEST_SCRIPT)"
	@echo "Executable extension: $(EXE_EXT)"

setup:
ifeq ($(DETECTED_OS),Windows)
	@echo "==== Running compile quiz files (Windows) ===="
	@if exist $(OBJ_PATH) $(RMDIR) $(OBJ_PATH) 2>nul
	@$(MKDIR) $(OBJ_PATH)$(PATH_SEP)quiz1 2>nul
	@$(MKDIR) $(OBJ_PATH)$(PATH_SEP)quiz2 2>nul
	@$(MKDIR) $(OBJ_PATH)$(PATH_SEP)quiz3 2>nul
	@$(MKDIR) $(OBJ_PATH)$(PATH_SEP)quiz4 2>nul
	@$(MKDIR) $(OBJ_PATH)$(PATH_SEP)quiz5 2>nul
	@$(MKDIR) $(OBJ_PATH)$(PATH_SEP)quiz6 2>nul
	@$(MKDIR) $(OBJ_PATH)$(PATH_SEP)quiz7 2>nul
	@$(MKDIR) $(OBJ_PATH)$(PATH_SEP)quiz8 2>nul
	@$(MKDIR) $(OBJ_PATH)$(PATH_SEP)quiz9 2>nul
	@$(MKDIR) $(OBJ_PATH)$(PATH_SEP)quiz10 2>nul

	@gcc $(EZ_PATH)$(PATH_SEP)triangle_area.c -o $(OBJ_PATH)$(PATH_SEP)quiz2$(PATH_SEP)test_quiz2$(EXE_EXT)
	@echo Compile Quiz 2 files complete
	@gcc $(EZ_PATH)$(PATH_SEP)compare.c -o $(OBJ_PATH)$(PATH_SEP)quiz3$(PATH_SEP)test_quiz3$(EXE_EXT)
	@echo Compile Quiz 3 files complete
	@gcc $(EZ_PATH)$(PATH_SEP)grading.c -o $(OBJ_PATH)$(PATH_SEP)quiz4$(PATH_SEP)test_quiz4$(EXE_EXT)
	@echo Compile Quiz 4 files complete
	@gcc $(MD_PATH)$(PATH_SEP)multi_table.c -o $(OBJ_PATH)$(PATH_SEP)quiz5$(PATH_SEP)test_quiz5$(EXE_EXT)
	@echo Compile Quiz 5 files complete
	@gcc $(MD_PATH)$(PATH_SEP)prime_number.c -o $(OBJ_PATH)$(PATH_SEP)quiz6$(PATH_SEP)test_quiz6$(EXE_EXT)
	@echo Compile Quiz 6 files complete
	@gcc $(MD_PATH)$(PATH_SEP)pern_star.c -o $(OBJ_PATH)$(PATH_SEP)quiz7$(PATH_SEP)test_quiz7$(EXE_EXT)
	@echo Compile Quiz 7 files complete
	@gcc ${SPECIAL_TEST8_PATH} ${LIB} $(CZ_PATH)$(PATH_SEP)minesweeper.c  -o $(OBJ_PATH)$(PATH_SEP)quiz8$(PATH_SEP)test_quiz8$(EXE_EXT)
	@echo Compile Quiz 8 files complete
	@gcc $(CZ_PATH)$(PATH_SEP)tower_hanoi.c -o $(OBJ_PATH)$(PATH_SEP)quiz9$(PATH_SEP)test_quiz9$(EXE_EXT)
	@echo Compile Quiz 9 files complete
	@gcc $(CZ_PATH)$(PATH_SEP)b_tree_sort.c -o $(OBJ_PATH)$(PATH_SEP)quiz10$(PATH_SEP)test_quiz10$(EXE_EXT)
	@echo Compile Quiz 10 files complete
else
	@i=1; \
	echo "==== Running compile quiz files (Unix) ===="; \
	$(RMDIR) $(OBJ_PATH); \
	$(MKDIR) $(OBJ_PATH)/quiz$$i; \
	i=$$((i + 1)); \
	for file in $(EZ_FILES); do \
		$(MKDIR) $(OBJ_PATH)/quiz$$i; \
		gcc $(EZ_PATH)/$$file -o $(OBJ_PATH)/quiz$$i/test_quiz$$i$(EXE_EXT); \
		echo "Quiz $$i: $$file compile complete"; \
		i=$$((i + 1)); \
	done; \
	for file in $(MD_FILES); do \
		$(MKDIR) $(OBJ_PATH)/quiz$$i; \
		gcc $(MD_PATH)/$$file -o $(OBJ_PATH)/quiz$$i/test_quiz$$i$(EXE_EXT); \
		echo "Quiz $$i: $$file compile complete"; \
		i=$$((i + 1)); \
	done; \
	for file in $(CZ_FILES); do \
		$(MKDIR) $(OBJ_PATH)/quiz$$i; \
		if [ $$i -eq 8 ]; then \
			gcc ${SPECIAL_TEST8_PATH} $(CZ_PATH)/$$file $(LIB) -o $(OBJ_PATH)/quiz$$i/test_quiz$$i$(EXE_EXT); \
		else \
			gcc $(CZ_PATH)/$$file -o $(OBJ_PATH)/quiz$$i/test_quiz$$i$(EXE_EXT); \
		fi; \
		echo "Quiz $$i: $$file compile complete"; \
		i=$$((i + 1)); \
	done
endif

init: setup
ifeq ($(DETECTED_OS),Windows)
	@echo "==== Running setup workspace files (Windows) ====";
	@for /l %%i in (1,1,10) do ( \
		$(MKDIR) $(YOUR_FILES_PATH)$(PATH_SEP)quiz%%i 2>nul && \
		$(CP) $(QUIZ_PATH)%%i.c $(YOUR_FILES_PATH)$(PATH_SEP)quiz%%i$(PATH_SEP)quiz%%i.c >nul && \
		$(CP) $(DOCUMENTATION_PATH)%%i.txt $(YOUR_FILES_PATH)$(PATH_SEP)quiz%%i$(PATH_SEP)testcase.txt >nul && \
		echo Quiz %%i: setup complete \
	)
else
	@echo "==== Running setup workspace files (Unix) ===="; \
	for i in $$(seq 1 10); do \
		$(MKDIR) $(YOUR_FILES_PATH)/quiz$$i; \
		$(CP) $(QUIZ_PATH)$$i.c $(YOUR_FILES_PATH)/quiz$$i/quiz$$i.c; \
		$(CP) $(DOCUMENTATION_PATH)$$i.txt $(YOUR_FILES_PATH)/quiz$$i/testcase.txt; \
		echo "Quiz $$i: setup complete"; \
	done
endif

update_lib:
ifeq ($(DETECTED_OS),Windows)
	@if exist $(LIB)$(PATH_SEP)*.o $(RM) $(LIB)$(PATH_SEP)*.o 2>nul
	@if exist $(LIB)$(PATH_SEP)*.a $(RM) $(LIB)$(PATH_SEP)*.a 2>nul
	@if exist $(LIB)$(PATH_SEP)*.out $(RM) $(LIB)$(PATH_SEP)*.out 2>nul
	@gcc -c $(LIB)$(PATH_SEP)*.c -o $(LIB)$(PATH_SEP)utils.o
	@ar rc $(LIB)$(PATH_SEP)utils.a $(LIB)$(PATH_SEP)utils.o
	@echo "Update lib complete"
else
	@$(RM) $(LIB)/*.o $(LIB)/*.a $(LIB)/*.out
	@gcc -c $(LIB)/*.c -o $(LIB)/utils.o
	@ar rc $(LIB)/utils.a $(LIB)/utils.o
	@echo "Update lib complete"
endif

update:
	@git pull -f

upload: 
	@git add .
	@git commit -m "update"
	@git push -f

clean:
	@echo "Remove compile files"
ifeq ($(DETECTED_OS),Windows)
	@if exist $(OBJ_PATH) $(RMDIR) $(OBJ_PATH) 2>nul
	@echo "Remove your files"
	@if exist $(YOUR_FILES_PATH)$(PATH_SEP)quiz* $(RMDIR) $(YOUR_FILES_PATH)$(PATH_SEP)quiz* 2>nul
else
	@$(RMDIR) $(OBJ_PATH)/quiz*
	@echo "Remove your files"
	@$(RMDIR) $(YOUR_FILES_PATH)/quiz*
endif
	@echo "Please make init again"

recompile:
	@$(MAKE) setup

reset: clean init
	@echo "==== Reset complete ===="

recreate_quiz:
	@if [ -z "$(n)" ]; then \
		echo "Usage: make recreate_quiz n=<number>"; \
		echo "Example: make recreate_quiz n=1"; \
		exit 1; \
	fi;
ifeq ($(DETECTED_OS),Windows)
	@if exist $(YOUR_FILES_PATH)$(PATH_SEP)quiz$(n) $(RMDIR) $(YOUR_FILES_PATH)$(PATH_SEP)quiz$(n) 2>nul
	@echo "==== Running recreate quiz $(n) (Windows) ====";
	@$(MKDIR) $(OBJ_PATH)$(PATH_SEP)quiz$(n) 2>nul
	@$(MKDIR) $(YOUR_FILES_PATH)$(PATH_SEP)quiz$(n) 2>nul
	@if $(n) LEQ 3 ( \
		echo "Compiling EZ quiz $(n)" \
	) else if $(n) LEQ 6 ( \
		echo "Compiling MD quiz $(n)" \
	) else ( \
		echo "Compiling CZ quiz $(n)" \
	)
	@$(CP) $(QUIZ_PATH)$(n).c $(YOUR_FILES_PATH)$(PATH_SEP)quiz$(n)$(PATH_SEP)quiz$(n).c >nul
	@$(CP) $(DOCUMENTATION_PATH)$(n).txt $(YOUR_FILES_PATH)$(PATH_SEP)quiz$(n)$(PATH_SEP)testcase.txt >nul
	@echo "Quiz $(n): recreate complete"
else
	@$(RMDIR) $(YOUR_FILES_PATH)/quiz$(n); \
	echo "==== Running recreate quiz $(n) (Unix) ===="; \
	$(MKDIR) $(OBJ_PATH)/quiz$(n); \
	$(MKDIR) $(YOUR_FILES_PATH)/quiz$(n); \
	if [ $(n) -le 3 ]; then \
		file=$$(echo "$(EZ_FILES)" | cut -d' ' -f$(n)); \
		gcc $(EZ_PATH)/$$file -o $(OBJ_PATH)/quiz$(n)/test_quiz$(n)$(EXE_EXT); \
	elif [ $(n) -le 6 ]; then \
		file=$$(echo "$(MD_FILES)" | cut -d' ' -f$$(($(n)-3))); \
		gcc $(MD_PATH)/$$file -o $(OBJ_PATH)/quiz$(n)/test_quiz$(n)$(EXE_EXT); \
	else \
		file=$$(echo "$(CZ_FILES)" | cut -d' ' -f$$(($(n)-6))); \
		if [ $(n) -eq 8 ]; then \
			gcc $(LIB)/special_test/quiz8_test.c $(CZ_PATH)/$$file $(LIB)/utils.a -o $(OBJ_PATH)/quiz$(n)/test_quiz$(n)$(EXE_EXT); \
		else \
			gcc $(CZ_PATH)/$$file -o $(OBJ_PATH)/quiz$(n)/test_quiz$(n)$(EXE_EXT); \
		fi; \
	fi; \
	$(CP) $(QUIZ_PATH)$(n).c $(YOUR_FILES_PATH)/quiz$(n)/quiz$(n).c; \
	$(CP) $(DOCUMENTATION_PATH)$(n).txt $(YOUR_FILES_PATH)/quiz$(n)/testcase.txt; \
	echo "Quiz $(n): recreate complete"
endif

# Quiz targets - automatically use appropriate script
quiz1:
	@$(TEST_SCRIPT) 1

quiz2:
	@$(TEST_SCRIPT) 2

quiz3:
	@$(TEST_SCRIPT) 3

quiz4:
	@$(TEST_SCRIPT) 4

quiz5:
	@$(TEST_SCRIPT) 5

quiz6:
	@$(TEST_SCRIPT) 6

quiz7:
	@$(TEST_SCRIPT) 7

quiz8:
	@$(TEST_SCRIPT) 8

quiz9:
	@$(TEST_SCRIPT) 9

quiz10:
	@$(TEST_SCRIPT) 10

run_test_all:
	@echo "Running all quiz tests on $(DETECTED_OS)"
ifeq ($(DETECTED_OS),Windows)
	@for /l %%i in (1,1,10) do ( \
		echo Running quiz %%i && \
		$(TEST_SCRIPT) %%i \
	)
else
	@for i in $$(seq 1 10); do \
		echo "Running quiz $$i"; \
		$(MAKE) -s quiz$$i; \
	done
endif

# Help target
help:
	@echo "Cross-Platform Makefile for Quiz Testing System"
	@echo "Detected OS: $(DETECTED_OS)"
	@echo ""
	@echo "Available targets:"
	@echo "  os_info       - Show OS detection information"
	@echo "  setup         - Compile all test programs"
	@echo "  init          - Setup workspace and copy quiz files"
	@echo "  clean         - Remove all compiled files and quiz directories"
	@echo "  reset         - Clean and reinitialize everything"
	@echo "  update_lib    - Update utility library"
	@echo "  recompile     - Recompile test programs"
	@echo "  quiz1-quiz10  - Run individual quiz tests"
	@echo "  run_test_all  - Run all quiz tests"
	@echo "  recreate_quiz - Recreate specific quiz (usage: make recreate_quiz n=X)"
	@echo "  update        - Pull latest changes from git"
	@echo "  upload        - Commit and push changes to git"
	@echo "  help          - Show this help message"