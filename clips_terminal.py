import subprocess
from subprocess import Popen,PIPE


def start():
	clips_process = Popen('bash', shell=False, stdout=PIPE, stdin=PIPE, stderr=PIPE)
	clips_process.stdin.write("clips -f clips/main.CLP\n")
	return clips_process

def getQuestion(clips_process):
	question = ""
	while True:
		line = clips_process.stdout.readline()
		question += line
		if 'type' in line:
			print question
			return question

def giveAnswer(clips_process,answer):
	print answer
	clips_process.stdin.write(answer+'\n')


def terminal():
	clips_process = start()
	while True:
		question = getQuestion(clips_process)
		print(question)
		answer = raw_input("your answer : ")
		giveAnswer(clips_process,answer)

