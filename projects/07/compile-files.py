import os
import subprocess
import stat

class color:
    RESET    = '\033[0m'
    BLACK    = '\033[30m'
    RED      = '\033[31m'
    GREEN    = '\033[32m'
    YELLOW   = '\033[33m'
    BLUE     = '\033[34m'
    MAGENTA  = '\033[35m'
    CYAN     = '\033[36m'
    WHITE    = '\033[97m'

languages = {
    'C#': { 
        "compile": ["dotnet", "build"], 
        "run": ["dotnet", "run"] 
    },
    'C++': {
        "compile": ["g++", "disassembler.cpp", "-o", "disassembler.exe" if os.name == 'nt' else "disassembler.out"],
        "run": []
    },
    'Java': {
        "compile": ["javac", "disassembler.java"],
        "run": ["java", "disassembler"]
    },
    'JavaScript': {
        "compile": [],
        "run": ["node", "disassembler.js"]
    },
    'Python': {
        "compile": [],
        "run": ["py" if os.name == 'nt' else "python3", "disassembler.py"]
    },
    'Rust': {
        "compile": ["rustc", "disassembler.rs", "-o", "disassembler.exe" if os.name == 'nt' else "disassembler.out"],
        "run": []
    }
}

testNames = [
    'Add',
    'Double',
    'Loop',
    'Neg'
]

def testScript(cwd, curLang):

    # Check if current language is in languages
    if curLang not in languages:
        return

    curLangDir = curLangDir = os.path.join(cwd, curLang)

    print(curLang) # Language that is being worked on

    # Compile Raw Code if the language needs to compile it's code  
    if len(languages[curLang]["compile"]) != 0:

        # Setup our compile command
        compileCommand = languages[curLang]["compile"]

        try:
            output = subprocess.run(compileCommand, cwd=curLangDir, capture_output=True).stdout.decode('utf-8')

            if(curLang in ['C++', 'Rust']):
                os.chmod(f"{curLangDir}/{languages[curLang]["compile"][3]}", stat.S_IRWXU)
        except FileNotFoundError:
            print(color.RED + f"{curLang} - {languages[curLang]["compile"][0]} is not installed" + color.RESET + "\n")
            return

        # Print out if Compiler succeeded and if it didn't, return
        if output == '':
            print(color.GREEN + f"{curLang} - Compiled successfully" + color.RESET + "\n")
        else:
            if 'Determining projects to restore...' in output:
                print(color.YELLOW + f"{curLang} - Skipped compiling" + color.RESET + "\n")
            else:
                print(color.RED + f"{curLang} - Compilation failed" + color.RESET + "\n")
                return
        
    # Run our code for each hack file we have
    for name in testNames:

        # Attempt to decompile all 4 hack files in language folder
        try:

            # Setup our run command with the hack file we want to test
            if(curLang in ['C++', 'Rust']):
                runCommand = [os.path.join(curLangDir, languages[curLang]["compile"][3])] + [name + '.hack']
            else:
                runCommand = languages[curLang]["run"] + [name + '.hack']

            output = subprocess.run(runCommand, cwd=curLangDir, capture_output=True).stdout.decode('utf-8')

            # Print out if Hack files were decompiled and if they didn't, return
            if output == '':
                print(color.GREEN + f"{curLang} - {name}.hack - Decompiled successfully" + color.RESET + "\n")
            else:
                print(color.RED + f"{curLang} - {name}.hack - Failed to decompile" + color.RESET + "\n")
                return
                
        # Print if the hack file could not be found
        except FileNotFoundError:
            print(color.RED + f"{curLang} - Executable not found for {curLang}" + color.RESET + "\n")
            return
        

            
# Get Current Working Directory for use later
cwd = os.getcwd()

langList = os.listdir(cwd)
langList.remove('clear-files.py')
langList.remove('test-files.py')
langList.remove('compile-files.py')
langList.remove('nand2tetris')

for lang in langList:
    testScript(cwd, lang)