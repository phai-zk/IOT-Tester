.SILENT:

YOUR_FILES_PATH = ..
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
CZ_FILES = minesweeper.c tower_hanoi.c 

LIB_PATH = utils
LIB = ${LIB_PATH}${PATH_SEP}utils.a
SPECIAL_TEST8_PATH = utils${PATH_SEP}special_test${PATH_SEP}quiz8_test.c
DOCUMENTATION_PATH = doc${PATH_SEP}document_
QUIZ_PATH = quiz${PATH_SEP}quiz

.PHONY: all clean init setup reset recreate_quiz quiz1 quiz2 quiz3 quiz4 quiz5 quiz6 quiz7 quiz8 quiz9 run_test_all os_info hint6 hint7 hint8 hint9 hint10
.SILENT: run_test_all quiz1 quiz2 quiz3 quiz4 quiz5 quiz6 quiz7 quiz8 quiz9

os_info:
	@echo "Detected OS: $(DETECTED_OS)"
	@echo "Using test script: $(TEST_SCRIPT)"
	@echo "Executable extension: $(EXE_EXT)"

setup:
ifeq ($(DETECTED_OS),Windows)
	@echo ==== Running compile quiz files (Windows) ====
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
	@gcc ${SPECIAL_TEST8_PATH} $(CZ_PATH)$(PATH_SEP)minesweeper.c ${LIB_PATH}$(PATH_SEP)utils.c -o $(OBJ_PATH)$(PATH_SEP)quiz8$(PATH_SEP)test_quiz8$(EXE_EXT)
	@echo Compile Quiz 8 files complete
	@gcc $(CZ_PATH)$(PATH_SEP)tower_hanoi.c -o $(OBJ_PATH)$(PATH_SEP)quiz9$(PATH_SEP)test_quiz9$(EXE_EXT)
	@echo Compile Quiz 9 files complete
else
	@i=1; \
	echo "==== Running compile quiz files (Unix) ====" \
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
	@echo ==== Running setup workspace files (Windows) ====
	@for /l %%i in (1,1,9) do ( \
		$(MKDIR) $(YOUR_FILES_PATH)$(PATH_SEP)quiz%%i 2>nul && \
		$(CP) $(QUIZ_PATH)%%i.c $(YOUR_FILES_PATH)$(PATH_SEP)quiz%%i$(PATH_SEP)quiz%%i.c >nul && \
		$(CP) $(DOCUMENTATION_PATH)%%i.txt $(YOUR_FILES_PATH)$(PATH_SEP)quiz%%i$(PATH_SEP)testcase.txt >nul && \
		echo Quiz %%i: setup complete \
	)
else
	@echo "==== Running setup workspace files (Unix) ===="; \
	for i in $$(seq 1 9); do \
		$(MKDIR) $(YOUR_FILES_PATH)/quiz$$i; \
		$(CP) $(QUIZ_PATH)$$i.c $(YOUR_FILES_PATH)/quiz$$i/quiz$$i.c; \
		$(CP) $(DOCUMENTATION_PATH)$$i.txt $(YOUR_FILES_PATH)/quiz$$i/testcase.txt; \
		echo "Quiz $$i: setup complete"; \
	done
endif

update_lib:
ifeq ($(DETECTED_OS),Windows)
	@if exist $(LIB_PATH)$(PATH_SEP)*.o $(RM) $(LIB_PATH)$(PATH_SEP)*.o 2>nul
	@if exist $(LIB_PATH)$(PATH_SEP)*.a $(RM) $(LIB_PATH)$(PATH_SEP)*.a 2>nul
	@if exist $(LIB_PATH)$(PATH_SEP)*.out $(RM) $(LIB_PATH)$(PATH_SEP)*.out 2>nul
	@gcc -c $(LIB_PATH)$(PATH_SEP)*.c -o $(LIB_PATH)$(PATH_SEP)utils.o
	@ar rc $(LIB_PATH)$(PATH_SEP)utils.a $(LIB_PATH)$(PATH_SEP)utils.o
	@echo "Update lib complete"
else
	@$(RM) $(LIB_PATH)/*.o $(LIB_PATH)/*.a $(LIB_PATH)/*.out
	@gcc -c $(LIB_PATH)/*.c -o $(LIB_PATH)/utils.o
	@ar rc $(LIB_PATH)/utils.a $(LIB_PATH)/utils.o
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
	@$(MKDIR) $(OBJ_PATH)
	@echo "Remove your files"
	@setlocal EnableDelayedExpansion && set i=0 && \
	for /d %%d in ($(YOUR_FILES_PATH)$(PATH_SEP)quiz*) do ( \
		set /a i=!i!+1 && \
		echo Removing folder !i!: %%d && \
		$(RMDIR) "%%d" \
	) 
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

run_test_all: quiz1 quiz2 quiz3 quiz4 quiz5 quiz6 quiz7 quiz8 quiz9

hint6:
	@echo "==== Hint for Quiz 6 ===="
	@echo "จริงๆ สามารถทำได้หลายวิธี"
	@echo "แต่วิธีที่เราจะใช้คือ การหาร"
	@echo "เราจะหาร n ด้วย i ถ้าได้ค่าเป็น 0 ก็คือไม่ใช่จำนวนเฉพาะ เพื่อลดระยะเวลาในการทำงาน"
	@echo "และใช้ % เผื่อเช็คว่า n หาร i ลงตัวหรือไม่"

hint7:
	@echo "==== Hint for Quiz 7 ===="
	@echo "หมายเหตุ เนื่องจากมีการใช้บางค่ากลับหลังจึงขออธิบายแบบนี้และลองพิจรณาเอาเองว่าควรทำยังไง"
	@echo "เช่น ถ้า n = 8"
	@echo "มองเป็น 3 ส่วน"
	@echo "โดย J จะมี 2ตัว คือ space กับ * แต่ในที่นี้จะโชว์เลขให้แค่ space"
	@echo "1. ส่วนที่ 1 คือท่อนบน			I				J "
	@echo "-------*			|-------0			|7654321*"				  
	@echo "------***			|------111			|765432***"
	@echo "-----*****			|-----22222			|76543*****"
	@echo "------------------------------------------------------------------------------------------"
	@echo "2. ส่วนที่ 2 คือท่อนกลาง"
	@echo "ค่า n เป็นคู่หรือคี่มีผล		I				J"
	@echo "***************			|000000000000000		|***************"
	@echo "-*************-			|-1111111111111-		|0*************14"
	@echo "--***********--			|--22222222222--		|01***********1314"
	@echo "-*************-			|-3333333333333-		|0*************14"
	@echo "***************			|444444444444444		|***************"
	@echo "------------------------------------------------------------------------------------------"
	@echo "3. ส่วนที่ 3 คือท่อนล่าง		I				J"
	@echo "-----*****			|-----22222 			|01234*****"
	@echo "------***			|------111 			|012345***"
	@echo "-------*			|-------0 			|0123456*"
	@echo "------------------------------------------------------------------------------------------"
	@echo "make hint7_2 เพื่อขอเพิ่มเติม"

hint7_2:
	@echo "==== Hint for Quiz 7 ===="
	@echo "เราจะมีค่ากลางเรียกว่า mid โดยจะหาร n ด้วย 2 ถ้าเป็นเลขคู่ - 1 ถ้าเป็นเลขคี่จะไม่ลบ"
	@echo "หมายเหตุ เนื่องจากมีการใช้บางค่ากลับหลังจึงขออธิบายแบบนี้และลองพิจรณาเอาเองว่าควรทำยังไง"
	@echo "เช่น n = 8 จะมี mid = 3"
	@echo "ส่วนที่ 1 และ 3 จะสังเกตุว่าแถว(i)ของครึ่งบนจะมีค่า = mid"
	@echo "และขนาดของ column(j) ในแถว 1 space กับ * จะมีค่าเท่ากับ n - 1 และ i * 2 + 1 ตามลำดับ"
	@echo "และขนาดของ column(j) ในแถว 3 space กับ * จะมีค่าเท่ากับ i และ (i - 1) * 2 + 1 ตามลำดับ"
	@echo "ในส่วนตรงกลาง จะสังเกตุว่าแถว(i) จะมีค่า = n - mid และขนาดของ column(j) จะมีค่าเท่ากับ (n - 1) * 2"
	@echo "จะขอแทน n - mid ว่า c และ (n-1)*2 ว่า k"
	@echo "จะสังเกตุว่า"
	@echo "1. สร้างมาเป็นสี่เหลี่ยมก่อน"
	@echo "2. สร้างช่องว่าง เว้า อยู่ในช่วง (j < i || j > k - i) && i < (c / 2) + (c % 2) สำหรับฝั่งซ้าย"
	@echo "3. สร้างช่องว่าง เว้า อยู่ในช่วง (j < c - i - 1 || j > k - c + i + 1) && (i >= c / 2) สำหรับฝั่งขวา"

hint8:
	@echo "==== Hint for Quiz 8 ===="
	@echo "มองเป็นแค่ Map 2 มิติ มีระบบพิกัด x,y โดย i คือ x และ j คือ y"
	@echo "จะมีการตรวจสอบที่ตำแหน่งที่อยู่รอบๆ ตำแหน่งนั้น"
	@echo "โดยคำนึงถึง"
	@echo "สามารถใช้ nest loop ไล่ค่า -1 +0 +1 เพื่อตรวจสอบที่ตำแหน่งที่อยู่รอบๆ ตำแหน่งนั้นได้"
	@echo "แต่อย่าลืมกันขอบให้ดี"
	@echo "(i - 1, j - 1) (i - 1, j + 0) (i - 1, j + 1)"
	@echo "(i + 0 , j - 1) (i + 0 , j + 0) (i + 0 , j + 1)"
	@echo "(i + 1, j - 1) (i + 1, j + 0) (i + 1, j + 1)"

hint9:
	@echo "==== Hint for Quiz 9 ===="
	@echo "ทำความเข้าใจ stack ก่อน"
	@echo "สร้าง function สำหรับ push และ pop"
	@echo "เผื่อจัดการกับการลบออกจาก stack ได้"
	@echo "ในส่วน recursive เพียงแค่"
	@echo "ย้ายดิสก์ n-1 จาก SRC, TMP, DES ตามลำดับ"
	@echo "จากนั้น pop SRC ไปที่, DES"
	@echo "จากนั้นสลับบทบาทของ TMP, DES, SRC"
	@echo "จากนั้น pop SRC(อดีต TMP) ไปที่, DES(อดีต TMP)"


manual:
	@echo "How to use this program"
	@echo "1. Change YOUR_FILES_PATH in the Makefile to your own path"
	@if [ $(DETECTED_OS) = "Windows" ]; then \
		echo "2. Change YOUR_FILES_PATH in the run_test.bat to your own path" \
	else \
		echo "2. Change YOUR_FILES_PATH in the run_test.sh to your own path" \
	fi; \
	@echo "3. Run 'make init' to setup the workspace and copy the quiz files"
	@echo "4. Run 'make quiz1-quiz9' to run the individual quiz tests"
	@echo "5. Run 'make run_test_all' to run all quiz tests"
	@echo "6. Run 'make recreate_quiz n=X' to recreate a quiz if your remove the quiz files"
	@echo "7. Run 'make hintX' to get hint of a quiz (for quiz 6-9)"
	@echo "8. Run 'make help' to show this help message"

# Help target
help:
	@echo "Cross-Platform Makefile for Quiz Testing System"
	@echo "Detected OS: $(DETECTED_OS)"
	@echo ""
	@echo "Available targets:"
	@echo "  os_info       - Show OS detection information"
	@echo "  manual        - How to use this program"
	@echo "  init          - Setup workspace and copy quiz files"
	@echo "  clean         - Remove all compiled files and quiz directories"
	@echo "  reset         - Clean and reinitialize everything"
	@echo "  update_lib    - Update utility library"
	@echo "  recompile     - Recompile test programs"
	@echo "  quiz1-quiz9  - Run individual quiz tests"
	@echo "  hint6-hint9  - Giving a hint for that quiz"
	@echo "  run_test_all  - Run all quiz tests"
	@echo "  recreate_quiz - Recreate specific quiz (usage: make recreate_quiz n=X)"
	@echo "  help          - Show this help message"