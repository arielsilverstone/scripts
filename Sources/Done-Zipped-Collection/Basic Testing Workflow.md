---
name: Basic Testing Workflow
---
description: create a test environment under D:\Program Files\Dev\Tools\Labs for testing
---
trigger: user request
---

Detail:
    1. create a test environment under D:\Program Files\Dev\Tools\Labs for testing
    2. Name the env per your project name. failing that, ask the user for a name
    3. copy the proper templates from \labs to your new environment into a templates folder
    4. copy the proper files from the project directory into a basic dev folder structure if not defined in the template.
    5. Review all copied code files:
         a. examine for any dir setting REQUIREMENT and if there beyond what you set up create these directories.
         b. find hardcoded paths and replace with variables which will refer to the correct path within the testing environment.
         c. define those variable around the top of the file. if there is a var def section, put it there.
         d. create an index.json to include every function, method, etc in each file.  place it in the root of
            of your env directory.
    6. for any future searches, refer to the index.json first.
    7. Run each file, creating a projectname-testnumber.log formmated as text including:
         a. time in HH:mm format and date in DDMMMYY format
         b. the testing current attempt number.
         c. HH:mm: next to any errors, their source file, source lines, etc
         d. put all errors for all files involved in that specific test into the same log file.
    8. after test completes, create an .md document named with projectname-testnumber.md and place it in the root of the test environment. include the following information:
         a. time in HH:mm format and date in DDMMMYY format
         b. the testing current attempt number.
         d. for each file in the log, a summary of the errors found,
         e. and then suggestions how to fix each.
         f. in a future section list for each files the percentage of sections/functions/ etc that passed out of possible 100%.
         g. in a futher section detail for each file with errors:
            1. the full path and name of the file.
            2. a list including which items caused each error.
            3. suggestion how to fix each error
            4. if a suggestion is applicable to more than one error in the same file, list suggestions after
all error listed; otherwise list suggestion after each error.
