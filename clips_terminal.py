import subprocess
from subprocess import Popen,PIPE


def start():
	clips_process = Popen('bash', shell=False, stdout=PIPE, stdin=PIPE, stderr=PIPE)
	clips_process.stdin.write("clips -f2 clips/main.CLP\n")
	return clips_process

def terminate(clips_process):
	clips_process.terminate();

def restart(clips_process=None):
	if clips_process != None:
		terminate(clips_process)
	return start()

def getContent(clips_process):
	# print "getContent"
	
	content = ""
	while True:
		line = clips_process.stdout.readline()
		content += line.replace('_',' ').replace('/~','<b>').replace('~/','</b>').replace("||||-","<h4>").replace('-||||','</h4>').replace("|||-","<h3>").replace('-|||','</h3>').replace("||-","<h2>").replace('-||','</h2>').replace("|-","<h1>").replace('-|','</h1>').replace('/*','<small>').replace('*/','</small>').replace('^*','<sup>*</sup>') +'<br/>'
		
		if '(Yes/No)' in line or '(1/2)' in line or '(1/2/3)' in line or 'start?' in line:
			isQn = True
			print "Question : "+content
			return isQn,content
		
		if '~EndOfResult!' in line:
			print "EndOfResult : "+content
			isQn = False
			return isQn,content
		
def giveAnswer(clips_process,answer):
	if answer == 'No Preference':
		answer = 'n'
	elif answer == 'Start' or answer == 'Yes':
		answer = 'y'
	print answer
	clips_process.stdin.write(answer+'\n')

def giveSuggestion(clips_process,suggestion):
	print suggestion

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
			clips_process.kill()
			print 'process killed'
			return


# terminal()
