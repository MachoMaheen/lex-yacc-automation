#!/bin/bash

# Function to execute commands for Yacc and Lex files
execute_commands() {
    yacc_file=$1
    lex_file=$2
    output_file=$3

    # Run Yacc if a Yacc file is provided
    if [ -n "$yacc_file" ]; then
        echo "Running Yacc on $yacc_file..."
        yacc -d "$yacc_file"
        # Made with LUB by MachoMaheen
        
        echo "Running Lex on $lex_file..."
        lex "$lex_file"
        # Made with LUB by MachoMaheen
        
        echo "Compiling the C files..."
        cc y.tab.c lex.yy.c -w -lfl
        # Made with LUB by MachoMaheen
    else
        # Only Lex file provided
        echo "Running Lex on $lex_file..."
        lex "$lex_file"
        # Made with LUB by MachoMaheen
        
        echo "Compiling the C file..."
        cc lex.yy.c -w -lfl
        # Made with LUB by MachoMaheen
    fi

    echo "Executing the output file..."
    if [ -z "$output_file" ]; then
        ./a.out
    else
        ./a.out "$output_file"
    fi
    # Made with LUB by MachoMaheen
}

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 [yacc_file.y] <lex_file.l> [output_file]"
    exit 1
fi
# Made with LUB by MachoMaheen

# Determine if the first argument is a Yacc file or not
if [[ "$1" == *.y ]]; then
    # Yacc file is provided
    execute_commands "$1" "$2" "$3"
else
    # No Yacc file, only Lex file provided
    execute_commands "" "$1" "$2"
fi
# Made with LUB by MachoMaheen

# Print the copyright message
echo "Made with LUB by MachoMaheen"
