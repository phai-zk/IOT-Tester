#!/bin/bash
YOUR_FILES_PATH="../"
OBJ_PATH="./obj_test_files"
OUTPUT_PATH="./output_files"
INPUT_PATH="./temp"
LOG_PATH="./log_files"

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Function to run a test case
run_test_case() {
	local input="$1"
	local test="$2"

	# Run the program with input
	echo -e "$input" >$INPUT_PATH/temp_input.txt

	echo "Test $test Quiz2 Log:"
	# Run user's program
	$OBJ_PATH/quiz$QUIZ/quiz$QUIZ.out <$INPUT_PATH/temp_input.txt >$OUTPUT_PATH/quiz$QUIZ/user_output.txt

	# Run test program silently
	$OBJ_PATH/quiz$QUIZ/test_quiz$QUIZ <$INPUT_PATH/temp_input.txt >$OUTPUT_PATH/quiz$QUIZ/test_output.txt

	# Compare outputs
	diff_output=$(diff -y --width=200 $OUTPUT_PATH/quiz$QUIZ/user_output.txt $OUTPUT_PATH/quiz$QUIZ/test_output.txt)
	status=$?

	# Get the outputs and escape special characters
	local user_output=$(cat user_output.txt | sed 's/"/\\"/g' | sed ':a;N;$!ba;s/\n/\\n/g')
	local test_output=$(cat test_output.txt | sed 's/"/\\"/g' | sed ':a;N;$!ba;s/\n/\\n/g')
	
		echo "- ================ YOUR OUTPUT ==================== + ================ TEST OUTPUT ===================="
		echo "$diff_output"

	if [ $status -eq 0 ]; then
		echo -n "${GREEN} ✓ ${NC}" >&2
		echo "=============================================   SUCCESS   =============================================="
	else
		echo -n "${RED} ✗ ${NC}" >&2
		echo "=============================================     FAIL    =============================================="
	fi
}

test_traffics() {
	rm -f $LOG_PATH/*
	q=$1
	case "$q" in
	1)
		echo "=== Quiz 1 ==="
		echo -n "Test:"

		test1=$(quiz1_test)

		test_results="$test1"
		echo "$test_results" >$LOG_PATH/log_$q.txt
		rm -f $OBJ_PATH/quiz$QUIZ/quiz$QUIZ.out
		;;
	2)
		echo "== Quiz 2 =="
		echo -n "Test: "
		test1=$(run_test_case "5\n1" 1)
		test2=$(run_test_case "3\n10" 2)
		test_results="$test1\n$test2"
		echo "$test_results" >$LOG_PATH/log_$q.txt
		echo
		;;
	*)
		echo "== Quiz $q =="
		echo "Test: Not implemented yet"
		;;
	esac
}

quiz1_test() {
	# Run user's program with input
	$OBJ_PATH/quiz$QUIZ/quiz$QUIZ.out >$OUTPUT_PATH/quiz$QUIZ/user_output.txt
	echo "Test Quiz1 Log:"
	echo "====================== FILES OUTPUT ======================"
	cat -e $OUTPUT_PATH/quiz$QUIZ/user_output.txt
	if [ -s $OUTPUT_PATH/quiz$QUIZ/user_output.txt ]; then
		echo -n "${GREEN} ✓ ${NC}" >&2
		echo "======================    SUCCESS   ====================== "
	else
		echo -n "${RED} ✗ ${NC}" >&2
		echo "======================      FAIL    ====================== "
	fi
	echo
	rm -f $OUTPUT_PATH/quiz$QUIZ/user_output.txt
}

QUIZ=$1

if [ -z "$QUIZ" ]; then
	for i in {1..10}; do
		gcc $YOUR_FILES_PATH/quiz$i/quiz$i.c -o $OBJ_PATH/quiz$i/quiz$i.out 2>compile_error.txt
		if [ $? -ne 0 ]; then
			echo -e "${RED}Debug: Compilation failed${NC}"
			echo -e "${RED}Debug: Compile error: $(cat compile_error.txt)${NC}"
			rm -f compile_error.txt
			exit 1
		fi
		rm -f error.txt
		test_traffics $i
	done
else
	gcc $YOUR_FILES_PATH/quiz$QUIZ/quiz$QUIZ.c -o $OBJ_PATH/quiz$QUIZ/quiz$QUIZ.out 2>compile_error.txt

	if [ $? -ne 0 ]; then
		echo -e "${RED}Debug: Compilation failed${NC}"
		echo -e "${RED}Debug: Compile error: $(cat compile_error.txt)${NC}"
		rm -f compile_error.txt
		exit 1
	fi
	echo "${GREEN}Compilation successful, running test cases${NC}"
	test_traffics $QUIZ

fi
