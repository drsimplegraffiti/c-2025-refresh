### Hello world
```c
#include <stdio.h>  // Preprocessor directive

int main() {  
    printf("Hello, World!\n");  // Output function
    return 0;  // Indicating successful execution
}

```


### Variables
```c

#include <stdio.h>

int main(){
  int age = 89;
  char grade = 'A';
  char name[] = "Abayomi";
  float myHeight = 90.89f;
  double myWeight = 89.89;
  short int year = 2025;


  // constants
  const int MAX = 100;  // Constant variable

  printf("my age  is %d\n",age);
  printf("my name is %s\n", name);
  printf("My height is %f\n", myHeight);
  printf("In 2 Decimal places %.2f\n", myHeight);
  printf("My height %f\n", myWeight);
  printf("short is %d\n" ,year);

  return 0;
}

```


### Input and Output in C
```c
    // Check if input is valid
    if (scanf("%d", &age) != 1) {
        printf("Input error. Please enter a valid integer.\n");
        return 1;
    }

    printf("You are %d years old\n", age);
    return 0;
}


```

### Control flow
```a
#include <stdio.h>

int main() {
  int age = 90;

  if(age < 70){
    printf("imperfect");
    return 1;
  }else{
    printf("cool");
    return 0;
  }
  return 0;
}

```

### for loop
```c
#include <stdio.h>

int main() {
for(int i = 0; i < 10; i++){
    printf("i am %d\n", i);
  }
}


```

### while loop 
```c
#include <stdio.h>

int main() {
  int start = 0;
  while (start < 10) {
    printf("starting .... %d\n", start);
    start++;
  }
}


```


### void function
```c
#include <stdio.h>

void greet(){
  printf("hello there\n");
}

int main() {
  greet();
}

```

### return parameter
```c
#include <stdio.h>

int addNumber(int a, int b){
  return a + b;
}

int main() {
  int res = addNumber(8,8);
  printf("%d\n", res);
    return 0;
}


```

### Working with array
```c
#include <stdio.h>

int main() {
  int nums[6] = {1,2,3,4,5};
  printf("%d\n", nums[1]);
  return 0;
}


```

### Pointer
```c 
#include <stdio.h>

int main() {
  int age = 10;
  int *ptr = &age;
  printf("%d\n",*ptr);
  return 0;
}
```

### Struct
```c
#include <stdio.h>
#include <stdbool.h>  // Needed to use bool type in C

struct Person {
    int age;
    char name[60];
    bool isTall;  // Use bool from <stdbool.h> instead of "isTall boolean"
};

int main() {
    struct Person p1 = {1, "Johnson", true};
    // Print the details of p1. We need to format each field individually.
    printf("Person Details:\n");
    printf("Age: %d\n", p1.age);
    printf("Name: %s\n", p1.name);
    printf("Tall: %s\n", p1.isTall ? "true" : "false");  // Convert bool to string
    return 0;
}

```


### Write file
```c
#include <stdio.h>

int main() {
    // Open file in write mode ("w") so that we can write to it.
    FILE *fptr = fopen("test.txt", "w");
    if (fptr == NULL) {  // Check if the file was opened successfully.
        perror("Error opening file");
        return 1;
    }

    // Write to the file.
    fprintf(fptr, "Hello file");

    // Close the file.
    fclose(fptr);
    return 0;
}


```


### Read files
```c
#include <stdio.h>
#include <stdlib.h>

int main() {
    FILE *fptr = fopen("test.txt", "r");  // Open file in read mode
    if (fptr == NULL) {                   // Check if the file was opened successfully
        perror("Error opening file");
        return 1;
    }

    // Option 1: Read and print using fgets (line by line)
    char buffer[256];
    while (fgets(buffer, sizeof(buffer), fptr) != NULL) {
        printf("%s", buffer);
    }

    // If you prefer reading character by character, you can use fgetc:
    /*
    int ch;
    while ((ch = fgetc(fptr)) != EOF) {
        putchar(ch);
    }
    */

    fclose(fptr);  // Close the file
    return 0;
}

```


### Enums
```c
#include <stdio.h>

enum Color {
  RED,
  BLUE,
  GREEN
};


int main() {
  enum Color fav = GREEN;
  printf("%d\n", fav);
  return 0;
}


```


### Error handling
```c
#include <stdio.h>
#include <errno.h>
#include <string.h>

int openFile(const char *filename) {
    FILE *fptr = fopen(filename, "r"); // Open file in read mode
    if (fptr == NULL) {
        // Print a descriptive error message using perror
        perror("Error opening file");
        return -1;
    }
    // If the file is opened successfully, close it and return 0.
    fclose(fptr);
    return 0;
}

int main() {
    if (openFile("nonexistent.txt") != 0) {
        // Optionally, you can use strerror to get a string representation of errno.
        printf("Failed to open file: %s\n", strerror(errno));
    } else {
        printf("File opened successfully.\n");
    }
    return 0;
}


```


### Memory allocation
```c
#include <stdio.h>
#include <stdlib.h>

int main() {
    int *array = malloc(5 * sizeof(int));  // Allocate memory for 5 integers
    if (array == NULL) {
        perror("Memory allocation failed");
        return 1;
    }

    // Initialize and use the array
    for (int i = 0; i < 5; i++) {
        array[i] = i * 10;
    }
    for (int i = 0; i < 5; i++) {
        printf("array[%d] = %d\n", i, array[i]);
    }

    free(array);  // Free the allocated memory
    return 0;
}

```


### Import functions from different files
1. Create a Header File 
- Create a header file (e.g., add.h) that declares the function:
```c 
#ifndef ADD_H
#define ADD_H

// Declaration of the function that adds two numbers
int addTwoNumbers(int a, int b);

#endif // ADD_H

```

#ifndef ADD_H checks if the macro ADD_H is not defined.
#define ADD_H then defines ADD_H if it wasn't defined already.
The header file contents are processed only if ADD_H wasn't defined before.
#endif ends the conditional.

### Step 2: Define the Function in a Separate Source File
In another source file (e.g., add.c), include the header and define the function:
```c
#include "add.h"

int addTwoNumbers(int a, int b) {
    return a + b;
}

```

### Step 3: Use the Function in main.
In your main.c file, include the header file so that the compiler knows about the function prototype, then call the function:

```c
#include <stdio.h>
#include "add.h"  // Include the header with the function declaration

int main(void) {
    int result = addTwoNumbers(5, 3);
    printf("The sum is: %d\n", result);
    return 0;
}

```


### compile
```c
gcc main.c add.c -o myProgram
```


### Organize your code  
project/
│
├── main.c
└── math/
    ├── add.c
    └── add.h


- In math/add.h, you declare your function with include guards:
```c
#ifndef ADD_H
#define ADD_H

int addTwoNumbers(int a, int b);

#endif // ADD_H

```

- And in math/add.c, you define the function:
```c
#include "add.h"  // Notice that the include is relative to math/ folder

int addTwoNumbers(int a, int b) {
    return a + b;
}

```

- In main.c, you include the header file using the folder path:
```c
#include <stdio.h>
#include "math/add.h"  // Use the relative path to the header

int main(void) {
    int result = addTwoNumbers(5, 3);
    printf("The sum is: %d\n", result);
    return 0;
}

```

### Compiling the Project
When compiling, you must compile both main.c and math/add.c so that the linker can resolve the function definition. For example, using GCC from the project folder:
```c
gcc main.c math/add.c -o myProgram
```
