import os
import shutil
import subprocess

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


def testScript(cwd, scriptExt, curLang):
    print('Testing - ' + curLang)

    projectTool = cwd + '/nand2tetris/tools/CPUEmulator' + scriptExt
    projectDir = cwd + '/nand2tetris/projects/04/'
    curLangDir = cwd + '/' + curLang + '/'

    testNames = [
        'Add',
        'Double',
        'Loop',
        'Neg'
    ]

    fileExtensions = [
        '.asm',
        '.hack'
    ]

    for name in testNames:
        # Remove old files
        for ext in fileExtensions:
            curFile = projectDir + name.lower() + '/' + name + ext

            if os.path.exists(curFile):
                os.remove(curFile)

        # Copy language derived asm files
        curLangAsm = curLangDir + name + '.asm'

        curTestDir = projectDir + name.lower() + '/'
        
        curTestAsm = curTestDir + name + '.asm'
        curTest = curTestDir + name + '.tst'

        if os.path.exists(curLangAsm):
            shutil.copyfile(curLangAsm, curTestAsm)

        output = subprocess.run([projectTool, (curTest)], capture_output=True).stdout.decode('utf-8')
        if 'Comparison ended successfully' in output:
            print(color.GREEN + curLang + ' - ' + name + color.RESET)
        else:
            print(color.RED + curLang + ' - ' + name + color.RESET)

    print('')

# Set script extension type based on OS (Windows | Unix)
scriptExt = {True: '.bat', False: '.sh'} [os.name == 'nt']

# Get Current Working Directory for use later
cwd = os.getcwd()

langList = os.listdir(cwd)
langList.remove('clear-files.py')
langList.remove('test-files.py')
langList.remove('nand2tetris')

for lang in langList:
    testScript(cwd, scriptExt, lang)