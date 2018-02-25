import subprocess
from subprocess import Popen,PIPE


def start():
	clips_process = Popen('bash', shell=False, stdout=PIPE, stdin=PIPE, stderr=PIPE)
	clips_process.stdin.write("clips -f clips/main.CLP\n")
	return clips_process

def getContent(clips_process):
	content = ""
	while True:
		line = clips_process.stdout.readline()
		content += line
		
		if '(yes/no)' in line or '(1/2)' in line or '(1/2/3)' in line:
			isQn = True
			return isQn,content
		
		if 'Mobile Expenditure is ' in line:
			isQn = False
			return isQn,content

def giveAnswer(clips_process,answer):
	print answer
	clips_process.stdin.write(answer+'\n')

def giveSuggestion(clips_process,suggestion):
	print suggestion
	clips_process.kill()

def terminal():
	clips_process = start()
	while True:
		isQn,content = getContent(clips_process)
		if isQn:
			print(content)
			answer = raw_input("your answer : ")
			giveAnswer(clips_process,answer)
		else:
			giveSuggestion(clips_process,content)
			return
# terminal()