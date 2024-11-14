import os

def removeFiles(cwd, curLang):
    print('Removing ASM Files - ' + curLang)

    curLangDir = cwd + '/' + curLang + '/'

    testNames = [
        'Add',
        'Double',
        'Loop',
        'Neg'
    ]

    for name in testNames:
        # Remove old files
        curLangAsm = curLangDir + name + '.asm'

        if os.path.exists(curLangAsm):
            os.remove(curLangAsm)

# Get Current Working Directory for use later
cwd = os.getcwd()

if not os.name == 'nt': 
    projectTool = cwd + '/nand2tetris/tools/CPUEmulator.sh'  
    os.chmod(projectTool, os.stat(projectTool).st_mode | 0o111)

langList = os.listdir(cwd)
langList.remove('clear-files.py')
langList.remove('test-files.py')
langList.remove('nand2tetris')

for lang in langList:
    removeFiles(cwd, lang)