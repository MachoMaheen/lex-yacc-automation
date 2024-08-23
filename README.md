# lex-yacc-automation

## Overview

This project provides a Bash script/Cli to automate the compilation of Lex and Yacc programs. It simplifies the process of running Lex and Yacc, compiling the generated C files, and executing the output, all with a single command.

## Features

- Automatically detects and compiles Lex and Yacc files.
- Executes the generated output file with optional input redirection.
- Easy to use command-line interface.

## Requirements

- **Lex**: A lexical analyzer generator.
- **Yacc**: A parser generator.
- **GCC**: The GNU Compiler Collection.

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/lex-yacc-automation.git
   cd lex-yacc-automation

2. **Make the script executable**:
  ```bash
  chmod +x automate_lex_yacc.sh

3. **(Optional) Move the script to a directory in your PATH for easier access**:
  ```bash
  sudo mv automate_lex_yacc.sh /usr/local/bin/lex-yacc


## Usage

To use the script, simply run:

```bash
./automate_lex_yacc.sh [yacc_file.y] <lex_file.l> [output_file]


    - yacc_file.y: Optional. The Yacc file to be compiled.
    - lex_file.l: The Lex file to be compiled.
    - output_file: Optional. The input file to pass to the generated executable.

## Example
./automate_lex_yacc.sh example.y example.l input.txt



