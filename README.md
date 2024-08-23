
# lex-yacc-automation

This project provides a Bash script/CLI to automate the compilation of Lex and Yacc programs. It simplifies the process of running Lex and Yacc, compiling the generated C files, and executing the output, all with a single command.

## Features
- Automatically detects and compiles Lex and Yacc files.
- Executes the generated output file with optional input redirection.
- Easy to use command-line interface.

## Requirements
- **Lex**: A lexical analyzer generator.
- **Yacc**: A parser generator.
- **GCC**: The GNU Compiler Collection.

## Installation and Usage
To install and use the script:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/lex-yacc-automation.git
   cd lex-yacc-automation
   ```

2. **Make the script executable**:
   ```bash
   chmod +x automate_lex_yacc.sh
   ```

3. **(Optional) Move the script to a directory in your PATH for easier access**:
   ```bash
   sudo mv automate_lex_yacc.sh /usr/local/bin/lex-yacc
   ```

4. **To use the script, simply run**:
   ```bash
   ./automate_lex_yacc.sh [yacc_file.y] <lex_file.l> [output_file]
   ```
   - `yacc_file.y`: Optional. The Yacc file to be compiled.
   - `lex_file.l`: The Lex file to be compiled.
   - `output_file`: Optional. The input file to pass to the generated executable.

5. **Example**:
   ```bash
   ./automate_lex_yacc.sh example.y example.l input.txt
   ```

## Example Usage

### Sample Files

**Lex File (`example.l`):**
```c
%{
#include <stdio.h>
%}
%%
[0-9]+    { printf("Number: %s\n", yytext); }
[a-zA-Z]+  { printf("Word: %s\n", yytext); }
.         { /* Ignore other characters */ }
%%
int yywrap() { return 1; }
```

**Yacc File (`example.y`):**
```c
%{
#include <stdio.h>
#include <stdlib.h>
%}
%%
input: /* empty */
    | input line
    ;
line: '\n'
    | expr '\n' { printf("Result: %d\n", $1); }
    ;
expr: NUMBER { $$ = $1; }
    | expr '+' NUMBER { $$ = $1 + $3; }
    ;
%%

int main(void) {
    yyparse();
    return 0;
}
```

**Input File (`input.txt`):**
```
123
abc
456 + 789
```

### Running the Script

To compile and execute the Lex and Yacc files with the provided input:

```bash
./automate_lex_yacc.sh example.y example.l input.txt
```

### Output

The script will generate and run an executable, producing output similar to:

```
Word: abc
Number: 123
Result: 123
Number: 456
Number: 789
Result: 123 + 789 = 912
```


In this example:
- **`example.l`** is a Lex file that identifies numbers and words.
- **`example.y`** is a Yacc file that parses simple arithmetic expressions.
- **`input.txt`** contains sample input data to be processed by the generated executable.

The output demonstrates how the script processes the input and displays results based on the Lex and Yacc files.
