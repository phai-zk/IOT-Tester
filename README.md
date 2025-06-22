# IOT-Tester

A comprehensive C programming testing framework for IoT programming courses. This project provides automated testing for 9 different programming quizzes with varying difficulty levels.

## 📋 Table of Contents

- [Overview](#overview)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Installation & Setup](#installation--setup)
- [How to Use](#how-to-use)
- [Quiz Levels](#quiz-levels)
- [Testing System](#testing-system)
- [Available Commands](#available-commands)
- [Troubleshooting](#troubleshooting)

## 🎯 Overview

IOT-Tester is an automated testing framework designed for C programming courses. It includes:

- **9 Programming Quizzes** with increasing difficulty
- **Cross-platform support** (Windows and Unix-based systems)
- **Automated test execution** with detailed output comparison
- **Comprehensive documentation** for each quiz
- **Utility libraries** for complex programming tasks

## 📁 Project Structure

```
IOT-Tester/
├── doc/                    # Quiz documentation files
├── quiz/                   # Quiz template files (quiz1.c - quiz9.c)
├── test_files/            # Reference implementations
│   ├── EZ/               # Easy level programs
│   ├── MD/               # Medium level programs
│   └── CZ/               # Complex level programs
├── utils/                 # Utility libraries and helper functions
├── obj_test_files/        # Compiled test executables
├── output_files/          # Test output files
├── temp/                  # Temporary files for testing
├── Makefile              # Build and automation script
├── run_test.sh           # Unix/Linux test runner
├── run_test.bat          # Windows test runner
└── README.md             # This file
```

## 🔧 Prerequisites

- **GCC Compiler** (GNU Compiler Collection)
- **Make** utility
- **Git** (for version control)
- **Bash** (for Unix/Linux systems)
- **PowerShell** (for Windows systems)

## 🚀 Installation & Setup

### 1. Clone the Repository
```bash
git clone <repository-url>
cd IOT-Tester
```

### 2. Initial Setup
Run the following command to set up the testing environment:

**For Unix/Linux/macOS:**
```bash
make init
```

**For Windows:**
```bash
make init
```

This command will:
- Create necessary directories
- Compile reference implementations
- Set up quiz workspace folders
- Copy quiz templates and documentation

### 3. Verify Installation
Check your OS detection and setup:
```bash
make os_info
```

## 📖 How to Use

### Step 1: Initialize the Project
```bash
make init
```

This creates the following structure in your parent directory:
```
../quiz1/
├── quiz1.c          # Your quiz template
└── testcase.txt     # Quiz documentation
../quiz2/
├── quiz2.c
└── testcase.txt
# ... and so on for quiz3-9
```

### Step 2: Work on Your Quizzes
Navigate to the quiz directory you want to work on:
```bash
cd ../quiz1
```

Edit the `quiz1.c` file with your solution. Read the `testcase.txt` file for requirements.

### Step 3: Compile Your Solution
```bash
cd ../IOT-Tester
make quiz1
```

### Step 4: Run Tests
```bash
make run_test_all
```

Or test a specific quiz:
```bash
make quiz1
```

## 🎓 Quiz Levels

The project includes 9 quizzes organized by difficulty:

### Easy Level (EZ)
- **Quiz 1**: Arcane Echo - Basic console output
- **Quiz 2**: Triangle Area - Mathematical calculations
- **Quiz 3**: Number Comparison - Conditional logic
- **Quiz 4**: Grade Calculator - Switch statements

### Medium Level (MD)
- **Quiz 5**: Multiplication Table - Loops and formatting
- **Quiz 6**: Prime Number Checker - Algorithm implementation
- **Quiz 7**: Pattern Printing - Nested loops and patterns

### Complex Level (CZ)
- **Quiz 8**: Minesweeper Game - Complex game logic with utilities
- **Quiz 9**: Tower of Hanoi - Recursive algorithms

## 🧪 Testing System

### Test Execution
The testing system:
1. Compiles your solution
2. Runs it with predefined test cases
3. Compares output with reference implementations
4. Generates detailed logs with pass/fail results

### Test Output
- **Green ✓**: Test passed
- **Red ✗**: Test failed
- Detailed logs are saved in `../quizX/log_X.txt`

### Test Cases
Each quiz includes multiple test cases covering:
- Normal inputs
- Edge cases
- Invalid inputs
- Boundary conditions

## 🛠️ Available Commands

### Setup Commands
```bash
make init          # Initial setup (setup + create workspace)
make setup         # Compile reference implementations only
make clean         # Remove all generated files
make reset         # Clean + init (fresh start)
```

### Testing Commands
```bash
make run_test_all  # Run all quiz tests
make quiz1         # Test quiz 1
make quiz2         # Test quiz 2
# ... and so on for quiz3-9
```

### Utility Commands
```bash
make os_info       # Show OS detection info
make update_lib    # Rebuild utility libraries
make recreate_quiz n=1  # Recreate specific quiz workspace
```

### Development Commands
```bash
make update        # Pull latest changes from git
make upload        # Commit and push changes
```

## 🔍 Troubleshooting

### Common Issues

**1. "make: command not found"**
- Install Make utility for your system
- On Windows: Install MinGW or use WSL

**2. "gcc: command not found"**
- Install GCC compiler
- Ensure it's added to your system PATH

**3. Permission denied errors (Unix/Linux)**
```bash
chmod +x run_test.sh
```

**4. Quiz compilation fails**
- Check your C syntax
- Ensure all required headers are included
- Verify function signatures match requirements

**5. Test failures**
- Compare your output with expected output in log files
- Check for formatting differences (spaces, newlines)
- Verify input handling for edge cases

### Getting Help

1. Check the quiz documentation in `doc/document_X.txt`
2. Review the reference implementation in `test_files/`
3. Examine test logs in `../quizX/log_X.txt`
4. Use `make os_info` to verify system detection

## 📝 Notes

- The project automatically detects your operating system
- Test scripts are optimized for both Windows and Unix systems
- All quiz solutions should be written in standard C
- The testing framework supports both interactive and file-based input
- Log files provide detailed debugging information

## 🤝 Contributing

This project is designed for educational purposes. If you find bugs or have suggestions:

1. Check existing issues
2. Create detailed bug reports
3. Test on multiple platforms
4. Follow the existing code style

---

**Happy Coding! 🎉**

*This testing framework is designed to help you master C programming through hands-on practice with real-world problems.*
