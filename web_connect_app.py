
#!/usr/bin/env python

import os
from bottle import route, run, static_file, template, view
from bottle import get, post, request
import clips_terminal

clips_process = clips_terminal.start()

# -------------------STATIC START----------------------------
@route('/css/<filename>')
def img_static(filename):
	return static_file(filename, root='./static/css')

@route('/img/<filename>')
def img_static(filename):
	return static_file(filename, root='./static/img')

@route('/js/<filename>')
def js_static(filename):
	return static_file(filename, root='./static/js')
# -------------------STATIC END----------------------------





# -------------------VIEW START----------------------------
@route("/")
@view("web_connect")
def hello():
	while True:
		question = clips_terminal.getQuestion(clips_process)
		if 'type' in question:
			print '****ques****'
			if "type 2 " in question:
				print '****1/2****'
				return dict(title='Questions to User',user='Balu',amount=100,question=question,opt1="1",opt2="2")
			else:
				print '****yes/no****'
				return dict(title='Questions to User',user='Balu',amount=100,question=question,opt1="yes",opt2="no")
			
# -------------------VIEW END------------------------------

# -------------------DATA START----------------------------
@route('/',method="POST")
def recFacts():
	answer =  request.forms.get('q1')
	clips_terminal.giveAnswer(clips_process,answer)
	return hello()

# -------------------DATA END------------------------------


# -------------------MAIN START----------------------------
if __name__ == "__main__":
	port = int(os.environ.get("PORT", 5006))
	run(
	host='localhost',
	port=port,
	debug=True,
	reloader = True
	)
# -------------------MAIN END----------------------------
