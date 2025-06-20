#!/bin/bash
YOUR_FILES_PATH=".."
OBJ_PATH="./obj_test_files"
OUTPUT_PATH="./output_files"
INPUT_PATH="./temp"
LIB="./utils"
SPECIAL_TEST_PATH=$LIB/special_test/quiz8_test.c
# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to run a test case
run_test_case() {
	local input="$1"
	local test="$2"

	# Run the program with input
	echo "$input" >$INPUT_PATH/temp_input.txt

	echo "Test $test Quiz2 Log"
	# Run user's program
	$OBJ_PATH/quiz$QUIZ/quiz$QUIZ.out <$INPUT_PATH/temp_input.txt >$OUTPUT_PATH/quiz$QUIZ/user_output.txt

	# Run test program silently
	$OBJ_PATH/quiz$QUIZ/test_quiz$QUIZ <$INPUT_PATH/temp_input.txt >$OUTPUT_PATH/quiz$QUIZ/test_output.txt

	# Compare outputs
	diff_output=$(diff -u $OUTPUT_PATH/quiz$QUIZ/user_output.txt $OUTPUT_PATH/quiz$QUIZ/test_output.txt)
	status=$?

	echo "================= OUTPUT TEST $test ===================="

	if [ $status -eq 0 ]; then
		echo "$(cat -e $OUTPUT_PATH/quiz$QUIZ/test_output.txt)"
		echo -n "${GREEN}$test)✓ ${NC}" >&2
		echo "===================== SUCCESS ======================="
	else
		echo "$diff_output"
		echo -n "${RED}$test)✗ ${NC}" >&2
		echo "=====================   FAIL  ======================="
	fi
}

test_traffics() {
	q=$1
	LOG_FILE=$YOUR_FILES_PATH/quiz$q/log_$q.txt
	rm -f $LOG_FILE
	case "$q" in
	1)
		echo -n "Test: "

		test1=$(quiz1_test)

		test_results="$test1"
		echo "$test_results" >$LOG_FILE
		echo
		rm -f $OBJ_PATH/quiz$QUIZ/quiz$QUIZ.out
		;;
	2)
		echo -n "Test: "

		test1=$(run_test_case "5\n5" 1)
		test2=$(run_test_case "100\n10" 2)
		test3=$(run_test_case "3325\n15" 3)
		test4=$(run_test_case "2141241\n21312" 4)
		test5=$(run_test_case "213\na" 5)
		test6=$(run_test_case "324234\n0" 6)
		test7=$(run_test_case "21241\n4323" 7)
		test8=$(run_test_case "51\n2147483647" 8)
		test_results="$test1\n\n$test2\n\n$test3\n\n$test4\n\n$test5\n\n$test6\n\n$test7\n\n$test8"
		echo "$test_results" >$LOG_FILE
		rm -f $OBJ_PATH/quiz$QUIZ/quiz$QUIZ.out $OUTPUT_PATH/quiz$QUIZ/*
		echo
		;;
	3)
		echo -n "Test: "

		test1=$(run_test_case "12\n7" 1)
		test2=$(run_test_case "88\n42" 2)
		test3=$(run_test_case "999\n123" 3)
		test4=$(run_test_case "56\n78" 4)
		test5=$(run_test_case "2147483647\2147483649" 5)
		test6=$(run_test_case "0\n9999" 6)
		test7=$(run_test_case "42\2141241-1" 7)
		test8=$(run_test_case "apple\n314" 8)
		test_results="$test1\n\n$test2\n\n$test3\n\n$test4\n\n$test5\n\n$test6\n\n$test7\n\n$test8"
		echo "$test_results" >$LOG_FILE
		rm -f $OBJ_PATH/quiz$QUIZ/quiz$QUIZ.out $OUTPUT_PATH/quiz$QUIZ/*
		echo
		;;
	4)
		echo -n "Test: "

		test1=$(run_test_case "50" 1)
		test2=$(run_test_case "80" 2)
		test3=$(run_test_case "1000" 3)
		test4=$(run_test_case "2141241" 4)
		test5=$(run_test_case "10" 5)
		test6=$(run_test_case "-5" 6)
		test7=$(run_test_case "60" 7)
		test8=$(run_test_case "51" 8)
		test9=$(run_test_case "68" 9)
		test10=$(run_test_case "98" 10)
		test11=$(run_test_case "76" 11)
		test12=$(run_test_case "100" 12)
		test13=$(run_test_case "72" 13)
		test_results="$test1\n\n$test2\n\n$test3\n\n$test4\n\n$test5\n\n$test6\n\n$test7\n\n$test8\n\n$test9\n\n$test10\n\n$test11\n\n$test12\n\n$test13"
		echo "$test_results" >$LOG_FILE
		rm -f $OBJ_PATH/quiz$QUIZ/quiz$QUIZ.out $OUTPUT_PATH/quiz$QUIZ/*
		echo
		;;
	5)
		echo -n "Test: "

		test1=$(run_test_case "10" 1)
		test2=$(run_test_case "8" 2)
		test3=$(run_test_case "12" 3)
		test4=$(run_test_case "80" 4)
		test5=$(run_test_case "100" 5)
		test6=$(run_test_case "500" 6)
		test7=$(run_test_case "\0" 7)
		test8=$(run_test_case "A" 8)
		test9=$(run_test_case "654522" 9)
		test_results="$test1\n\n$test2\n\n$test3\n\n$test4\n\n$test5\n\n$test6\n\n$test7\n\n$test8\n\n$test9"
		echo "$test_results" >$LOG_FILE
		rm -f $OBJ_PATH/quiz$QUIZ/quiz$QUIZ.out $OUTPUT_PATH/quiz$QUIZ/*
		echo
		;;
	6)
		echo -n "Test: "

		test1=$(run_test_case "101" 1)
		test2=$(run_test_case "997" 2)
		test3=$(run_test_case "123456" 3)
		test4=$(run_test_case "7919" 4)
		test5=$(run_test_case "10201" 5)
		test6=$(run_test_case "10001" 6)
		test7=$(run_test_case "1223" 7)
		test8=$(run_test_case "104730" 8)
		test9=$(run_test_case "104729" 9)
		test10=$(run_test_case "100000000" 10)
		test_results="$test1\n\n$test2\n\n$test3\n\n$test4\n\n$test5\n\n$test6\n\n$test7\n\n$test8\n\n$test9\n\n$test10"
		echo "$test_results" >$LOG_FILE
		rm -f $OBJ_PATH/quiz$QUIZ/quiz$QUIZ.out $OUTPUT_PATH/quiz$QUIZ/*
		echo
		;;
	7)
		echo -n "Test: "

		test1=$(run_test_case "5" 1)
		test2=$(run_test_case "2" 2)
		test3=$(run_test_case "3" 3)
		test4=$(run_test_case "6" 4)
		test5=$(run_test_case "9" 5)
		test6=$(run_test_case "15" 6)
		test7=$(run_test_case "11" 7)
		test8=$(run_test_case "20" 8)
		test_results="$test1\n\n$test2\n\n$test3\n\n$test4\n\n$test5\n\n$test6\n\n$test7\n\n$test8"
		echo "$test_results" >$LOG_FILE
		rm -f $OBJ_PATH/quiz$QUIZ/quiz$QUIZ.out $OUTPUT_PATH/quiz$QUIZ/*
		echo
		;;
	8)
		echo -n "Test: "

		test1=$(run_test_case "" 1)
		test2=$(run_test_case "" 2)
		test3=$(run_test_case "" 3)
		test4=$(run_test_case "" 4)
		test5=$(run_test_case "" 5)
		test6=$(run_test_case "" 6)
		test7=$(run_test_case "" 7)
		test8=$(run_test_case "" 8)
		test_results="$test1\n\n$test2\n\n$test3\n\n$test4\n\n$test5\n\n$test6\n\n$test7\n\n$test8\n\n$test9\n\n$test10"
		echo "$test_results" >$LOG_FILE
		rm -f $OBJ_PATH/quiz$QUIZ/quiz$QUIZ.out $OUTPUT_PATH/quiz$QUIZ/*
		echo
		;;
	9)
		echo -n "Test: "

		test1=$(run_test_case "3" 1)
		test2=$(run_test_case "4" 2)
		test3=$(run_test_case "5" 3)
		test4=$(run_test_case "6" 4)
		test_results="$test1\n\n$test2\n\n$test3\n\n$test4"
		echo "$test_results" >$LOG_FILE
		rm -f $OBJ_PATH/quiz$QUIZ/quiz$QUIZ.out $OUTPUT_PATH/quiz$QUIZ/*
		echo
		;;
	*)
		echo "${RED}Test: Not implemented yet${NC}"
		exit 0
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
		echo -n "${GREEN}1)✓ ${NC}" >&2
		echo "======================    SUCCESS   ====================== "
	else
		echo -n "${RED}1)✗ ${NC}" >&2
		echo "======================      FAIL    ====================== "
	fi
	echo
	rm -f $OUTPUT_PATH/quiz$QUIZ/user_output.txt
}

QUIZ=$1

if [ $QUIZ -eq 8 ]; then
	gcc $SPECIAL_TEST_PATH $YOUR_FILES_PATH/quiz$QUIZ/quiz$QUIZ.c $LIB/utils.a -o $OBJ_PATH/quiz$QUIZ/quiz$QUIZ.out 2>compile_error.txt
else
	gcc $YOUR_FILES_PATH/quiz$QUIZ/quiz$QUIZ.c -o $OBJ_PATH/quiz$QUIZ/quiz$QUIZ.out 2>compile_error.txt
fi
echo "${YELLOW}================= Quiz $QUIZ ====================${NC}"

if [ $? -ne 0 ]; then
	echo -e "${RED}Debug: Compilation failed${NC}"
	echo -e "${RED}Debug: Compile error: $(cat compile_error.txt)${NC}"
	rm -f compile_error.txt
	exit 1
else
	rm -rf ${OUTPUT_PATH}
	mkdir ${OUTPUT_PATH}
	for i in $(seq 1 10); do
		mkdir ${OUTPUT_PATH}/quiz$i
	done
	test_traffics $QUIZ
	echo "${BLUE}Log files are in $YOUR_FILES_PATH/quiz$QUIZ/log_$QUIZ.txt${NC}"
fi

if [ -f compile_error.txt ]; then
	rm -f compile_error.txt
fi
